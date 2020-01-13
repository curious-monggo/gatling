<?php
//http://traveljolly.com/api/quizzes/
require '../base.php';

function Post() {
    spl_autoload_register('quizzes_autoloader');
    $tjEntity = new quiz();

    $payload = "";

    try {
        $payload = getPayload();
        $payload["guid"] = generateGuid();

        doPost($payload, $tjEntity);

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
        $tjEntity = new quiz();

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

        $tjEntity -> rid = $id;
        $tjEntity -> email = $email;
        $tjEntity -> contact_id = $contact_id;
        $tjEntity -> guid = $guid;
//echo "select:".$tjEntity -> rid;
        $result = FetchData($tjEntity);
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
function FetchData($tjEntity) {

    $result = array(array("error" => " no results"));
    try {
        $conn = new \PDO(   "mysql:host=$tjEntity->servername;dbname=$tjEntity->dbname", $tjEntity->username, $tjEntity->password,
                    array(
                        \PDO::ATTR_ERRMODE => \PDO::ERRMODE_EXCEPTION,
                        \PDO::ATTR_PERSISTENT => false
                    )
                );

        $handle = $tjEntity->getSelectClause($conn, $tjEntity, 100);
        //echo print_r($handle);
        //echo print_r($tjEntity);
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

?>