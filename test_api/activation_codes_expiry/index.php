<?php
//http://traveljolly.com/api/activation_codes/
require '../base.php';

function Post() {
        
    $payload = "";
    $responseMessage = "";
    spl_autoload_register('tj_activation_codes_expiry_autoloader');
    $tjEntity = new activation_codes_expiry();

    $tjEntity->setMe();
    if(isset($tjEntity->contactId)){
        $activationCodeResult = GetMyCardActivationCode($tjEntity->contactId);
        // var_export($activationCodeResult);
        if($activationCodeResult[0]["_ActivationCodeExpirationDate"] && isset($tjEntity->contactId)){
            $expirationDate = $activationCodeResult[0]["_ActivationCodeExpirationDate"];
            date_default_timezone_set("America/New_York");
            $expirationDateTime = new DateTime($expirationDate);

            $currentDateTime = new DateTime('America/New_York');
            $currentDateTime->setTime( 0, 0 );

            // var_dump($expirationDateTime == $currentDateTime);
            // var_dump($expirationDateTime > $currentDateTime);
            // var_dump($expirationDateTime < $currentDateTime);
            // var_export($expirationDateTime->format('Y-m-d H:i:s'));
            // var_export($currentDateTime->format('Y-m-d H:i:s'));
            if($expirationDateTime > $currentDateTime){
                $interval = $currentDateTime->diff($expirationDateTime);
                // $interval->format('%R%a day/s');
                $responseMessage = $interval->format('%R%a day/s')." left before expiration";
            } else{
                $responseMessage = "Activation code expired";
            }
        }
    }
    


    // foreach($activationCodeResult as $key => $value) {
    //     if(!$activationCodeResult[$key]["_MyCardActivationCode"]){
    //         try {
    //             $contactResult = GetContact($tjEntity->contactId);
    //             $payload["first_name"] =$contactResult[$key]["FirstName"];
    //             $payload["last_name"] =$contactResult[$key]["LastName"];
    //             $payload["email_address"] =$contactResult[$key]["Email"];
    
    //             $currentDateTime = new DateTime('America/New_York');
    //             $currentDateTime->setTime( 0, 0 );
    
    //             $payload["start_date"] = $currentDateTime-> format('Y-m-d H:i:s');
    
    //             $currentDateTime->add(new DateInterval('P1Y'));
    
    //             $payload["end_date"] = $currentDateTime->format('Y-m-d H:i:s');  
                
    //             $tjEntity->rows = 1;
    
                
    //             $result_retrieve = $tjEntity-> Retrieve();
    //             $tjEntity->rid = $result_retrieve[0]->rid;
    //             $payload["activation_code"] = $result_retrieve[0]->activation_code;
                
    //             $result_update = $tjEntity->Update($payload);
    
    //             //update infusionsoft field
    
    //             $app = new iSDK;
    //             $app->cfgCon("connection");
    //             $updateMyGiftCard = array();
    
    //             try {
    //                 $updateMyGiftCard = array(
    //                     '_MyCardActivationCode' => $payload['activation_code']
    //                 );
    
    //                 $updateCon = $app->dsUpdate("Contact", $tjEntity->contactId, $updateMyGiftCard);
    //                 $responseMessage = "Activation code added";
    //             }
    //             catch(Exception $exception) {
    //                 throw new Exception("error:".$exception->getMessage());
    //             }
    
    
    
    //         }
    //         catch(Exception $exception) {
    //             ouputHeader("400", "Bad Request");
    //             returnResponse("error: " . $exception->getMessage());
    //         }
    //     } else {
    //         $responseMessage = "Activation code already available.";
    //     }
    // }

    returnResponse($responseMessage);

}
function Put() {
    spl_autoload_register('tj_activation_codes_expiry_autoloader');
    $tjEntity = new activation_codes_expiry();

    $payload = "";
    try {
        $payload = getPayload();

        $tjEntity->setMe();

        $result = $tjEntity->Update($payload);

        Get();
    }
    catch(Exception $e) {
        ouputHeader("400", "Bad Request");
        returnResponse("error: " . $e->getMessage());
    }
}
function Get() {

    // try {

    //     spl_autoload_register('tj_activation_codes_expiry_autoloader');
    //     $tjEntity = new activation_codes_expiry();

    //     $tjEntity->setMe();
    //     //$result = doGet($tjEntity);
    //     $result = $tjEntity-> Retrieve();

    // }
    // catch(Exception $exception) {
    //     ouputHeader("400", "Bad Request");
    //     returnResponse("error: " . $exception->getMessage());
    // }
     
    // returnResponse($result);
    $payload = "";
    $responseMessage = "";
    spl_autoload_register('tj_activation_codes_expiry_autoloader');
    $tjEntity = new activation_codes_expiry();

    $tjEntity->setMe();
    if(isset($tjEntity->contactId)){
        $activationCodeResult = GetMyCardActivationCode($tjEntity->contactId);
        //var_export($activationCodeResult);
        if(isset($activationCodeResult[0]["_ActivationCodeExpirationDate"])){
            $expirationDate = $activationCodeResult[0]["_ActivationCodeExpirationDate"];
            date_default_timezone_set("America/New_York");
            $expirationDateTime = new DateTime($expirationDate);

            $currentDateTime = new DateTime('America/New_York');
            $currentDateTime->setTime( 0, 0 );

            // var_dump($expirationDateTime == $currentDateTime);
            // var_dump($expirationDateTime > $currentDateTime);
            // var_dump($expirationDateTime < $currentDateTime);
            // var_export($expirationDateTime->format('Y-m-d H:i:s'));
            // var_export($currentDateTime->format('Y-m-d H:i:s'));
            if($expirationDateTime > $currentDateTime){
                $interval = $currentDateTime->diff($expirationDateTime);
                // $interval->format('%R%a day/s');
                $responseMessage = $interval->format('%R%a day/s')." left before expiration";
            } else {
                $responseMessage = "Activation code expired";
            }
        } else{
            $responseMessage = "_ActivationCodeExpirationDate not found";
        }
    }
    returnResponse($responseMessage);
    // echo "GET";
}
function Delete() {
    ouputHeader("405", "Method Not Allowed");
}

function GetContact($contactid) {

    try {
        
        spl_autoload_register('tj_activation_codes_expiry_autoloader');
        $tjEntity = new activation_codes_expiry();
        $app = new iSDK;
        $app->cfgCon("connection");

        $returnFields = array('Id','FirstName','LastName','Email','Phone1');
        $query =array('Id' => $contactid);
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
}

function GetMyCardActivationCode($contactid) {

    try {
        
        spl_autoload_register('tj_activation_codes_expiry_autoloader');
        $tjEntity = new activation_codes_expiry();
        $app = new iSDK;
        $app->cfgCon("connection");

        $returnFields = array('Id','_MyCardActivationCode', '_ActivationCodeExpirationDate');
        $query =array('Id' => $contactid);
        //echo "ReturnFields:".print_r($returnFields);
        //echo "query: ".print_r($query);

        $result = $app->dsQuery("Contact",1,0,$query,$returnFields);

        //echo "result: ".print_r($result);
        return $result;
    }
    catch(Exception $exception) {
         ouputHeader("400", "Bad Request");
         returnResponse("error: " . $exception->getMessage());
     }     
}
?>