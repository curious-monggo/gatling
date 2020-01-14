<?php
//http://traveljolly.com/api/referrals/
require '../base.php';

function Post() {
    spl_autoload_register('referrals_autoloader');
    $gatlingEntity = new referral();

    $payload = "";
    ouputHeader("405", "Method Not Allowed");
    try {
        $payload = getPayload();
        $payload["guid"] = generateGuid();

        //doPost($payload, $gatlingEntity);

        //returnResponse("http://traveljolly.com/api/phone_requests/".$payload["guid"], false);
    }
    catch(Exception $e) {
        //ouputHeader("400", "Bad Request");
        //returnResponse("error: " . $e->getMessage());
    }
    finally {
        //$conn = null;
    }
}
function Put() {
    ouputHeader("405", "Method Not Allowed");
}
function Get() {

    try {

        spl_autoload_register('referrals_autoloader');
        $gatlingEntity = new referral();
        $app = new iSDK;
        $app->cfgCon("connection");

        $queryParams = NULL;
        $queryString = $_SERVER['QUERY_STRING'];
        if (array_key_exists('id', $_GET)) { 
            if (empty($_GET['id'])) {
            //if id not set remove from querystring
            $queryString = str_replace('id=&', '', $queryString);
            } 
        }
        $queryString = str_replace('path=', '', $queryString);
        $queryParams = getUrlParms($queryString);
        if (isset($queryParams['Email']) && $queryParams['Email'] != '') {
            $url = "http://traveljolly.com/api/contacts/&Email=" .$queryParams['Email'];
            $json = file_get_contents($url);
            $result = json_decode($json, true);
            //$queryParms['ContactId'] = $result[0]["Id"];
            unset($queryParams['Email']);
            $queryParams['ContactId'] = $result[0]["Id"];
        } 

        $returnFields = $gatlingEntity->getSelectFieldsArray();
        $query = $queryParams;
        $result = $app->dsQuery("Referral",100,0,$query,$returnFields);

    }
    catch(Exception $exception) {
         ouputHeader("400", "Bad Request");
         returnResponse("error: " . $exception->getMessage());
     }
     
    returnResponse($result);
}
function Delete() {
    ouputHeader("405", "Method Not Allowed");
}

?>