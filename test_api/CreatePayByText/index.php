<?php 
require '../base.php';
function Post() {
	spl_autoload_register('CreatePayByText_autoloader');
	$payload = "";
	try {
		$payload = new getPayload();
		returnResponse($payload);

	} catch(Exception $e){
        ouputHeader("400", "Bad Request");
        returnResponse("error: " . $e->getMessage());
	} 

	// $ch = curl_init();
	// curl_setopt($ch, CURLOPT_URL,"https://wsclientapi.everyware.com/Service.asmx/CreatePayByText");
	// curl_setopt($ch, CURLOPT_POST, 1);
	// curl_setopt($ch, CURLOPT_POSTFIELDS,
 //            "Token=bc8fa570-cf06-478e-95e5-b3ac1406c752&Username=TravelJolly&PhoneNumber=4073256568&Amount=12.0&FirstName=Rj");
	// curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	// $server_output = curl_exec($ch);
	// curl_close ($ch);
    // returnResponse($server_output);

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