<?php

//http=>//traveljolly.com/api/contacts/

require '../base.php';

function Post() {

    spl_autoload_register('begc_login_autoloader');
    $tjEntity = new begc_login();

    $payload = "";
    try {
        $payload = getPayload();
        if(isset($payload["affContactId"]) && isset($payload["contactId"])){
            $responseGetContact = GetContact("Id", $payload["affContactId"]);
            // echo $responseGetContact;
            //condition

            if(isset($responseGetContact[0]["FirstName"]) && isset($responseGetContact[0]["LastName"])){
                
                //get aff info
                $aff_first_name = $responseGetContact[0]["FirstName"];
                $aff_last_name = $responseGetContact[0]["LastName"];
                $aff_email = $responseGetContact[0]["Email"];
                $aff_gift_card= $responseGetContact[0]["_ProspectGiftcard"];
                $aff_pin = $responseGetContact[0]["_ProspectPin"];
                $aff_afmc = $responseGetContact[0]["_LeadDYNOafmc"];
				//$begc_url = 'https://bookingenginegiftcard.com/?afmc='.$responseGetContact[0]["_LeadDYNOafmc"];
                $begc_url = "http://bookingenginegiftcard.com/?memb_autologin=yes&auth_key=MW5psVKjwOmA&Id=".$payload["contactId"]."&Email=".$aff_email."&redir=/business-manager/";
                //update infusionsoft field
                $app = new iSDK;
                $app->cfgCon("connection");
                $updateAffInfo = array();

                try {
                    $updateAffInfo = array(
                        // '_AFFFirstname' => $aff_first_name,
                        // '_AFFLastname' => $aff_last_name,
                        // '_AFFemail' => $aff_email,
                        // '_ProspectGiftcard' => $aff_gift_card,
                        // '_ProspectPin' => $aff_pin,
                        // '_AFFgiftcard0' => $aff_gift_card,
                        // '_AFFpin' => $aff_pin,
                        // '_AFFAFMC' => $aff_afmc,
						'_BookingEngineGiftCardURL' => $begc_url
                    );

                    $updateCon = $app->dsUpdate("Contact", $payload["contactId"], $updateAffInfo);
                    if(is_numeric($updateCon)) {
                        $responseMessage = "Begc url updated";
                        // $addResult = $app->grpAssign($payload["contactId"], 1149);
                        
                        // if($addResult == true){
                        //     $responseMessage = "Activation code and tag 1149 added";
                        // }  
                    } else {
                        $responseMessage = "Infusionsoft Error: ".$updateCon;
                    }
                }
                catch(Exception $exception) {
                    throw new Exception("error:".$exception->getMessage());
                }
            }
        } else if(!isset($payload["affContactId"]) && isset($payload["contactId"])) {
            $responseGetContact = GetContact("Id", $payload["contactId"]);
            
            $responseGetAffContact = GetContact("Email", $responseGetContact[0]['_AFFemail']);
                //get aff info
                $aff_id = $responseGetAffContact[0]["Id"];
                $aff_first_name = $responseGetAffContact[0]["FirstName"];
                $aff_last_name = $responseGetAffContact[0]["LastName"];
                $aff_email = $responseGetAffContact[0]["Email"];
                $aff_gift_card= $responseGetAffContact[0]["_ProspectGiftcard"];
                $aff_pin = $responseGetAffContact[0]["_ProspectPin"];
                $aff_afmc = $responseGetAffContact[0]["_LeadDYNOafmc"];
				//$begc_url = 'https://bookingenginegiftcard.com/?afmc='.$responseGetAffContact[0]["_LeadDYNOafmc"];
                $begc_url = "http://bookingenginegiftcard.com/?memb_autologin=yes&auth_key=MW5psVKjwOmA&Id=".$payload["contactId"]."&Email=".$responseGetContact[0]['Email']."&redir=/business-manager/";
                //update infusionsoft field
                $app = new iSDK;
                $app->cfgCon("connection");
                $updateAffInfo = array();

                try {
                    $updateAffInfo = array(
                        // '_AFFFirstname' => $aff_first_name,
                        // '_AFFLastname' => $aff_last_name,
                        // '_AFFemail' => $aff_email,
                        // '_ProspectGiftcard' => $aff_gift_card,
                        // '_ProspectPin' => $aff_pin,
                        // '_AFFgiftcard0' => $aff_gift_card,
                        // '_AFFpin' => $aff_pin,
                        // '_AFFAFMC' => $aff_afmc,
						'_BookingEngineGiftCardURL' => $begc_url
                    );

                    $updateCon = $app->dsUpdate("Contact", $payload["contactId"], $updateAffInfo);
                    if(is_numeric($updateCon)) {
                        $responseMessage = "Begc url updated";
                        // $addResult = $app->grpAssign($payload["contactId"], 1149);
                        
                        // if($addResult == true){
                        //     $responseMessage = "Activation code and tag 1149 added";
                        // }  
                    } else {
                        $responseMessage = "Infusionsoft Error: ".$updateCon;
                    }
                    //echo $updateCon;
                }
                catch(Exception $exception) {
                    throw new Exception("error:".$exception->getMessage());
                }
        } else {
            throw new Exception("Parameters not met.", 1);
        }
    }
    catch(Exception $e) {
        ouputHeader("400", "Bad Request");
        returnResponse("error=> " . $e->getMessage());
    }
    returnResponse($responseMessage);
}

