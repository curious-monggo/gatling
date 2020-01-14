<?php
//header('Access-Control-Allow-Origin: *');
//http://traveljolly.com/api/parsey/

require '../base.php';

function Post() {

    spl_autoload_register('parsey_autoloader');
    $gatlingEntity = new parsey();

    $payload = "";
    try {

        $payload = getPayload();
//echo "payload:".print_r($payload);
        $data_string = json_encode($payload);
        $ch = curl_init('https://parsey.com/app/h/xp6kkt');                                                                      
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");                                                                     
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data_string);                                                                  
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);                                                                      
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(                                                                          
            'Content-Type: application/json',                                                                                
            'Content-Length: ' . strlen($data_string))                                                                       
        );                                                                                                                   
        //echo "<br>curling<br>";                                                                                                                     
        $json = curl_exec($ch);
        if ($json === false)
        {
            throw new Exception('Curl error: ' . curl_error($ch));
            //echo 'Curl error: ' . curl_error($ch);
        }

        curl_close ($ch);

        //echo "decoded Json: " . print_r(json_decode($json, TRUE)) . "<br>";//true decodes to an array
        //$decodedJson = json_encode($decodedJson);
        $obj = json_decode($json);//decode to an object
        if ($error = json_last_error())
        {
            $errorReference = [
            JSON_ERROR_DEPTH => 'The maximum stack depth has been exceeded.',
            JSON_ERROR_STATE_MISMATCH => 'Invalid or malformed JSON.',
            JSON_ERROR_CTRL_CHAR => 'Control character error, possibly incorrectly encoded.',
            JSON_ERROR_SYNTAX => 'Syntax error.',
            JSON_ERROR_UTF8 => 'Malformed UTF-8 characters, possibly incorrectly encoded.',
            JSON_ERROR_RECURSION => 'One or more recursive references in the value to be encoded.',
            JSON_ERROR_INF_OR_NAN => 'One or more NAN or INF values in the value to be encoded.',
            JSON_ERROR_UNSUPPORTED_TYPE => 'A value of a type that cannot be encoded was given.',
            ];
            $errStr = isset($errorReference[$error]) ? $errorReference[$error] : "Unknown error ($error)";
            //echo "JSON decode error (" . $error . "): " . $errStr ;
            throw new Exception("JSON decode error (" . $error . "): " . $errStr );
        }


        ouputHeader("201", "Created");
        //echo "decoded Json: " . print_r(json_decode($json, TRUE)) . "<br>";//true decodes to an array
        returnResponse($obj, TRUE);
    }
    catch(Exception $e) {
        ouputHeader("400", "Bad Request");
        returnResponse("error: " . $e->getMessage());
    }
    finally {
        die();
    }
}
function Put() {

    ouputHeader("405", "Method Not Allowed");
}

function Get() {

    ouputHeader("405", "Method Not Allowed");
}
function Delete() {
    ouputHeader("405", "Method Not Allowed");
}

?>