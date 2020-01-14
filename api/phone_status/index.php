<?php
//http://traveljolly.com/api/phone_requests/
require '../base.php';

function Post() {
    spl_autoload_register('tj_phone_status_autoloader');
    $gatlingEntity = new phonestatus();

    $payload = "";

    try {
        $payload = getPayload();
        $payload["guid"] = generateGuid();

        doPost($payload, $gatlingEntity);

        returnResponse("http://traveljolly.com/api/phone_status/".$payload["guid"], false);
    }
    catch(Exception $e) {
        ouputHeader("400", "Bad Request");
        returnResponse("error: " . $e->getMessage());
    }

}
function Put() {
    ouputHeader("405", "Method Not Allowed");
}
function Get() {

    try {

        spl_autoload_register('tj_phone_status_autoloader');
        $gatlingEntity = new phonestatus();

        $result = doGet($gatlingEntity);

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