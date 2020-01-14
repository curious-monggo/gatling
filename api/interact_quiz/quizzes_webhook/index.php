<?php
//http://traveljolly.com/api/quizzes/
require '../base.php';

function Post() {
    spl_autoload_register('quizzes_autoloader');
    $gatlingEntity = new quiz();

    $payload = "";

    try {
        $payload = getPayload();
        $payload["guid"] = generateGuid();

        $contactResult = GetContact($payload["email"]);
        $payload["contact_id"] = $contactResult[0]["Id"];
        $payload["email"] = $contactResult[0]["Email"];

        //$gatlingEntity->contact_id = = $contactResult[0]["Id"];
        //$gatlingEntity->email = = $contactResult[0]["Email"];
        doPost($payload, $gatlingEntity);

        returnResponse("http://traveljolly.com/api/quizzes/".$payload["guid"], false);
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
    //echo "get:".print_r($_GET);
    $id = NULL;
    $email = NULL;
    $contact_id = NULL;
    $guid = NULL;
    $result = NULL;
    try {

        spl_autoload_register('quizzes_autoloader');
        $gatlingEntity = new quiz();

        if (isset($_GET["id"]) && !empty($_GET["id"])) {
            $id = $_GET["id"];
        } else {
            if (isset($_GET["contact_id"]) && !empty($_GET["contact_id"])) {
                $contact_id = $_GET["contact_id"];
            }else{
                //throw new Exception("How about some data dude.");
            }
        };
        if (is_numeric($id) && $id > 0 && $id == round($id, 0)){
            //validate as number

        } else {
            if (preg_match("/^(\{)?[a-f\d]{8}(-[a-f\d]{4}){4}[a-f\d]{8}(?(1)\})$/i", $id)) {
                $guid = $id;
            } else {
                if (isset($_GET["contact_id"]) && !empty($_GET["contact_id"])) {
                    $contact_id = $_GET["contact_id"];
                }
                else{
                    //validate as email
                    if (isset($id))
                        $email = $id;
                    $id = undefined;
                }
            }
        }

        $gatlingEntity -> rid = $id;
        $gatlingEntity -> email = $email;
        $gatlingEntity -> contact_id = $contact_id;
        $gatlingEntity -> guid = $guid;
//echo "select:".$gatlingEntity -> rid;
        $result = FetchData($gatlingEntity);
//echo "RESUlt:".print_r($result);
        //$resultArray = stdToArray($result);
        //$resultArray = objectToArray($result);
        //$resultArray = json_decode(json_encode($result), True);
        // if (is_array($resultArray))
        //     echo "IS AN ARRAY";
        // else
        //     echo "NOT AN ARRAY";
        // if (empty($resultArray)) {
        //     echo json_encode(array(array("nodata" => " failed to return data")));
        // }
        // else {
        //     echo "encoded:".json_encode($resultArray);
        // }
        //echo "result:".print_r($resultArray);

    }
    catch(Exception $exception) {
         ouputHeader("400", "Bad Request");
         returnResponse("error: " . $exception->getMessage());
     }
     
    returnResponse($result);
}
function FetchData($gatlingEntity) {

    $result = array(array("error" => " no results"));
    try {
        $conn = new \PDO(   "mysql:host=$gatlingEntity->servername;dbname=$gatlingEntity->dbname", $gatlingEntity->username, $gatlingEntity->password,
                    array(
                        \PDO::ATTR_ERRMODE => \PDO::ERRMODE_EXCEPTION,
                        \PDO::ATTR_PERSISTENT => false
                    )
                );

        $handle = $gatlingEntity->getSelectClause($conn, $gatlingEntity, 100);
        //echo print_r($handle);
        //echo print_r($gatlingEntity);
        $handle->execute();

        $result = $handle->fetchAll(\PDO::FETCH_OBJ);
        //echo print_r($result);
    }
    catch(PDOException $exception) {
        ouputHeader("400", "Bad Request");
        returnResponse("error: " . $exception->getMessage());
    }
    finally {
        $conn = null;
    }
    return $result;
}
function stdToArray($obj){
  $reaged = (array)$obj;
  foreach($reaged as $key => &$field){
    if(is_object($field))$field = stdToArray($field);
    echo "field:".$field;
  }
  return $reaged;
}
function objectToArray($d) 
{
    if (is_object($d)) {
        // Gets the properties of the given object
        // with get_object_vars function
        $d = get_object_vars($d);
    }

    if (is_array($d)) {
        /*
        * Return array converted to object
        * Using __FUNCTION__ (Magic constant)
        * for recursive call
        */
        return array_map(__FUNCTION__, $d);
    } else {
        // Return array
        return $d;
    }
}
function Delete() {
    ouputHeader("405", "Method Not Allowed");
}

function GetContact($email) {

    try {
        
        // spl_autoload_register('tj_begc_activation_codes_autoloader');
        // $gatlingEntity = new begc_activation_code();
        $app = new iSDK;
        $app->cfgCon("connection");

        $returnFields = array('Id','FirstName','LastName','Email','Phone1');
        $query =array('Email' => $email);
        //echo "ReturnFields:".print_r($returnFields);
        //echo "query: ".print_r($query);

        $result = $app->dsQuery("Contact",100,0,$query,$returnFields);

        //echo "result: ".print_r($result);
        return $result;
    }
    catch(Exception $exception) {
         ouputHeader("400", "Bad Request");
         returnResponse("error: " . $exception->getMessage());
     }
     
    $result;
}


?>