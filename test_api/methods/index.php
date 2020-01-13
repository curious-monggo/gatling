<?php
//header('Access-Control-Allow-Origin: *');
//http://traveljolly.com/api/methods/

require 'methods/applyAffiliateAffiliateCommission.php';
require '../base.php';


function Post() {
    // echo "testing the endpoint. Sorry for inconvenience.";
    // var_export(getAllPayload());
    try {

        $payload = getAllPayload();
        switch ($payload["method"]) {
            case "updateProspect":
                updateProspect($payload);
                break;
            case "applyAffiliateAffiliateCommission":
                applyAffiliateAffiliateCommission($payload);
            case "IsAffiliateSAffiliateBusiness":
                applyAffiliateAffiliateTag($payload);
                break; 
            default:
                throw new Exception("Undetermined method.");
                break;
        }

    }
    catch(Exception $e) {
        ouputHeader("400", "Bad Request");
        returnResponse("error: " . $e->getMessage());
    }
    // finally {

    // }

}

function updateProspect($payload) {
    $group_needle = "1921";
    if (isset($payload["contactid"])) {
        $prospectContactResult = GetContactByContactId($payload["contactid"]);
        if (isset($prospectContactResult[0]["_AFFemail"]))
        {
            $affiliateContactResult = GetContactByEmail($prospectContactResult[0]["_AFFemail"]);
            
            if(isset($affiliateContactResult[0]["Groups"])){
                $affiliateContactGroups = $affiliateContactResult[0]["Groups"];
                if(strpos($affiliateContactGroups, $group_needle)) {
                    $addGroups ="516";
                } else {
                    $addGroups ="518";
                }
            }
            // if (isset($affiliateContactResult[0]["_AFFactivity"])) {
            //     $addGroups ="516";
            // }
            // else {
            //     $addGroups ="518";
            // }
            $postArray = array();
            $postArray["addGroups"] = $addGroups;
            $updateContactResult = updateContact($payload["contactid"], $postArray);
        }
        else {
            throw new Exception("_AFFemail not present.");
        }
    }
    else {
        throw new Exception("Invalid contactId");
    }

}
function GetContactByContactId($contact_id) {
    $url = "https://traveljolly.com/api/contacts/".$contact_id;
    $opts = array(
        'http'=>array(
        'method'=>"GET",
        'header' => "Authorization: fc0eb8ab9c9c40469c560468bdc2621b"                 
        )
    );
    $context = stream_context_create($opts);
    $json = file_get_contents($url, false, $context);
    //$json = file_get_contents($url);
    $result = json_decode($json, true);
    return $result;
}
function GetContactByEmail($emailaddress) {
    $url = "https://traveljolly.com/api/contacts/?Email=" . $emailaddress;
    $opts = array(
        'http'=>array(
        'method'=>"GET",
        'header' => "Authorization: fc0eb8ab9c9c40469c560468bdc2621b"                 
        )
    );
    $context = stream_context_create($opts);
    $json = file_get_contents($url, false, $context);
    //$json = file_get_contents($url);
    $result = json_decode($json, true);
    return $result;
}
function updateContact($contactId, $postArray) {
	    if (isset($postArray["tag"])){
        unset($postArray["tag"]);
    }
    $postData = json_encode($postArray);
    //echo "postData:".print_r($postData);
    //return;
    $opts = array('http' =>
        array(
            'method'  => "PUT",
            'header' => "Authorization: fc0eb8ab9c9c40469c560468bdc2621b\r\n" . "Content-Type: application/json\r\n",
            'content' => $postData
        )
    );

    $url = "https://traveljolly.com/api/contacts/" . $contactId;
    $context = stream_context_create($opts);
    $json = file_get_contents($url, false, $context);
}
function Put() {

    ouputHeader("405", "Method Not Allowed");
    try {

    }
    catch(Exception $e) {
        ouputHeader("400", "Bad Request");
        returnResponse("error: " . $e->getMessage());
    }
    finally {

    }
    //returnResponse($result);
}

function Get() {
    $payload = getPayload();
    try {

        ouputHeader("405", "Method Not Allowed");
    }
    catch(Exception $exception) {
         ouputHeader("400", "Bad Request");
         returnResponse("error: " . $exception->getMessage());
     }
     
    //returnResponse($result);
}
function Delete() {
    ouputHeader("405", "Method Not Allowed");
}

?>