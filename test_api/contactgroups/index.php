<?php
//header('Access-Control-Allow-Origin: *');
//http://traveljolly.com/api/contactgroups/

require '../base.php';

function Post() {
    try{
        spl_autoload_register('contactgroups_autoloader');
        $tjEntity = new contactgroup();

        $payload = "";
        $payload = getPayload();

        $app = new iSDK;
        $app->cfgCon("connection");
        $responseMessage = "";
        if($payload["email"]){

            $contactResult = GetContactByEmail($payload["email"]);
            if($contactResult[0]["Id"] != ""){
                $addResult = $app->grpAssign($contactResult[0]["Id"], 1937);
                if($addResult == true){
                    $responseMessage = "Tag 1937 added";
                    
                } 
            }
        } else {
            $responseMessage = "No email present";
        }

        returnResponse($responseMessage);

        
    }
    catch(Exception $exception) {
         ouputHeader("400", "Bad Request");
         returnResponse("error: " . $exception->getMessage());
    }
    // ouputHeader("405", "Method Not Allowed");
}
function Put() {

    ouputHeader("405", "Method Not Allowed");
}

function Get() {

    try {
        
        spl_autoload_register('contactgroups_autoloader');
        $tjEntity = new contactgroup();
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
        //$queryParams = getUrlParms($queryString);
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
        $query = array('GroupName' => '%');
        $result = $app->dsQuery("ContactGroup",1000,0,$query,$returnFields);
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
function GetContactByEmail($emailaddress) {
    $url = "https://traveljolly.com/api/contacts/?Email=" . $emailaddress;
        $opts = array(
            'http'=>array(
            'method'=>"GET",
            'header' => "Authorization: fc0eb8ab9c9c40469c560468bdc2621b"                 
            )
        );
        $context = stream_context_create($opts);
        $json = file_get_contents($url, false, $context);
        //$json = file_get_contents($url);
        $result = json_decode($json, true);
        return $result;
}
?>