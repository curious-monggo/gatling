<?php
//http://traveljolly.com/api/activation_codes/
require '../base.php';

function Post() {
    
    $payload = "";
    $responseMessage = "";
    $oldActivationCodes = "";
    $hasActivationCodes;
    spl_autoload_register('tj_begc_activation_codes_autoloader');
    $gatlingEntity = new begc_activation_code();

    $gatlingEntity->setMe();

    $activationCodeResult = GetBookingEngineGCActivationCodes($gatlingEntity->contactId);
    if(isset($activationCodeResult[0]["_BookingEngineGCActivationCodes"])){
        $hasActivationCodes = true;
        $oldActivationCodes = $activationCodeResult[0]["_BookingEngineGCActivationCodes"];
    } else{
        $hasActivationCodes = false;
    }
    // echo $activationCodeResult[0]["_MyCardActivationCode"];

    // if(!isset($activationCodeResult[0]["_MyCardActivationCode"])){
        try {


            
            $contactResult = GetContact($gatlingEntity->contactId);
            $payload["first_name"] =$contactResult[0]["FirstName"];
            $payload["last_name"] =$contactResult[0]["LastName"];
            $payload["email_address"] =$contactResult[0]["Email"];

            $currentDateTime = new DateTime('America/New_York');
            $currentDateTime->setTime( 0, 0 );

            $payload["start_date"] = $currentDateTime-> format('Y-m-d H:i:s');

            $currentDateTime->add(new DateInterval('P1Y'));

            $payload["end_date"] = $currentDateTime->format('Y-m-d H:i:s');  
            
            // echo ;

            
            $result_retrieve = $gatlingEntity-> Retrieve();
            $result_activation_codes_list = array();
            foreach($result_retrieve as $result_key => $result_value){
                
                if(isset($result_retrieve[$result_key]->rid) && isset($result_retrieve[$result_key]->activation_code)){
                    $gatlingEntity->rid = $result_retrieve[$result_key]->rid;
                    $payload["activation_code"] = $result_retrieve[$result_key]->activation_code;
                    
                    $result_update = $gatlingEntity->Update($payload);
                    array_push($result_activation_codes_list, $result_retrieve[$result_key]->activation_code);
                    //update infusionsoft field

                    // $app = new iSDK;
                    // $app->cfgCon("connection");
                    // $updateMyGiftCard = array();

                    // try {
                    //     $updateMyGiftCard = array(
                    //         '_BookingEngineGCActivationCodes' => $payload['activation_code']
                    //     );

                    //     $updateCon = $app->dsUpdate("Contact", $gatlingEntity->contactId, $updateMyGiftCard);
                    //     $responseMessage = "Activation code added";
                    //     // $addResult = $app->grpAssign($gatlingEntity->contactId, 1149);
                        
                    //     // if($addResult == true){
                    // 	// 	$responseMessage = "Activation code and tag 1149 added";
                    //     // }
                    // }
                    // catch(Exception $exception) {
                    //     throw new Exception("error:".$exception->getMessage());
                    // }
                } else {
                    $responseMessage = "No activation codes are available.";
                }



            }
            $comma_separated_activation_codes = implode(",", $result_activation_codes_list);
            if($hasActivationCodes) {
                $comma_separated_activation_codes = $oldActivationCodes.",".$comma_separated_activation_codes;
            }
            //update infusionsoft field

            $app = new iSDK;
            $app->cfgCon("connection");
            $updateMyGiftCard = array();

            try {
                $updateMyGiftCard = array(
                    '_BookingEngineGCActivationCodes' => $comma_separated_activation_codes
                );

                $updateCon = $app->dsUpdate("Contact", $gatlingEntity->contactId, $updateMyGiftCard);
                $responseMessage = "Activation code/s added";
                // $addResult = $app->grpAssign($gatlingEntity->contactId, 1149);
                
                // if($addResult == true){
                // 	$responseMessage = "Activation code and tag 1149 added";
                // }
            }
            catch(Exception $exception) {
                throw new Exception("error:".$exception->getMessage());
            }
            // var_export($comma_separated_activation_codes);
            // if(isset($result_retrieve[0]->rid) && isset($result_retrieve[0]->activation_code)){
	        //     $gatlingEntity->rid = $result_retrieve[0]->rid;
	        //     $payload["activation_code"] = $result_retrieve[0]->activation_code;
	            
	        //     $result_update = $gatlingEntity->Update($payload);

	        //     //update infusionsoft field

	        //     $app = new iSDK;
	        //     $app->cfgCon("connection");
	        //     $updateMyGiftCard = array();

	        //     try {
	        //         $updateMyGiftCard = array(
	        //             '_MyCardActivationCode' => $payload['activation_code']
	        //         );

	        //         $updateCon = $app->dsUpdate("Contact", $gatlingEntity->contactId, $updateMyGiftCard);
	        //         $responseMessage = "Activation code added";
	        //         $addResult = $app->grpAssign($gatlingEntity->contactId, 1149);
	                
	        //         if($addResult == true){
			// 			$responseMessage = "Activation code and tag 1149 added";
	        //         }
	        //     }
	        //     catch(Exception $exception) {
	        //         throw new Exception("error:".$exception->getMessage());
	        //     }
            // } else {
            // 	$responseMessage = "No activation codes are available.";
            // }




        }
        catch(Exception $exception) {
            ouputHeader("400", "Bad Request");
            returnResponse("error: " . $exception->getMessage());
        }
    // } else {
    //     $responseMessage = "Activation code already available.";
    // }

    returnResponse($responseMessage);

}
function Put() {
    spl_autoload_register('tj_begc_activation_codes_autoloader');
    $gatlingEntity = new begc_activation_code();

    $payload = "";
    try {
        $payload = getPayload();

        $gatlingEntity->setMe();

        $result = $gatlingEntity->Update($payload);

        Get();
    }
    catch(Exception $e) {
        ouputHeader("400", "Bad Request");
        returnResponse("error: " . $e->getMessage());
    }
}
function Get() {

    try {

        spl_autoload_register('tj_begc_activation_codes_autoloader');
        $gatlingEntity = new begc_activation_code();

        $gatlingEntity->setMe();
        //$result = doGet($gatlingEntity);
        $result = $gatlingEntity-> Retrieve();

    }
    catch(Exception $exception) {
         ouputHeader("400", "Bad Request");
         returnResponse("error: " . $exception->getMessage());
     }
     
     returnResponse( $result);
    // $payload = "";
    // try {

    //     spl_autoload_register('tj_is_activation_code_autoloader');
    //     $gatlingEntity = new is_activation_code();

    //     $gatlingEntity->setMe();

    //     $contactResult = GetContact($gatlingEntity->contactId);
    //     $payload["first_name"] =$contactResult[0]["FirstName"];
    //     $payload["last_name"] =$contactResult[0]["LastName"];
    //     $payload["email_address"] =$contactResult[0]["Email"];

    //     $currentDateTime = new DateTime('America/New_York');
    //     $currentDateTime->setTime( 0, 0 );

    //     $payload["start_date"] = $currentDateTime-> format('Y-m-d H:i:s');

    //     $currentDateTime->add(new DateInterval('P1Y'));

    //     $payload["end_date"] = $currentDateTime->format('Y-m-d H:i:s');  
        
    //     $gatlingEntity->rows = 1;

        
    //     $result_retrieve = $gatlingEntity-> Retrieve();
    //     $gatlingEntity->rid = $result_retrieve[0]->rid;
    //     $payload["activation_code"] = $result_retrieve[0]->activation_code;
        
    //     $result_update = $gatlingEntity->Update($payload);

    //     //update infusionsoft field

    //     $app = new iSDK;
    //     $app->cfgCon("connection");
    //     $updateMyGiftCard = array();

    //     try {
    //         $updateMyGiftCard = array(
    //             '_MyCardActivationCode' => $payload['activation_code']
    //         );

    //         $updateCon = $app->dsUpdate("Contact", $gatlingEntity->contactId, $updateMyGiftCard);
    //     }
    //     catch(Exception $exception) {
    //         throw new Exception("error:".$exception->getMessage());
    //     }



    // }
    // catch(Exception $exception) {
    //      ouputHeader("400", "Bad Request");
    //      returnResponse("error: " . $exception->getMessage());
    //  }
    // returnResponse($payload);
    // returnResponse($result[0]["rid"]);
}
function Delete() {
    ouputHeader("405", "Method Not Allowed");
}

function GetContact($contactid) {

    try {
        
        spl_autoload_register('tj_begc_activation_codes_autoloader');
        $gatlingEntity = new begc_activation_code();
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
     
    $result;
}

function GetBookingEngineGCActivationCodes($contactid) {
    try {
        spl_autoload_register('tj_begc_activation_codes_autoloader');
        $gatlingEntity = new begc_activation_code();
        $app = new iSDK;
        $app->cfgCon("connection");

        $returnFields = array('Id','_BookingEngineGCActivationCodes');
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