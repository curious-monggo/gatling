<?php
//http://traveljolly.com/api/activation_codes/
require '../base.php';

function Post() {
    // spl_autoload_register('tj_is_activation_code_autoloader');
    // $gatlingEntity = new is_activation_code();

    // $payload = "";
    // try {

    //     $payload = getPayload();
    //     $payload["guid"] = generateGuid();
    //     $result = $gatlingEntity->Create($payload);
    //     //$result is the insert query with parms not data
    //     //{"queryString":"INSERT INTO tj_activation_codes (first_name, last_name, activation_code, initial_value, guid) VALUES(:first_name, :last_name, :activation_code, :initial_value, :guid)"}
        
    //     ouputHeader("201", "Created");

    //     returnResponse("http://traveljolly.com/api/is_activation_codes/".$payload["guid"], false);
    // }
    // catch(Exception $e) {
    //     ouputHeader("400", "Bad Request");
    //     returnResponse("error: " . $e->getMessage());
    // }



    
    
    
    $payload = "";
    $responseMessage = "";
    spl_autoload_register('tj_is_activation_code_clone_autoloader');
    $gatlingEntity = new is_activation_code_clone();

    $gatlingEntity->setMe();

    $activationCodeResult = GetMyCardActivationCode($gatlingEntity->contactId);
    //echo $activationCodeResult[0]["_MyCardActivationCode"];

    if(!isset($activationCodeResult[0]["_MyCardActivationCode"])){
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
            
            $gatlingEntity->rows = 1;

            
            $result_retrieve = $gatlingEntity-> Retrieve();
            if(isset($result_retrieve[0]->rid) && isset($result_retrieve[0]->activation_code)){
	            $gatlingEntity->rid = $result_retrieve[0]->rid;
	            $payload["activation_code"] = $result_retrieve[0]->activation_code;
	            
	            $result_update = $gatlingEntity->Update($payload);

	            //update infusionsoft field

	            $app = new iSDK;
	            $app->cfgCon("connection");
	            $updateMyGiftCard = array();

	            try {
	                $updateMyGiftCard = array(
	                    '_MyCardActivationCode' => $payload['activation_code']
	                );

                    $updateCon = $app->dsUpdate("Contact", $gatlingEntity->contactId, $updateMyGiftCard);
                    /*
                    since update success of IFS returns the contact id, then check the response. 
                    Is it numeric, like 2080? Then success. If not then return the IFS error 
                    code to the client. See line below
                
                    $responseMessage = "Infusionsoft Error: ".$updateCon;

                    */
                    if(is_numeric($updateCon)) {
                        $responseMessage = "Activation code added";
                        $addResult = $app->grpAssign($gatlingEntity->contactId, 1149);
                        
                        if($addResult == true){
                            $responseMessage = "Activation code and tag 1149 added";
                        }  
                    } else {
                        $responseMessage = "Infusionsoft Error: ".$updateCon;
                    }

	            }
	            catch(Exception $exception) {
	                throw new Exception("error:".$exception->getMessage());
	            }
            } else {
            	$responseMessage = "No activation codes are available.";
            }




        }
        catch(Exception $exception) {
            ouputHeader("400", "Bad Request");
            returnResponse("error: " . $exception->getMessage());
        }
    } else {
        $responseMessage = "Activation code already available.";
    }

    returnResponse($responseMessage);

}
function Put() {
    spl_autoload_register('tj_is_activation_code_clone_autoloader');
    $gatlingEntity = new is_activation_code_clone();

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

        spl_autoload_register('tj_is_activation_code_clone_autoloader');
        $gatlingEntity = new is_activation_code_clone();

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
        
        spl_autoload_register('contacts_autoloader');
        $gatlingEntity = new contact();
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

function GetMyCardActivationCode($contactid) {

    try {
        
        spl_autoload_register('contacts_autoloader');
        $gatlingEntity = new contact();
        $app = new iSDK;
        $app->cfgCon("connection");

        $returnFields = array('Id','_MyCardActivationCode');
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
     
    $result;
}
?>