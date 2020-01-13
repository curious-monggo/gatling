<?php
//http://traveljolly.com/api/ld_affiliate/
require '../base.php';
require '../lead_dyno.cfg.php';

function Post() {

    try 
    {
        
        $payload = getPayload();
        $payload["affiliate_code"] = generateGuid();
        $afmc = $payload["affiliate_code"];
        //take $contact_id and get prospect's contact record's to use _AFFemail in CreateLead
        $prospectContactResult = GetContactByContactId($payload['Contact_Id']);//get prospect to check for afmc and for data later
        if (isset($prospectContactResult[0]["_LeadDYNOafmc"]) && $prospectContactResult[0]["_LeadDYNOafmc"] != "")
            $afmc = $prospectContactResult[0]["_LeadDYNOafmc"];

 //NO MORE LD       $ld_response = WriteAffiliate($payload);
 //echo "assigned aff-code:".$payload["affiliate_code"];
 //echo "ld response:".print_r($ld_response)."  ";//does not have afmc in affiliate_url any longer
 //NO MORE LD       $createLeadResponse = CreateLead($prospectContactResult, $payload['Contact_Id'], $payload["affiliate_code"], $payload["email"], $payload["first_name"], $payload["last_name"], $ld_response["id"]);
        
        // //update contact with leaddyno info
        $app = new iSDK;
        $app->cfgCon("connection");
        $update = array();
        //NOTE: this logic breaks if LeadDyno uses tiny url as it does not have the afmc value
        //there is a setting in LeadDyno for that
        //check to see if lead dyno already has this record by comparing the lead dyno afmc value to the newly assigned affiliate_code
        //and if they are not the same then LeadDyno had this lead prior to this call because if they were the same then
        //LeadDyno would have used the value we passed
//NO MORE LD        $ld_Afmc = getValueFromStringUrl($ld_response["affiliate_url"], "afmc");
$ld_Afmc = $afmc;
        //if ($afmc == $ld_Afmc) //if equal then the contact does not already have one so update it
        //{
            //echo "random:".bin2hex(openssl_random_pseudo_bytes(8));

            try {
    //echo "updating contact:".$payload['Contact_Id'] . " afmc:".$afmc;
                // NO MORE LD $update = array(
                //     'Id' => $payload['Contact_Id'],
                //     '_LeadDynoSSO0' => $ld_response["affiliate_dashboard_url"], //- Single Sign On Link or Auto Signin Link
                //     '_LeadDynoAffiliateLink' => $ld_response["affiliate_url"],
                //     '_TinyTJURL' => getTinyUrl($ld_response["affiliate_url"], bin2hex(openssl_random_pseudo_bytes(8)), $ld_Afmc), //Affiliate Link
                //     '_LeadDYNOafmc' => $ld_Afmc
                // );
                $leadDynoAffiliateLink = "https://www.traveljolly.com/let-us-pay-for-your-trip-or-at-least-part-of-it.html?utm_source=affiliate&utm_medium=social&utm_campaign=leads&utm_content=get-your-249-gift-card-free&afmc=".$ld_Afmc;
                $update = array(
                    'Id' => $payload['Contact_Id'],
                    '_LeadDynoAffiliateLink' => $leadDynoAffiliateLink,
                    '_TinyTJURL' => getTinyUrl($leadDynoAffiliateLink, bin2hex(openssl_random_pseudo_bytes(8)), $ld_Afmc), //Affiliate Link
                    '_LeadDYNOafmc' => $ld_Afmc
                );
                if (!isset($update["Id"]) || empty($update["Id"]))
                    throw new Exception('Contact Id not provided. Update fails.');

                $updateCon = $app->dsUpdate("Contact", $payload['Contact_Id'], $update);



            } catch(Exception $exception) {
                throw new Exception("error:".$exception->getMessage());
            }
        
        //}
        ouputHeader("200", "Ok");
       //NO MORE LD returnResponse($ld_response);
       returnResponse($ld_Afmc);
    }
    catch(Exception $e) {
        ouputHeader("400", "Bad Request");
        returnResponse("error: " . $e->getMessage());
    }
    finally {
        die();
    }

}
function CreateLead($prospectContactResult, $contact_id, $affiliate_code, $email, $first_name, $last_name, $affiliate_id) {
//take $contact_id and get prospect's contact record's _AFFemail
    //$prospectContactResult = GetContactByContactId($contact_id);
//use _AFFemail to get affiliate's LeadDYNOafmc.
    $affiliateContactResult = GetContactByEmail($prospectContactResult[0]["_AFFemail"]);
//use the affiliate's LeadDYNOafmc to pass to create lead as tracking_code
//check if lead already exists if so do update
    $leadDynoLeadResponse = GetLeadDynoLeadByEmail($email);//getting lead by email does not seem to work
//echo "ld_leadresponse:".print_r($leadDynoLeadResponse);
    if (isset($leadDynoLeadResponse["id"]))
    {
        //UpdateLead(($leadDynoLeadResponse["id"], $contact_id, $affiliateContactResult[0]["_LeadDYNOafmc"], $email, $first_name, $last_name, $affiliateContactResult[0]["_LeadDYNOafmc"])
    }
    else {
//echo "afmcxxxx:".$affiliateContactResult[0]["_LeadDYNOafmc"]."   ";
        $writeLeadResponse = WriteLead($affiliateContactResult[0]["_LeadDYNOafmc"], $email, $first_name, $last_name, $affiliateContactResult[0]["_LeadDYNOafmc"]);
        return $writeLeadResponse;
        //echo "write response:".print_r($writeLeadResponse)."   ";
    }
    

}
function UpdateLead($lead_Id, $contact_id, $affiliate_code, $email, $first_name, $last_name, $tracking_code) {
    $data_string = "";
    include('../lead_dyno.cfg.php');
    $data_string['key'] = $leadDynoPrivateKey;
    $data_string["code"] = $affiliate_code;//$affiliate_id;
    $data_string["email"] = $email;
    $data_string["first_name"] = $first_name;
    $data_string["last_name"] = $last_name;
    $data_string["tracking_code"] = $tracking_code;//$affiliate_code;
    $data_string = json_encode($data_string);
    try
    {
        $ch = curl_init($leadDynoLeadsUrl."/".$lead_Id);                                                                      
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "PUT");                                                                     
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data_string);                                                                  
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);                                                                      
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(                                                                          
            'Content-Type: application/json',                                                                                
            'Content-Length: ' . strlen($data_string))                                                                       
        );                                                                                                                   
        $ld_json = curl_exec($ch);
        $ld_LeadResponse = json_decode($ld_json, TRUE);
        if ($ld_LeadResponse["error"] != undefined && !empty($ld_LeadResponse["error"]))
            throw new Exception($ld_LeadResponse["error"]);

        if ($error = json_last_error())
        {
            $errorReference = [
                JSON_ERROR_DEPTH => 'The maximum stack depth has been exceeded.',
                JSON_ERROR_STATE_MISMATCH => 'Invalid or malformed JSON.',
                JSON_ERROR_CTRL_CHAR => 'Control character error, possibly incorrectly encoded.',
                JSON_ERROR_SYNTAX => 'Syntax error.',
                JSON_ERROR_UTF8 => 'Malformed UTF-8 characters, possibly incorrectly encoded.',
                JSON_ERROR_RECURSION => 'One or more recursive references in the value to be encoded.',
                JSON_ERROR_INF_OR_NAN => 'One or more NAN or INF values in the value to be encoded.',
                JSON_ERROR_UNSUPPORTED_TYPE => 'A value of a type that cannot be encoded was given.',
            ];
            $errStr = isset($errorReference[$error]) ? $errorReference[$error] : "Unknown error ($error)";
            throw new Exception("JSON decode error (" . $error . "): " . $errStr );
        }
        return $ld_LeadResponse;
    }
    catch(Exception $e) {
        ouputHeader("400", "Bad Request");
        return "error: " . $e->getMessage();
    }
    finally {
        curl_close ($ch);
    }
}
function WriteAffiliate($payload) {
    spl_autoload_register('ld_affiliates_autoloader');
    $Entity = new ld_affiliate();
    $result = NULL;
    try {

        include('../lead_dyno.cfg.php');
        $payload['key'] = $leadDynoPrivateKey;
       
        $data_string = $payload;
        unset($data_string["id"]);
        unset($data_string["Contact_Id"]);
        $data_string = json_encode($data_string);
        //write the affiliate record
        $ch = curl_init($leadDynoAffiliateUrl);                                                                      
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");                                                                     
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data_string);                                                                  
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);                                                                      
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(                                                                          
            'Content-Type: application/json',                                                                                
            'Content-Length: ' . strlen($data_string))                                                                       
        );                                                                                                                   
        $ld_json = curl_exec($ch);
        $ld_response = json_decode($ld_json, TRUE);
        if (isset($ld_response["error"]) && !empty($ld_response["error"]))
            throw new Exception($ld_response["error"]);
        if (!isset($ld_response["affiliate_url"]))
            throw new Exception("LeadDyno response does not contain affiliate url.");

        if ($error = json_last_error())
        {
            $errorReference = [
                JSON_ERROR_DEPTH => 'The maximum stack depth has been exceeded.',
                JSON_ERROR_STATE_MISMATCH => 'Invalid or malformed JSON.',
                JSON_ERROR_CTRL_CHAR => 'Control character error, possibly incorrectly encoded.',
                JSON_ERROR_SYNTAX => 'Syntax error.',
                JSON_ERROR_UTF8 => 'Malformed UTF-8 characters, possibly incorrectly encoded.',
                JSON_ERROR_RECURSION => 'One or more recursive references in the value to be encoded.',
                JSON_ERROR_INF_OR_NAN => 'One or more NAN or INF values in the value to be encoded.',
                JSON_ERROR_UNSUPPORTED_TYPE => 'A value of a type that cannot be encoded was given.',
            ];
            $errStr = isset($errorReference[$error]) ? $errorReference[$error] : "Unknown error ($error)";
            throw new Exception("JSON decode error (" . $error . "): " . $errStr );
        }
