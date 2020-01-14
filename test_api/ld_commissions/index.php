<?php
error_reporting(E_ALL & ~E_STRICT);
//http://traveljolly.com/api/ld_affiliate/
require '../base.php';
require '../lead_dyno.cfg.php';

function Post() {

    try 
    {
        //remove LD code
        // $ld_response = GetAffiliateId();
        //if (isset($ld_response["id"]) && $ld_response["id"] != "")
        //{
            //call LD api to write commission
            //echo "ldresponse:".$ld_response["id"];

            
            //$ld_commission = writeCommission($ld_response["id"]);

            //writeTJCommission();
            //returnResponse($ld_commission);
        //}

        writeTJCommission();
        returnResponse(getPayload());
  
    }
    catch(Exception $e) {
        ouputHeader("400", "Bad Request");
        returnResponse("error(ld): " . $e->getMessage());
    }
    finally {
        die();
    }

}
function writeTJCommission() {
    spl_autoload_register('ld_commissions_autoloader');
    $gatlingEntity = new tj_commission();
    $tjpayload = getPayload();
    if (isset($tjpayload["currency"]))
        unset($tjpayload["currency"]);
    if (!isset($tjpayload["process_date"])){
        $date = new DateTime(null, new DateTimeZone('America/New_York')); // Y-m-d
        $date->add(new DateInterval('P30D'));
        $tjpayload["process_date"] = $date->format('Y-m-d');
    }
    if (isset($tjpayload['PaymentId'])) {
        $invoicePaymentResult = GetInvoicePaymentByPaymentId($tjpayload['PaymentId']);

         if (isset($invoicePaymentResult[0]["PayStatus"])) {
         //echo "invoicepaymentresult:".print_r($invoicePaymentResult);
            if ($invoicePaymentResult[0]["PayStatus"] != "MANUAL - PAID") {
                    //get invoice id from invoicepayment record then get refnum from cccharge record using paymentid
                    //use payment id to get ccharge record for refnum if invoicepayment is credit card payment.
                    $cchargeResult = GetCChargeByPaymentId($tjpayload['PaymentId']);
                    if (isset($cchargeResult[0]['RefNum']))
                        $tjpayload['refnum'] = $cchargeResult[0]["RefNum"];
            }
         }
        if (!isset($tjpayload["payment_id"]))
            $tjpayload["payment_id"] = $tjpayload["PaymentId"];
        if (isset($invoicePaymentResult[0]["InvoiceId"]))
            $tjpayload["invoice_id"] = $invoicePaymentResult[0]["InvoiceId"];
        unset($tjpayload["PaymentId"]);
    }

    //echo "payload:".print_r($tjpayload);
    doPost($tjpayload, $gatlingEntity);
}
function GetInvoicePaymentByPaymentId($paymentid) {

    try {
        
        spl_autoload_register('invoicepayments_autoloader');
        $gatlingEntity = new invoicepayment();
        $app = new iSDK;
        $app->cfgCon("connection");

        $returnFields = $gatlingEntity->getSelectFieldsArray(TRUE);
        $query =array('PaymentId' => $paymentid);
        //echo "ReturnFields:".print_r($returnFields);
        //echo "query: ".print_r($query);

        $result = $app->dsQuery("InvoicePayment",100,0,$query,$returnFields);

        //echo "result: ".print_r($result);
        return $result;
    }
    catch(Exception $exception) {
         ouputHeader("400", "Bad Request");
         returnResponse("error: " . $exception->getMessage());
     }
     
    $result;
}
function GetCChargeByPaymentId($paymentid) {

    try {
        
        //spl_autoload_register('ccharges_autoloader');
        //$tjEntityc = new ccharge();
        $app = new iSDK;
        $app->cfgCon("connection");

        $returnFields = array('RefNum');
        $query =array('PaymentId' => $paymentid);
        //echo "ReturnFields:".print_r($returnFields);
        //echo "query: ".print_r($query);

        $result = $app->dsQuery("CCharge",100,0,$query,$returnFields);

        //echo "result: ".print_r($result);
        return $result;
    }
    catch(Exception $exception) {
         //ouputHeader("400", "Bad Request");
         //returnResponse("error: " . $exception->getMessage());
         echo "error: " . $exception->getMessage();
     }
     
    $result;
}
// function writeCommission($affiliate_id) {
//     try{
//         $payload = getPayload();
//         include('../lead_dyno.cfg.php');
//         $payload['key'] = $leadDynoPrivateKey;
//         unset($payload["email"]);
//         //amount will be passed in $payload from the caller as amount
//         $data_string = json_encode($payload);
//         $ch = curl_init($leadDynoAffiliateUrl."/".$affiliate_id."/commissions");                                                                   
//         curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");                                                                     
//         curl_setopt($ch, CURLOPT_POSTFIELDS, $data_string);                                                                  
//         curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);                                                                      
//         curl_setopt($ch, CURLOPT_HTTPHEADER, array(                                                                          
//             'Content-Type: application/json',                                                                                
//             'Content-Length: ' . strlen($data_string))                                                                       
//         );                                                                                                                   
//         $ld_json = curl_exec($ch);
//         $ld_response = json_decode($ld_json, TRUE);
//         if (isset($ld_response["error"]) && !empty($ld_response["error"]))
//             throw new Exception($ld_response["error"]);

