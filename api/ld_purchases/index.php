<?php
//http://traveljolly.com/api/ld_purchases/
require '../base.php';
require '../lead_dyno.cfg.php';

function Post() {
    spl_autoload_register('ld_purchases_autoloader');
    $Entity = new ld_purchase();
    $result = NULL;
    $payload = "";
    try {

        $payload = getPayload();
        // include('../lead_dyno.cfg.php');
        // $payload['key'] = $leadDynoPrivateKey;
        //if not passed email then we must go get it and if not passed contact id then we are done
        if (!isset($payload["email"])) {
            if (isset($payload["Contact_Id"])) {
                //get email address from contact record
                $contactResult = GetContact($payload["Contact_Id"]);
                $payload["email"] = $contactResult[0]["Email"];
                unset($payload["Contact_Id"]);
            }
            else {
                ouputHeader("400", "Bad Request");
                return;
            }
        }
        if (isset($payload["Pay_Amt"])) {
            $payload["purchase_amount"] = $payload["Pay_Amt"];
            unset($payload["Pay_Amt"]);
        }

        writeTJPurchase($payload);

        returnResponse($payload);

        //echo "Payload:".print_r($payload);
        // $data_string = $payload;
        
        // $data_string = json_encode($data_string);
        // $ch = curl_init($leadDynoPurchasesUrl);                                                                      
        // curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");                                                                     
        // curl_setopt($ch, CURLOPT_POSTFIELDS, $data_string);                                                                  
        // curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);                                                                      
        // curl_setopt($ch, CURLOPT_HTTPHEADER, array(                                                                          
        //     'Content-Type: application/json',                                                                                
        //     'Content-Length: ' . strlen($data_string))                                                                       
        // );                                                                                                                   
        // $ld_json = curl_exec($ch);
        // $ld_response = json_decode($ld_json, TRUE);
        // if (isset($ld_response["error"]) && !empty($ld_response["error"]))
        //    throw new Exception($ld_response["error"]);
        // // if (!isset($ld_response["affiliate_url"]))
        // //     throw new Exception("LeadDyno response does not contain affiliate url.");

        // if ($error = json_last_error())
        // {
        //     $errorReference = [
        //         JSON_ERROR_DEPTH => 'The maximum stack depth has been exceeded.',
        //         JSON_ERROR_STATE_MISMATCH => 'Invalid or malformed JSON.',
        //         JSON_ERROR_CTRL_CHAR => 'Control character error, possibly incorrectly encoded.',
        //         JSON_ERROR_SYNTAX => 'Syntax error.',
        //         JSON_ERROR_UTF8 => 'Malformed UTF-8 characters, possibly incorrectly encoded.',
        //         JSON_ERROR_RECURSION => 'One or more recursive references in the value to be encoded.',
        //         JSON_ERROR_INF_OR_NAN => 'One or more NAN or INF values in the value to be encoded.',
        //         JSON_ERROR_UNSUPPORTED_TYPE => 'A value of a type that cannot be encoded was given.',
        //     ];
        //     $errStr = isset($errorReference[$error]) ? $errorReference[$error] : "Unknown error ($error)";
        //     throw new Exception("JSON decode error (" . $error . "): " . $errStr );
        // }

        // ouputHeader("200", "Ok");
        // returnResponse($ld_response);
    }
    catch(Exception $e) {
        ouputHeader("400", "Bad Request");
        returnResponse("error(ld): " . $e->getMessage());
    }
    // finally {
    //     curl_close ($ch);
    //     die();
    // }

}
function GetContact($contactid) {

    try {
        
        spl_autoload_register('contacts_autoloader');
        $gatlingEntity = new contact();
        $app = new iSDK;
        $app->cfgCon("connection");

        $returnFields = array('Id','FirstName','LastName','Email','Phone1');
        $query =array('Id' => $contactid);
        //echo "ReturnFields:".print_r($returnFields);
        //echo "query: ".print_r($query);

        $result = $app->dsQuery("Contact",100,0,$query,$returnFields);

        //echo "result: ".print_r($result);
        return $result;
    }
    catch(Exception $exception) {
         ouputHeader("400", "Bad Request");
         returnResponse("error: " . $exception->getMessage());
     }
     
    $result;
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
function writeTJPurchase($payload) {
    spl_autoload_register('ld_purchases_autoloader');
    $gatlingEntity = new tj_purchase();
    // $tjpayload = getPayload();
        if (isset($payload["id"])) {
            unset($payload["id"]);
        }
    doPost($payload, $gatlingEntity);
}
?>