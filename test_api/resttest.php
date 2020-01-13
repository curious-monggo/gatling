<?php
require_once 'configuration.php';

$method = $_SERVER['REQUEST_METHOD'];
echo $method."<br>";
echo "AUTH:".$_SERVER['HTTP_AUTHORIZATION']."<br>";
//$request = explode('/', trim($_SERVER['PATH_INFO'],'/'));
switch ($method)
    {
        case "POST":
            Post();
            break;
        case "PUT":
            Put();
            break;
        case "GET":
            Get();
            break;
        case "DELETE":
            Delete();
            break;
    }
$payload = loadPayload();
returnData($payload);
function Post() {
    echo "POST";
}
function Put() {
    echo "PUT";
}
function Get() {
    echo "GET";
}
function Delete() {
    echo "DELETE";
}
function loadPayload() {
    try {
        $payload = json_decode(file_get_contents('php://input'),true);
        $ph = $payload["phonenumber"];
        return $payload;
    }
    catch(Exception $exception) {
        returnData(array(array("error" => $exception->getMessage())));
    }
}
function returnData($data) {
    if (is_array($data)){
        if (empty($data)) {
            echo json_encode(array(array("nodata" => $_GET["action"] . " failed to return data")));
        }
        else {
            echo json_encode($data);
        }
    }
    else {
        //echo json_encode(array(array("error" => $_GET["action"] . " failed to retrieve data")));
        echo json_encode(array(array("Not an Array" => $data)));
    }
}
?>