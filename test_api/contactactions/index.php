<?php
//header('Access-Control-Allow-Origin: *');
//http://traveljolly.com/api/contactactions/

require '../base.php';

function Post() {

    spl_autoload_register('contactactions_autoloader');
    $tjEntity = new contactaction();

    $payload = "";
    try {

        $app = new iSDK;
        $app->cfgCon("connection");
        $payload = getPayload();
//echo "payload:".print_r($payload);

        $result = $app->dsAdd("ContactAction", $payload);
        if (strpos($result, 'ERROR') !== false)
            throw new Exception($result);

        ouputHeader("201", "Created");
        returnResponse("http://traveljolly.com/api/contactactions/".$result, false);
    }
    catch(Exception $e) {
        ouputHeader("400", "Bad Request");
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
        
        spl_autoload_register('contactactions_autoloader');
        $tjEntity = new contactaction();
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
        //echo "qs: ".print_r($queryString);
        //$returnFields = array('Id','FirstName','LastName','Email','Phone1', 'Phone1Type', 'Groups', 'LeadSource', "_AFFemail", '_AFFphone', '_GiftCardPin');

        $returnFields = $tjEntity->getSelectFieldsArray(TRUE);

        //$query = $queryParams;
        //echo "<br>query = ".print_r($returnFields)."<br>";
        //$result = $app->dsQuery("Contact",100,0,$query,$returnFields);
        //$returnFields = array('Id','GroupDescription', 'GroupName');
        //$query = array('GroupName' => '%');
        //$result = $app->dsQuery("ContactGroup",1000,$query,$returnFields);
        //echo "queryparms: ".print_r($queryParams)." x</br>";
        // echo "Entered val GET: ".$_GET['val']." x</br>";
        // echo "Entered val POST: ".$_POST['val']." x</br>";
        // echo "querystring: ".$_SERVER['QUERY_STRING']." x</br>";
        // echo "params: ".print_r($queryParams)." x</br>";
        // echo "properties: ".$tjEntity->getSelectClause()." x</br>";
        //$returnFields = array('Id','GroupDescription', 'GroupName');
        //$query = array('GroupName' => '%');
        $result = $app->dsQuery("ContactAction",1000,0,$queryParams,$returnFields);
        //echo "RESULT:".print_r($result);

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