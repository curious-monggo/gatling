<?php
//http://traveljolly.com/api/phone_requests/
header("Content-type:application/json");
require '../base.php';

function Post() {
    spl_autoload_register('tj_phone_sent_sms_autoloader');
    $gatlingEntity = new phonesentsms();

    $payload = "";

    try {
        $payload = getPayload();
        $payload["guid"] = generateGuid();

        doPost($payload, $gatlingEntity);

        returnResponse("http://traveljolly.com/api/phone_sent_sms/".$payload["guid"], false);
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

        spl_autoload_register('tj_phone_sent_sms_autoloader');
        $gatlingEntity = new phonesentsms();

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