<?php
//http://traveljolly.com/api/quizzes/
require '../base.php';

function Post() {
    spl_autoload_register('tj_visits_autoloader');
    $gatlingEntity = new tj_visit();

    $payload = "";

    try {
        $payload = getPayload();
        $payload["guid"] = generateGuid();

        doPost($payload, $gatlingEntity);

        returnResponse("http://traveljolly.com/api/tj_visits/".$payload["guid"], false);
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
    $afmc = NULL;
    $guid = NULL;
    $result = NULL;
    try {

        spl_autoload_register('tj_visits_autoloader');
        $gatlingEntity = new tj_visit();

        if (isset($_GET["id"]) && !empty($_GET["id"])) {
            $id = $_GET["id"];
        };

        if (isset($_GET["afmc"]) && !empty($_GET["afmc"]))
            $afmc = $_GET["afmc"];

        if (is_numeric($id) && $id > 0 && $id == round($id, 0)){
            //validate as number

        } else {
            if (preg_match("/^(\{)?[a-f\d]{8}(-[a-f\d]{4}){4}[a-f\d]{8}(?(1)\})$/i", $id)) {
                $guid = $id;
            } else {
                    $id = undefined;
            }
        }

        $gatlingEntity -> rid = $id;
        $gatlingEntity -> afmc = $afmc;
        $gatlingEntity -> guid = $guid;

        $result = Fetch($gatlingEntity);

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