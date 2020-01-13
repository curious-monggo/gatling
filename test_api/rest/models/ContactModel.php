<?php

include 'BaseModel.php';

class ContactModel extends BaseModel
{

    public function __construct() {
        // $this->verb = $_SERVER['REQUEST_METHOD'];
        // $this->url_elements = explode('/', $_SERVER['PATH_INFO']);//an array of api/
        // $this->parseIncomingParams();
        // // initialise json as default format
        // $this->format = 'json';
        // if(isset($this->parameters['format'])) {
        //     $this->format = $this->parameters['format'];
        // }
        return true;
    }
    function getUrlParms($querystring) {
        $a = explode("&", $querystring);
        if (!(count($a) == 1 && $a[0] == "")) {
          foreach ($a as $key => $value) {
            $b = explode("=", $value);
            $a[$b[0]] = $b[1];
            unset ($a[$key]);
          }
        }
         return $a;
    }
    public function retrieve($request) {
        $result = "";

        try 
        {
            spl_autoload_register(function ($class) {
                include '../contacts/' . $class . '.class.php';
            });
            $tjEntity = new contact();

            $app = new iSDK;
            $app->cfgCon("connection");
    
            $queryParams = NULL;
            $queryString = $_SERVER['QUERY_STRING'];
            if (array_key_exists('id', $_GET)) { 
                if (empty($_GET['id'])) {
                //if id not set remove from querystring
                $queryString = str_replace('id=&', '', $queryString);
                } 
            }else{
                if (isset($request->url_elements[2]))
                    $queryString = $queryString . "id=".$request->url_elements[2];
            }
            $queryString = str_replace('path=', '', $queryString);
            $queryParams = $this->getUrlParms($queryString);
            //echo "qs: ".print_r($queryString);
            //echo "parms:".print_r($queryParams);
            //$returnFields = array('Id','FirstName','LastName','Email','Phone1', 'Phone1Type', 'Groups', 'LeadSource', "_AFFemail", '_AFFphone', '_GiftCardPin');
            $excludeCustomFields = TRUE;
            $returnFields = $tjEntity->getSelectFieldsArray($excludeCustomFields);
            if ($excludeCustomFields) {//so get custom fields from api
                $returnCustomFields = array('DataType', 'DefaultValue', 'FormId','GroupId', 'Id', 'Label', 'ListRows', 'Name', 'Values');
                $queryCustomFields = array('FormId' => -1);
                $customFields = $app->dsQuery("DataFormField",100,0,$queryCustomFields,$returnCustomFields);
                //echo "customFields: ".print_r($customFields);
                foreach ($customFields as $key=>$val)
                {
                    //if ($key["Name"] == "Name")
                        $returnFields[] = "_".$val["Name"];
                }
            }
            $query = $queryParams;
            //echo "<br>query = ".print_r($returnFields)."<br>";
            $result = $app->dsQuery("Contact",100,0,$query,$returnFields);
            //echo "result:".print_r($result);
        }
        catch(Exception $exception) {
             $result = array(array("error" => $exception->getMessage()));
         }
        return $result;
    }
}

?>