<?php
//http://traveljolly.com/api/emailaddstatus/
require '../base.php';

function Post() {
    spl_autoload_register('contacts_autoloader');
    $tjEntity = new contacts();

    $payload = "";
    ouputHeader("405", "Method Not Allowed");
    try {
        $payload = getPayload();
        $payload["guid"] = generateGuid();

        //doPost($payload, $tjEntity);

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

        spl_autoload_register('emailaddstatus_autoloader');
        $tjEntity = new emailaddstatus();
        $app = new iSDK;
        $app->cfgCon("connection");

        $queryParams = undefined;
        parse_str($_SERVER['QUERY_STRING'], $queryParams);

        $returnFields = $tjEntity->getSelectFieldsArray();
        //$query = array('_AFFemail' => $queryParams['AFFemail']);
        if (isset($queryParams['id']) || $queryParams['id'] == '')
            unset($queryParams['id']);
        else
            $queryParams = array('Id' => $queryParams['id']);
            
        $query = $queryParams;
        $result = $app->dsQuery("EmailAddStatus",100,0,$query,$returnFields);

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