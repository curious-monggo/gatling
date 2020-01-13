<?php
//http://traveljolly.com/api/activation_codes/
require '../base.php';

function Post() {
    spl_autoload_register('tj_activation_code_autoloader');
    $tjEntity = new activation_code();

    $payload = "";
    try {

        $payload = getPayload();
        $payload["guid"] = generateGuid();
        $result = $tjEntity->Create($payload);
        //$result is the insert query with parms not data
        //{"queryString":"INSERT INTO tj_activation_codes (first_name, last_name, activation_code, initial_value, guid) VALUES(:first_name, :last_name, :activation_code, :initial_value, :guid)"}
        
        ouputHeader("201", "Created");

        returnResponse("http://traveljolly.com/api/activation_codes/".$payload["guid"], false);
    }
    catch(Exception $e) {
        ouputHeader("400", "Bad Request");
        returnResponse("error: " . $e->getMessage());
    }
}
function Put() {
    spl_autoload_register('tj_activation_code_autoloader');
    $tjEntity = new activation_code();

    $payload = "";
    try {
        $payload = getPayload();

        $tjEntity->setMe();

        $result = $tjEntity->Update($payload);

        Get();
    }
    catch(Exception $e) {
        ouputHeader("400", "Bad Request");
        returnResponse("error: " . $e->getMessage());
    }
}
function Get() {

    try {

        spl_autoload_register('tj_activation_code_autoloader');
        $tjEntity = new activation_code();

        $tjEntity->setMe();
        //$result = doGet($tjEntity);
        $result = $tjEntity-> Retrieve();

    }
    catch(Exception $exception) {
         ouputHeader("400", "Bad Request");
         returnResponse("error: " . $exception->getMessage());
     }
     
     returnResponse( $result);
}
function Delete() {
    ouputHeader("405", "Method Not Allowed");
}

?>