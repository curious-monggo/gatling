<?php
//http://traveljolly.com/api/notes/
require '../base.php';

function Post() {
    spl_autoload_register('notes_autoloader');
    $gatlingEntity = new note();

    $payload = "";
    
    try {
        $app = new iSDK;
        $app->cfgCon("connection");
        $payload = getPayload();

        $result = $app->dsAdd("ContactAction", $payload);
        if (strpos($result, 'ERROR') !== false)
            throw new Exception($result);

        ouputHeader("201", "Created");
        returnResponse("http://traveljolly.com/api/notes/".$result, false);
    }
    catch(Exception $e) {
        outputHeader("400", "Bad Request");
        returnResponse("error: " . $e->getMessage());
    }
    finally {

    }
}
function Put() {
    ouputHeader("405", "Method Not Allowed");
}
function Get() {

    try {

        spl_autoload_register('notes_autoloader');
        $gatlingEntity = new note();
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
        $result = $app->dsQuery("ContactAction",100,0,$query,$returnFields);

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