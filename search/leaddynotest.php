<?php 

  $val = undefined;
  if (isset($_POST['val'])) {
    $val = $_POST['val'];
  } elseif (isset($_GET['val'])) {
    $val = $_GET['val'];
  }
  $processed = FALSE;
  $ERROR_MESSAGE = '';

  // ************* Call API:
  $payload = json_decode(file_get_contents('php://input'),true);
  $payload['key'] = "c95d01adf750790897cfbe7eaa4f8f9e3b141e05";
  // $data = array(
  //   "key" => "c95d01adf750790897cfbe7eaa4f8f9e3b141e05", 
  //   "email" => $val,
  //   "first_name" => "testjim",
  //   "last_name" => "testeller",
  //   "affiliate_code" => "testaffcode"
  // );                                                                    
  $data_string = json_encode($payload);                                                                                   
                                                                                                                      
  $ch = curl_init('https://api.leaddyno.com/v1/affiliates');                                                                      
  curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");                                                                     
  curl_setopt($ch, CURLOPT_POSTFIELDS, $data_string);                                                                  
  curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);                                                                      
  curl_setopt($ch, CURLOPT_HTTPHEADER, array(                                                                          
      'Content-Type: application/json',                                                                                
      'Content-Length: ' . strlen($data_string))                                                                       
  );                                                                                                                   
  //echo "<br>curling<br>";                                                                                                                     
  $json = curl_exec($ch);
  if ($json === false)
  {
  // throw new Exception('Curl error: ' . curl_error($crl));
    echo 'Curl error: ' . curl_error($ch);
  }

  curl_close ($ch);
  //echo "<br>curled" . $json . "<br>";
  //$json=preg_replace('/\s+/', '',$json);
  //$json = utf8_encode($json);
  //$decodedJson = getBetween($json, '{', '}');
  // var_dump(count($decodedJson));
  echo "decoded Json: " . print_r(json_decode($json, TRUE)) . "<br>";//true decodes to an array
  //$decodedJson = json_encode($decodedJson);
  //$obj = json_decode($json);//decode to an object
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
    echo "JSON decode error (" . $error . "): " . $errStr ;
    
  }
  // echo "<br>data: " + $obj->{'data'} + "<br>";
  // echo "<br>objectId=" . $obj->{'objectId'} . "<b.r>";
  // echo "<br>email=" . $obj->{'email'} . "<br>";
  // echo "<br>name=" . $obj->{'name'} . "<br>";
  // if ($obj->{'objectId'} == '1')
  // {
  //   echo "objectId:" . $obj->{'objectId'};
  //   $processed = TRUE;
  // }else{
  //   $ERROR_MESSAGE = $obj->{'data'};
  // }

  // if (!$processed && $ERROR_MESSAGE != '') {
  //     echo $ERROR_MESSAGE;
  // }
  die();




?>