//         if ($error = json_last_error())
//         {
//             $errorReference = [
//                 JSON_ERROR_DEPTH => 'The maximum stack depth has been exceeded.',
//                 JSON_ERROR_STATE_MISMATCH => 'Invalid or malformed JSON.',
//                 JSON_ERROR_CTRL_CHAR => 'Control character error, possibly incorrectly encoded.',
//                 JSON_ERROR_SYNTAX => 'Syntax error.',
//                 JSON_ERROR_UTF8 => 'Malformed UTF-8 characters, possibly incorrectly encoded.',
//                 JSON_ERROR_RECURSION => 'One or more recursive references in the value to be encoded.',
//                 JSON_ERROR_INF_OR_NAN => 'One or more NAN or INF values in the value to be encoded.',
//                 JSON_ERROR_UNSUPPORTED_TYPE => 'A value of a type that cannot be encoded was given.',
//             ];
//             $errStr = isset($errorReference[$error]) ? $errorReference[$error] : "Unknown error ($error)";
//             throw new Exception("JSON decode error (" . $error . "): " . $errStr );
//         }
//         returnResponse($ld_response);
//     }
//     catch(Exception $e) {
//         ouputHeader("400", "Bad Request");
//         returnResponse("error: " . $e->getMessage());
//     }
//     finally {
//         curl_close ($ch);
//         //die();
//     }
// }
// function GetAffiliateId() {
//     $payload = getPayload();
//     include('../lead_dyno.cfg.php');
//     $ch = curl_init($leadDynoAffiliateUrl."/by_email?"."key=".$leadDynoPrivateKey."&email=".$payload["email"]);                                                                      
//     curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);                                                                      
                                                                                                            
//     $ld_json = curl_exec($ch);
//     $ld_response = json_decode($ld_json, TRUE);
//     if (isset($ld_response["error"]) && !empty($ld_response["error"]))
//         throw new Exception($ld_response["error"]);

//     if ($error = json_last_error())
//     {
//         $errorReference = [
//             JSON_ERROR_DEPTH => 'The maximum stack depth has been exceeded.',
//             JSON_ERROR_STATE_MISMATCH => 'Invalid or malformed JSON.',
//             JSON_ERROR_CTRL_CHAR => 'Control character error, possibly incorrectly encoded.',
//             JSON_ERROR_SYNTAX => 'Syntax error.',
//             JSON_ERROR_UTF8 => 'Malformed UTF-8 characters, possibly incorrectly encoded.',
//             JSON_ERROR_RECURSION => 'One or more recursive references in the value to be encoded.',
//             JSON_ERROR_INF_OR_NAN => 'One or more NAN or INF values in the value to be encoded.',
//             JSON_ERROR_UNSUPPORTED_TYPE => 'A value of a type that cannot be encoded was given.',
//         ];
//         $errStr = isset($errorReference[$error]) ? $errorReference[$error] : "Unknown error ($error)";
//         throw new Exception("JSON decode error (" . $error . "): " . $errStr );
//     }
//     return $ld_response;
// }
function GetCommissions($affiliate_id) {
    $payload = getPayload();
    include('../lead_dyno.cfg.php');
    $ch = curl_init($leadDynoAffiliateUrl."/".$affiliate_id."/commissions?key=".$leadDynoPrivateKey);                                                                      
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);                                                                      
                                                                                                            
    $ld_json = curl_exec($ch);
    $ld_response = json_decode($ld_json, TRUE);
    if ($ld_response["error"] != undefined && !empty($ld_response["error"]))
        throw new Exception($ld_response["error"]);

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
        throw new Exception("JSON decode error (" . $error . "): " . $errStr );
    }
    return $ld_response;
}
function Put() {
    ouputHeader("405", "Method Not Allowed");
}
function Get() {
    spl_autoload_register('ld_commissions_autoloader');
    $Entity = new ld_commission();
    $result = undefined;
    $payload = "";
    try 
    {

        $ld_response = GetAffiliateId();
        if (isset($ld_response["id"]) && $ld_response["id"] != "")
        {
           $ld_commissions = GetCommissions($ld_response["id"]);
           returnResponse($ld_commissions);
        }

        
    }
    catch(Exception $e) {
        ouputHeader("400", "Bad Request");
        returnResponse("error: " . $e->getMessage());
    }
    finally {
        curl_close ($ch);
        die();
    }
    
}
function Delete() {
    ouputHeader("405", "Method Not Allowed");
}

?>