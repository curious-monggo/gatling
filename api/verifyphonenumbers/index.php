<?php
//http://traveljolly.com/api/verifyphonenumber/
require '../base.php';

function Post() {
    ouputHeader("405", "Method Not Allowed");
}
function Put() {
    ouputHeader("405", "Method Not Allowed");
}
function Get() {

    try {

        if (isset($_GET["id"]) && !empty($_GET["id"])) {
            $phonenumber = $_GET["id"];
        } else {
            if (isset($_GET["phone"]) && !empty($_GET["phone"])) {
                $phonenumber = $_GET["phone"];
            }else{
                throw new Exception("Phonenumber required but not received.");
            }
        };
        $result = lookupPhonenumber($phonenumber);
        if (empty($result)) {
            $result = validatePhonenumber($phonenumber);
            if (empty($result) || (isset($result["valid"]) && !$result["valid"]))
                $result = array("valid" => false, "number" => $phonenumber);
            else
            {
                $writeResult = writeNumVerifyRecord($result);
                $result = lookupPhonenumber($phonenumber);
            }
        }

    }
    catch(Exception $exception) {
         ouputHeader("400", "Bad Request");
         returnResponse("error: " . $exception->getMessage());
     }
    ouputHeader("200", "Ok");
    echo json_encode($result);//do not use returnResponse function cause we do not want to output an array
}
function lookupPhonenumber($anumber) {
    if (!strpos($anumber, '+'))
         $anumber = "+".$anumber;
    $result = NULL;
    try {

        spl_autoload_register('verifyphonenumbers_autoloader');
        $gatlingEntity = new verifyphonenumber();

        $gatlingEntity -> international_format = $anumber;

        $result = Fetch($gatlingEntity);

    }
    catch(Exception $exception) {
         ouputHeader("400", "Bad Request");
         returnResponse("error: " . $exception->getMessage());
     }
     
    return $result;
}
function validatePhonenumber($anumber) {

    $access_key = '936b9991b6655bd3cbcec12c7a28d8a9';
    // if (strpos($anumber, '+'))
    //     str_replace("+", "", $anumber);
    try
    {
        // Initialize CURL:
        $ch = curl_init('http://apilayer.net/api/validate?access_key='.$access_key.'&number='.$anumber.'');  
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

        // Store the data:
        $json = curl_exec($ch);

        // Decode JSON response:
        $validationResult = json_decode($json, true);
            // Access and use your preferred validation result objects
        // $validationResult['valid'];
        // $validationResult['country_code'];
        // $validationResult['carrier'];
    }
    catch(Exception $exception) {

    }
    finally
    {
        curl_close($ch);
    }
    return $validationResult;

}
function writeNumVerifyRecord($result) {
    try
    {
        spl_autoload_register('verifyphonenumbers_autoloader');
        $gatlingEntity = new verifyphonenumber();
        $payload = $result;
        $sql = $gatlingEntity->getInsertClause($payload);
        $postResult = doPost($payload, $gatlingEntity);
        $result["rid"] = $postResult;
    }
    catch(Exception $exception) {

    }
    return $result;
}
function Delete() {
    ouputHeader("405", "Method Not Allowed");
}

?>