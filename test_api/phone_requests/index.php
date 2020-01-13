<?php
//http://traveljolly.com/api/phone_requests/
require '../base.php';

function Post() {
    spl_autoload_register('tj_phone_requests_autoloader');
    $tjEntity = new phonerequests();

    $payload = "";

    try {
        $payload = getPayload();
        $payload["guid"] = generateGuid();

        doPost($payload, $tjEntity);

        returnResponse("http://traveljolly.com/api/phone_requests/".$payload["guid"], false);
    }
    catch(Exception $e) {
        ouputHeader("400", "Bad Request");
        returnResponse("error: " . $e->getMessage());
    }
    finally {
        $conn = null;
    }
}
function Put() {
    ouputHeader("405", "Method Not Allowed");
}
function Get() {

    try {

        spl_autoload_register('tj_phone_requests_autoloader');
        $tjEntity = new phonerequests();

        $result = doGet($tjEntity);

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