function Put() {
    spl_autoload_register('begc_login_autoloader');
    $tjEntity = new begc_login();

    $payload = "";
    try {

        if (isset($_GET["id"]) && !empty($_GET["id"])) {
            $id = $_GET["id"];
        } else {
            throw new Exception("How about some data dude.");
        };
        $app = new iSDK;
        $app->cfgCon("connection");
        $payload = getPayload($payload);
        $groups = ""; $addGroups = ""; $removeGroups = "";
        if (isset($payload["Groups"]))
        {
            $groups = $payload["Groups"];
            unset($payload["Groups"]);
        }
        if (isset($payload["addGroups"]))
        {
            $addGroups = explode(",", $payload["addGroups"]);
            unset($payload["addGroups"]);
        }
        if (isset($payload["removeGroups"]))
        {
            $removeGroups = explode(",", $payload["removeGroups"]);
            unset($payload["removeGroups"]);
        }

        if (!empty($payload))
        {
            $result = $app->dsUpdate("Contact", $id, $payload);
            if (strpos($result, 'ERROR') !== false)
                throw new Exception($result);
        }
        if (is_array($removeGroups))
        {
            foreach($removeGroups as $group) {
                $removeResult = $app->grpRemove($id, $group);
            }
        }
        if (is_array($addGroups))
        {
            foreach($addGroups as $group) {
                $addResult = $app->grpAssign($id, $group);
            }
        }
    }
    catch(Exception $e) {
        ouputHeader("400", "Bad Request");
        returnResponse("error=> " . $e->getMessage());
    }
    finally {

    }
    returnResponse($result);
}

function Get() {
   // echo "URI=>".$_SERVER["REQUEST_URI"];
   // echo "method=>".$_SERVER['REQUEST_METHOD'];
   // echo "pathinfo=>".$_SERVER["PATH_INFO"];
   // $url_elements = explode('/', $_SERVER['PATH_INFO']);
   // echo "uri=>".print_r($url_elements);
    try {
        
        spl_autoload_register('contacts_autoloader');
        $tjEntity = new contact();
        $app = new iSDK;
        $app->cfgCon("connection");

        $queryParams = "";
        $queryString = $_SERVER['QUERY_STRING'];
        if (array_key_exists('id', $_GET)) { 
            if (empty($_GET['id'])) {
            //if id not set remove from querystring
            $queryString = str_replace('id=&', '', $queryString);
            } 
        }
        $queryString = str_replace('path=', '', $queryString);
        $queryParams = getUrlParms($queryString);
        //echo "qs=> ".print_r($queryString);
        //$returnFields = array('Id','FirstName','LastName','Email','Phone1', 'Phone1Type', 'Groups', 'LeadSource', "_AFFemail", '_AFFphone', '_GiftCardPin');
        $excludeCustomFields = TRUE;
        $returnFields = $tjEntity->getSelectFieldsArray($excludeCustomFields);
        if ($excludeCustomFields) {//so get custom fields from api
            $returnCustomFields = array('DataType', 'DefaultValue', 'FormId','GroupId', 'Id', 'Label', 'ListRows', 'Name', 'Values');
            $queryCustomFields = array('FormId' => -1);
            $customFields = $app->dsQuery("DataFormField",100,0,$queryCustomFields,$returnCustomFields);
            //echo "customFields=> ".print_r($customFields);
            foreach ($customFields as $key=>$val)
            {
                //if ($key["Name"] == "Name")
                    $returnFields[] = "_".$val["Name"];
            }
        }
        $query = $queryParams;
        //echo "<br>query = ".print_r($returnFields)."<br>";
        $result = $app->dsQuery("Contact",100,0,$query,$returnFields);

        //echo "queryparms=> ".print_r($queryParams)." x</br>";
        // echo "Entered val GET=> ".$_GET['val']." x</br>";
        // echo "Entered val POST=> ".$_POST['val']." x</br>";
        // echo "querystring=> ".$_SERVER['QUERY_STRING']." x</br>";
        // echo "params=> ".print_r($queryParams)." x</br>";
        // echo "properties=> ".$tjEntity->getSelectClause()." x</br>";


    }
    catch(Exception $exception) {
         ouputHeader("400", "Bad Request");
         returnResponse("error=> " . $exception->getMessage());
     }
     
    returnResponse($result);
}
function Delete() {
    ouputHeader("405", "Method Not Allowed");
}
function GetContact($field_name, $field_value) {

    try {
        
        spl_autoload_register('begc_login_autoloader');
        $tjEntity = new begc_login();
        $app = new iSDK;
        $app->cfgCon("connection");

        $returnFields = array(
            'Id',
            'FirstName',
            'LastName',
            'Email',
            'Phone1', 
            'Country',
            '_ProspectGiftcard',
            '_ProspectPin',
            '_LeadDYNOafmc',

            /*
                check if fields has value. 
                if yes then they will show up in the result
            */
            
            '_AFFFirstname', 
            '_AFFLastname',
            '_AFFemail',
            '_ProspectGiftcard',
            '_ProspectPin',
            '_AFFgiftcard0', 
            '_AFFpin', 
            '_AFFAFMC', 
            '_BookingEngineGiftCardURL'
        );
        $query =array($field_name => $field_value);
        //echo "ReturnFields=>".print_r($returnFields);
        //echo "query=> ".print_r($query);

        $result = $app->dsQuery("Contact",100,0,$query,$returnFields);

        //echo "result=> ".print_r($result);
        return $result;
    }
    catch(Exception $exception) {
         ouputHeader("400", "Bad Request");
         returnResponse("error=> " . $exception->getMessage());
     }
}
?>