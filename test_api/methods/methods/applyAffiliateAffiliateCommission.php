<?php
function applyAffiliateAffiliateTag($tjpayload) {
    $affiliateContactResult = GetContactByEmail($tjpayload["_AFFemail"]);
    if ( array_key_exists("nodata", $affiliateContactResult[0]))
        return;
    $aff_affiliateContactResult = GetContactByEmail($affiliateContactResult["_AFFemail"]);
    if ( array_key_exists("nodata", $aff_affiliateContactResult[0]))
        return;
    if (array_key_exists("Groups", $aff_affiliateContactResult[0]))
    {
        $groups = explode(',', $aff_affiliateContactResult[0]["Groups"]);
        if (in_array(716, $groups)) //if a biz then they have tag 716
        {
            
            //update contactid's contact record with tag 834
            $updateContactPayload = array(
                "addGroups"=> "1929"
            );
            $updateContactResponse = updateContact($tjpayload["contactid"], $updateContactPayload);//uses tj contact api
            //echo "tagged 834";

        }else{
            
            //update contactid's contact record with tag 836
            $updateContactPayload = array(
                "addGroups"=> "1927"
            );
            $updateContactResponse = updateContact($tjpayload["contactid"], $updateContactPayload);//uses tj contact api
             //echo "tagged 836";

        }

    }


}
function applyAffiliateAffiliateCommission($tjpayload) {

    //use AFFemail to lookup contact record and 
    $affiliateContactResult = GetContactByEmail($tjpayload["_AFFemail"]);
    if ( array_key_exists("nodata", $affiliateContactResult[0]))
        return;

    //if has tag 716 then 
    $isABiz=false;
    if(isset($tjpayload["tag"])){
        //echo "has tag";
    } else {
        $tjpayload["tag"] = "yes";
         //echo "created tag=yes";
    }
    if (array_key_exists("Groups", $affiliateContactResult[0]))
    {
        $groups = explode(',', $affiliateContactResult[0]["Groups"]);
        if (in_array(716, $groups)) //if a biz then they have tag 716
        {
            if($tjpayload["tag"] == "yes"){
                //update contactid's contact record with tag 834
                $updateContactPayload = array(
                    "addGroups"=> "834"
                );
                $updateContactResponse = updateContact($tjpayload["contactid"], $updateContactPayload);//uses tj contact api
                //echo "tagged 834";
            }
    // if (isset($tjpayload["tag"])){
    //     unset($tjpayload["tag"]);
    // }

            $isABiz=true;

        }else{
            if($tjpayload["tag"] == "yes"){
                //update contactid's contact record with tag 836
                $updateContactPayload = array(
                    "addGroups"=> "836"
                );
                $updateContactResponse = updateContact($tjpayload["contactid"], $updateContactPayload);//uses tj contact api
                 //echo "tagged 836";
            }


        }

        
        
        // if (in_array(370, $groups))
        // {
        //     $updateContactPayload = array(
        //         "addGroups"=> "834"
        //     );
        //     $updateContactResponse = updateContact($tjpayload["contactid"], $updateContactPayload);//uses tj contact api
        // }

    }
    if(isset($tjpayload["commission"]) && $tjpayload["commission"]=="no"){
        returnResponse("Did not write commission");

    } else {
        //then take _AFFemail and lookup affiliate's affiliate contact record
        if ($isABiz && isset($affiliateContactResult[0]["_AFFemail"]) && $affiliateContactResult[0]["_AFFemail"] != "")
        {
            $affiliatesAffiliateContactResult = GetContactByEmail($affiliateContactResult[0]["_AFFemail"]);

            if ( array_key_exists("nodata", $affiliatesAffiliateContactResult[0]))
                return;

            //take aff's aff contact record and pay PayAmt to tj commission
            $commissionPayload = getPayload();
        if (isset($tjpayload["tag"]))
            unset($tjpayload["tag"]);
            $commissionPayload["_AFFemail"] = $affiliatesAffiliateContactResult[0]["Email"];
            writeTJCommission($commissionPayload); 
        }    
    }


    //ouputHeader("201", "Created");
}

function GetInvoicePaymentByPaymentId($paymentid) {

    try {
        
        spl_autoload_register('invoicepayments_autoloader');
        $tjEntity = new invoicepayment();
        $app = new iSDK;
        $app->cfgCon("connection");

        $returnFields = $tjEntity->getSelectFieldsArray(TRUE);
        $query =array('PaymentId' => $paymentid);
        //echo "ReturnFields:".print_r($returnFields);
        //echo "query: ".print_r($query);

        $result = $app->dsQuery("InvoicePayment",100,0,$query,$returnFields);

        //echo "result: ".print_r($result);
        return $result;
    }
    catch(Exception $exception) {
         //ouputHeader("400", "Bad Request");
         //returnResponse("error: " . $exception->getMessage());
         echo "ERROR: ".$exception->getMessage();
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
function writeTJCommission($tjpayload) {
    spl_autoload_register('ld_commissions_autoloader');
    $tjEntity = new tj_commission();
    //$tjpayload = getPayload();
    if (isset($tjpayload["tag"]))
    unset($tjpayload["tag"]);
    if (isset($tjpayload["commission"]))
    unset($tjpayload["commission"]);
    if (isset($tjpayload["Authorization"]))
        unset($tjpayload["Authorization"]);
    if (isset($tjpayload["currency"]))
        unset($tjpayload["currency"]);
    if (isset($tjpayload["method"]))
        unset($tjpayload["method"]);
    if (isset($tjpayload["contactid"]))
        unset($tjpayload["contactid"]);
    if (isset($tjpayload["_AFFemail"])) 
    {
        $tjpayload["email"] = $tjpayload["_AFFemail"];
        unset($tjpayload["_AFFemail"]);
    }
    if (isset($tjpayload["Pay_Amt"])) 
    {
        $tjpayload["amount"] = $tjpayload["Pay_Amt"];
        unset($tjpayload["Pay_Amt"]);
    }
    if (isset($tjpayload["PaymentId"])) 
    {
        $tjpayload["payment_id"] = $tjpayload["PaymentId"];
        unset($tjpayload["PaymentId"]);
    }
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
    doPost($tjpayload, $tjEntity);
}

?>