//echo "assigned aff-code:".$payload["affiliate_code"];
//echo "ld response:".print_r($ld_response)."  ";//does not have afmc in affiliate_url any longer

        return $ld_response;
    }
    catch(Exception $e) {
        ouputHeader("400", "Bad Request");
        returnResponse("error: " . $e->getMessage());
    }
    finally {
        curl_close ($ch);

    }
}
function WriteLead($affiliate_code, $email, $first_name, $last_name, $tracking_code) {
    $data_string = "";
    include('../lead_dyno.cfg.php');
    $data_string['key'] = $leadDynoPrivateKey;
    $data_string["code"] = $affiliate_code;//$affiliate_id;
    $data_string["email"] = $email;
    $data_string["first_name"] = $first_name;
    $data_string["last_name"] = $last_name;
    $data_string["tracking_code"] = $tracking_code;//$affiliate_code;
    $data_string = json_encode($data_string);
    try
    {
        $ch = curl_init($leadDynoLeadsUrl);                                                                      
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");                                                                     
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data_string);                                                                  
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);                                                                      
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(                                                                          
            'Content-Type: application/json',                                                                                
            'Content-Length: ' . strlen($data_string))                                                                       
        );                                                                                                                   
        $ld_json = curl_exec($ch);
        $ld_LeadResponse = json_decode($ld_json, TRUE);
        if (isset($ld_LeadResponse["error"]) && !empty($ld_LeadResponse["error"]))
            throw new Exception($ld_LeadResponse["error"]);

        if ($error = json_last_error())
        {
            $errorReference = [
                JSON_ERROR_DEPTH => 'The maximum stack depth has been exceeded.',
                JSON_ERROR_STATE_MISMATCH => 'Invalid or malformed JSON.',
                JSON_ERROR_CTRL_CHAR => 'Control character error, possibly incorrectly encoded.',
                JSON_ERROR_SYNTAX => 'Syntax error.',
                JSON_ERROR_UTF8 => 'Malformed UTF-8 characters, possibly incorrectly encoded.',
                JSON_ERROR_RECURSION => 'One or more recursive references in the value to be encoded.',
                JSON_ERROR_INF_OR_NAN => 'One or more NAN or INF values in the value to be encoded.',
                JSON_ERROR_UNSUPPORTED_TYPE => 'A value of a type that cannot be encoded was given.',
            ];
            $errStr = isset($errorReference[$error]) ? $errorReference[$error] : "Unknown error ($error)";
            throw new Exception("JSON decode error (" . $error . "): " . $errStr );
        }
        return $ld_LeadResponse;
    }
    catch(Exception $e) {
        ouputHeader("400", "Bad Request");
        return "error: " . $e->getMessage();
    }
    finally {
        curl_close ($ch);
    }
}
function GetLeadDynoLeadByEmail($email) {

    include('../lead_dyno.cfg.php');

    try
    {
   // echo "GetLeadDynoLeadByEmail email:".$email."   ";
        $ch = curl_init($leadDynoLeadsByEmailUrl."?key=".$leadDynoPrivateKey."&email=".$email);                                                                      
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);                                                                      
                                                                                                                
        $ld_json = curl_exec($ch);
    //echo "LD_JSON:".$ld_json."   ";
        $ld_response = json_decode($ld_json, TRUE);
    //echo "LD:".$ld_response."   ";
        if (isset($ld_response["error"]) && !empty($ld_response["error"]))
            throw new Exception($ld_response["error"]);

        if ($error = json_last_error())
        {
            $errorReference = [
                JSON_ERROR_DEPTH => 'The maximum stack depth has been exceeded.',
                JSON_ERROR_STATE_MISMATCH => 'Invalid or malformed JSON.',
                JSON_ERROR_CTRL_CHAR => 'Control character error, possibly incorrectly encoded.',
                JSON_ERROR_SYNTAX => 'Syntax error.',
                JSON_ERROR_UTF8 => 'Malformed UTF-8 characters, possibly incorrectly encoded.',
                JSON_ERROR_RECURSION => 'One or more recursive references in the value to be encoded.',
                JSON_ERROR_INF_OR_NAN => 'One or more NAN or INF values in the value to be encoded.',
                JSON_ERROR_UNSUPPORTED_TYPE => 'A value of a type that cannot be encoded was given.',
            ];
            $errStr = isset($errorReference[$error]) ? $errorReference[$error] : "Unknown error ($error)";
            throw new Exception("JSON decode error (" . $error . "): " . $errStr );
        }
        return $ld_response;
    }
    catch(Exception $e) {
        ouputHeader("400", "Bad Request");
        return "error: " . $e->getMessage();
    }
    finally {
        curl_close ($ch);
    }
}
function GetContactByContactId($contact_id) {
    $url = "https://traveljolly.com/api/contacts/".$contact_id;
    $opts = array(
        'http'=>array(
        'method'=>"GET",
        'header' => "Authorization: fc0eb8ab9c9c40469c560468bdc2621b"                 
        )
    );
    $context = stream_context_create($opts);
    $json = file_get_contents($url, false, $context);
    //$json = file_get_contents($url);
    $result = json_decode($json, true);
    return $result;
}
function GetContactByEmail($emailaddress) {
    $url = "https://traveljolly.com/api/contacts/?Email=" . $emailaddress;
    $opts = array(
        'http'=>array(
        'method'=>"GET",
        'header' => "Authorization: fc0eb8ab9c9c40469c560468bdc2621b"                 
        )
    );
    $context = stream_context_create($opts);
    $json = file_get_contents($url, false, $context);
    //$json = file_get_contents($url);
    $result = json_decode($json, true);
    return $result;
}
function updateContact($contactId, $postArray) {
    $postData = json_encode($postArray);
    //echo "postData:".print_r($postData);
    //return;
    $opts = array('http' =>
        array(
            'method'  => "PUT",
            'header' => "Authorization: fc0eb8ab9c9c40469c560468bdc2621b\r\n" . "Content-Type: application/json\r\n",
            'content' => $postData
        )
    );

    $url = "https://traveljolly.com/api/contacts/" . $contactId;
    $context = stream_context_create($opts);
    $json = file_get_contents($url, false, $context);
}
// function getTinyUrl($urlToShorten, $keyWord, $title) {

