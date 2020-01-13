<?php 
  require("iSDK/isdk.php");

  try 
  {

    $app = new iSDK;
    $app->cfgCon("connection");

    
    $returnFields = array('Id','GroupDescription', 'GroupName');
    $query = array('GroupName' => '%');
    $tags = $app->dsQuery("ContactGroup",1000,0,$query,$returnFields);

    echo "TAGS:".print_r(json_encode($tags));
  }
  catch(Exception $exception) 
  {
    ouputHeader("400", "Bad Request");
    returnResponse("error: " . $exception->getMessage());
  }





?>