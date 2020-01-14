<?php
//http://traveljolly.com/api/tj_business_partners/
require '../base.php';

function Post() {
    try {


        spl_autoload_register('tj_business_partners_autoloader');
        $gatlingEntity = new tj_business_partner();
        $exists = false;
        $payload = getAllPayload();
        echo "payload:".print_r($payload);
        $gatlingEntity-> company_name = $payload["company_name"];
        $result = lookupBizPartner($gatlingEntity);

        if (empty($result)) {
            $payload["row_version"] = generateGuid();
            $payload["created_by"] = "tj_business_partner api";
            $result = writeBizPartnerRecord($payload, $gatlingEntity);
            $writeResult["row_version"] = $payload["row_version"];
        }else{
            $exists = true;
            $writeResult = (array)$result[0];
        }

    }
    catch(Exception $exception) {
         ouputHeader("400", "Bad Request");
         returnResponse("error: " . $exception->getMessage());
     }
     if ($exists)
        ouputHeader("200", "Ok");
     else
     {
        ouputHeader("201", "Accepted");
        returnResponse("http://traveljolly.com/api/tj_business_partner/".$writeResult["row_version"], false);
     }

}
function Put() {
    ouputHeader("405", "Method Not Allowed");
}
function Get() {
    ouputHeader("405", "Method Not Allowed");
}
function lookupBizPartner($gatlingEntity) {

    $result = NULL;
    try {


        $result = Fetch($gatlingEntity);

    }
    catch(Exception $exception) {
         ouputHeader("400", "Bad Request");
         returnResponse("error: " . $exception->getMessage());
     }
     
    return $result;
}

function writeBizPartnerRecord($payload, $gatlingEntity) {
    try
    {


        $result = doPost($payload, $gatlingEntity);
        //$result["rid"] = $postResult;
    }
    catch(Exception $exception) {

    }
    return $result;
}
function Delete() {
    ouputHeader("405", "Method Not Allowed");
}

?>