//         $endPoint = "http://tinytj.com/yourls-api.php?";//signature=05e2685fc7&action=shorturl&format=json&url=http://www.traveljolly.com/index100_1.html&keyword=test2&title=Thesecondtest";
//         $data = array(
//             'signature' => '05e2685fc7',
//             'action' => 'shorturl',
//             'format' => 'json',
//             'url' => $urlToShorten,
//             'keyword' => $keyWord,
//             'title' => $title
//         );
        
//         // Init the CURL session
//         $ch = curl_init();
//         curl_setopt($ch, CURLOPT_URL, $endPoint);
//         curl_setopt($ch, CURLOPT_HEADER, 0);            // No header in the result
//         curl_setopt($ch, CURLOPT_RETURNTRANSFER, true); // Return, do not echo result
//         curl_setopt($ch, CURLOPT_POST, 1);              // This is a POST request
//         curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        
//         // Fetch and return content
//         $data = curl_exec($ch);
//         curl_close($ch);
        
//         $data = json_decode( $data );
//         if (isset($data->shorturl) && $data->shorturl != '') {
//             return $data->shorturl;
//         }
//         return $data->shorturl." not shortened".$urlToShorten;
// }
function Put() {
    ouputHeader("405", "Method Not Allowed");
}
function Get() {
    ouputHeader("405", "Method Not Allowed");
    // try {

    //     spl_autoload_register('ld_affiliates_autoloader');
    //     $Entity = new ld_affiliate();
    //     $app = new iSDK;
    //     $app->cfgCon("connection");

    //     $queryParams = undefined;
    //     $queryString = $_SERVER['QUERY_STRING'];
    //     if (array_key_exists('id', $_GET)) { 
    //         if (empty($_GET['id'])) {
    //         //if id not set remove from querystring
    //         $queryString = str_replace('id=&', '', $queryString);
    //         } 
    //     }
    //     $queryString = str_replace('path=', '', $queryString);
    //     $queryParams = getUrlParms($queryString);
    //     if ($queryParams['Email'] != undefined && $queryParams['Email'] != '') {
    //         $url = "http://traveljolly.com/api/contacts/&Email=" .$queryParams['Email'];
    //         $json = file_get_contents($url);
    //         $result = json_decode($json, true);
    //         //$queryParms['ContactId'] = $result[0]["Id"];
    //         unset($queryParams['Email']);
    //         $queryParams['ContactId'] = $result[0]["Id"];
    //     } 

    //     $returnFields = $Entity->getSelectFieldsArray();
    //     $query = $queryParams;
    //     $result = $app->dsQuery("Affiliate",100,0,$query,$returnFields);

    // }
    // catch(Exception $exception) {
    //      ouputHeader("400", "Bad Request");
    //      returnResponse("error: " . $exception->getMessage());
    //  }
     
    // returnResponse($result);
}
function Delete() {
    ouputHeader("405", "Method Not Allowed");
}

?>