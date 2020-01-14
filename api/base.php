<?php
//http://traveljolly.com/api
// error_reporting(E_ALL & ~E_STRICT);
error_reporting(0);
require 'configuration.php';
require '../../search/iSDK/isdk.php';

function defineIfsConfig($app_name, $infusionsoft_api_key){
    define("APP_NAME",$app_name);
    define("INFUSIONSOFT_API_KEY", $infusionsoft_api_key);
}

// function CreatePayByText_autoloader($class) {
//     include 'CreatePayByText/' . $class . '.class.php';
// }
// function tj_phone_requests_autoloader($class) {
//     include 'phone_requests/' . $class . '.class.php';
// }
// function tj_phone_sent_sms_autoloader($class) {
//     include 'phone_sent_sms/' . $class . '.class.php';
// }
// function tj_phone_status_autoloader($class) {
//     include 'phone_status/' . $class . '.class.php';
// }
function contacts_autoloader($class) { 
    include 'contacts/' . $class . '.class.php';
}
// function country_autoloader($class) { 
//     include 'country/' . $class . '.class.php';
// }
// function aff_info_autoloader($class) { 
//     include 'aff_info/' . $class . '.class.php';
// }
// function begc_login_autoloader($class) { 
//     include 'begc_login/' . $class . '.class.php';
// }
// function phone2_autoloader($class) { 
//     include 'phone2/' . $class . '.class.php';
// }
// function emailaddstatus_autoloader($class) {
//     include 'emailaddstatus/' . $class . '.class.php';
// }
// function affiliates_autoloader($class) {
//     include 'affiliates/' . $class . '.class.php';
// }
// function ld_affiliates_autoloader($class) {
//     include 'ld_affiliates/' . $class . '.class.php';
// }
// function referrals_autoloader($class) {
//     include 'referrals/' . $class . '.class.php';
// }
// function notes_autoloader($class) {
//     include 'notes/' . $class . '.class.php';
// }
// function tj_activation_code_autoloader($class) {
//     include 'activation_codes/' . $class . '.class.php';
// }
// /*LEO*/
// function tj_is_activation_code_autoloader($class) {
//     include 'is_activation_codes/' . $class . '.class.php';
// }

// function tj_is_activation_code_clone_autoloader($class) {
//     include 'is_activation_codes_clone/' . $class . '.class.php';
// }

// function tj_begc_activation_codes_autoloader($class) {
//     include 'begc_activation_codes/' . $class . '.class.php';
// }
// function tj_activation_codes_expiry_autoloader($class) {
//     include 'activation_codes_expiry/' . $class . '.class.php';
// }
// function payments_autoloader($class) {
//     include 'payments/' . $class . '.class.php';
// }
// function parsey_autoloader($class) {
//     include 'parsey/' . $class . '.class.php';
// }
// function contactgroups_autoloader($class) { 
//     include 'contactgroups/' . $class . '.class.php';
// }
// function contactactions_autoloader($class) { 
//     include 'contactactions/' . $class . '.class.php';
// }
// function ld_purchases_autoloader($class) {
//     include 'ld_purchases/' . $class . '.class.php';
// }
// function ld_commissions_autoloader($class) {
//     include 'ld_commissions/' . $class . '.class.php';
// }
// function quizzes_autoloader($class) {
//     include 'quizzes/' . $class . '.class.php';
// }
// //added this line to support new folder, interact quiz on 21/09/2019
// function interact_quiz_autoloader($class) {
//     include 'interact_quiz/' . $class . '.class.php';
// }
// function tj_visits_autoloader($class) {
//     include 'tj_visits/' . $class . '.class.php';
// }
// function ccharges_autoloader($class) {
//     include 'ccharges/' . $class . '.class.php';
// }
// function invoicepayments_autoloader($class) {
//     include 'invoicepayments/' . $class . '.class.php';
// }
// function verifyphonenumbers_autoloader($class) {
//     include 'verifyphonenumbers/' . $class . '.class.php';
// }
// function tj_business_partners_autoloader($class) {
//     include 'tj_business_partners/' . $class . '.class.php';
// }

$method = $_SERVER['REQUEST_METHOD'];

if (isset($_SERVER['HTTP_AUTHORIZATION']) && $_SERVER['HTTP_AUTHORIZATION'] != "")
{
    
    if (isAuthorized($_SERVER['HTTP_AUTHORIZATION'])) {
        route($method);
    }
    else {
        ouputHeader("401", "Not Authorized");
        //throw new Exception("Not Authorized");
    }
}else{
    ouputHeader("401", "Not Authorized");
    //route($method);
}

function route($method) {
    switch ($method) {
        case "POST":
            Post();
            break;
        case "PUT":
            Put();
            break;
        case "GET":
            Get();
            break;
        case "DELETE":
            Delete();
            break;
        default:
            header("HTTP/1.1 405 Method Not Allowed");
            //throw new Exception('Method Not Allowed.');
            break;
    }
}
function isAuthorized($token)
{
    $validTokens = array(
        'Bearer xa403', 
        'Bearer lf465', 
        'Bearer 9a88b64f687d4c1f84af75db092a9c47', 
        'Bearer 313e89399d1f40c292cefd333873fa0d',
        'Bearer 0f78b1973fc94aff98216851f037ee0d');

        

        function getCompany($code){
            // Try and connect using the info above.
            $con = mysqli_connect('localhost', 'root', '', 'gatling');
            if ( mysqli_connect_errno() ) {
                // If there is an error with the connection, stop the script and display the error.
                die ('Failed to connect to MySQL: ' . mysqli_connect_error());
            } else {
                //echo 'connect Success';
            }
            if ($stmt = $con->prepare('SELECT id, name, code, infusionsoft_key FROM companies WHERE code = ?')) {
                // Bind parameters (s = string, i = int, b = blob, etc), in our case the username is a string so we use "s"
                $stmt->bind_param('s', $code);
                $stmt->execute();
                // Store the result so we can check if the company exists in the database.
                $result = $stmt->get_result();
                if ($result->num_rows > 0) {
                    //create array and object
                    $company = [];
                    
                    while($row = $result->fetch_assoc()) {
                        $company['id'] = $row['id'];
                        $company['name'] = $row['name'];
                        $company['code'] = $row['code'];
                        $company['infusionsoft_key'] = $row['infusionsoft_key'];
                    }
                    return $company;
                } else {
                    //empty, show blank 
                    // return false;
                }
                $stmt->close();
            } else {
                // return false;
            }
        }
    // if(in_array($token, $validTokens))
    // {
    //     var_export(getCompany('lf465'));
    //     defineIfsConfig(
    //         'lf465',
    //         'c157e1313f98335fbdadf8f125d7b187'
    //     );
    //     return TRUE;
    // }  
    $cleanedToken = str_replace("Bearer ", "", $token);
    if($company = getCompany($cleanedToken))
    {
        //var_export(getCompany('lf465'));
        defineIfsConfig(
            $company['code'],
            $company['infusionsoft_key']
        );
        return TRUE;
    }  
    return FALSE;
}
        

function doPost($payload, $gatlingEntity) {
    try {

        $conn = new \PDO(   "mysql:host=$gatlingEntity->servername;dbname=$gatlingEntity->dbname", $gatlingEntity->username, $gatlingEntity->password,
                    array(
                        \PDO::ATTR_ERRMODE => \PDO::ERRMODE_EXCEPTION,
                        \PDO::ATTR_PERSISTENT => false
                    )
                );
        
        $payload = (array) $payload;//convert payload to array for processing
        $sql = $gatlingEntity->getInsertClause($payload);
        $prep = $conn->prepare($sql);
        foreach($payload as $key=>$val){
            $prep->bindValue($key, $val);
        }
        $prep->execute();
        $result = $conn->lastInsertId();
        ouputHeader("201", "Created");


    }
    catch(PDOException $e) {
        ouputHeader("400", "Bad Request");
        returnResponse("error: " . $e->getMessage());
    }
    finally {
        $conn = null;
    }
    return $result;
}
function doGet($gatlingEntity) {
    $id = null;
    $email = null;
    $guid = null;
    $prospect_phone = null;
    $result = null;
    try {
        if (isset($_GET["id"]) && !empty($_GET["id"])) {
            $id = $_GET["id"];
        } else {
            throw new Exception("How about some data dude.");
        };
        if (is_numeric($id) && $id > 0 && $id == round($id, 0)){
            //validate as number

        } else {
            if (preg_match("/^(\{)?[a-f\d]{8}(-[a-f\d]{4}){4}[a-f\d]{8}(?(1)\})$/i", $id)) {
                $guid = $id;
            } else {
                //is it a phonenumber expecting + countrycode etc like +1234567890
                if (validPhoneNumber($id)) {
                    $prospect_phone = str_replace("$2B", "+", $id);
                    $id = null;
                 } else {
                    //validate as email
                    $email = $id;
                    $id = null;
                 }
            }
        }
//url formate like http://traveljolly.com/api/phone_status/rjr@traveljolly.com&val=test&name=aname&third=3
    //Entered val GET: test x</br>Entered val POST:  x</br>querystring: id=rjr@traveljolly.com&val=test&name=aname&third=3 x</br>Array
            // (
            //     [id] => rjr@traveljolly.com
            //     [val] => test
            //     [name] => aname
            //     [third] => 3
            // )
            //params: 1 x</br>
        // $queryParams = undefined;
        // parse_str($_SERVER['QUERY_STRING'], $queryParams);
        // echo "Entered val GET: ".$_GET['val']." x</br>";
        // echo "Entered val POST: ".$_POST['val']." x</br>";
        // echo "querystring: ".$_SERVER['QUERY_STRING']." x</br>";
        // echo "params: ".print_r($queryParams)." x</br>";
        

        $gatlingEntity -> rid = $id;
        $gatlingEntity -> affiliate_email = $email;
        $gatlingEntity -> guid = $guid;
        $gatlingEntity -> prospect_phone = $prospect_phone;
        $result = Fetch($gatlingEntity);
    }
    catch(Exception $exception) {
        throw $exception;
    }
    return $result;
}
function validPhoneNumber($no) {
    //could send in array
    $array = array(
        // '0 000 (000) 000-0000',
        // '000 (000) 000-0000',
        // '0-000-000-000-0000',
        // '000 (000) 000-0000',
        // '000-000-000-0000',
        // '000-00-0-000-0000',
        // '0000-00-0-000-0000',
        // '+000-000-000-0000',
        // '0 (000) 000-0000',
        // '+0-000-000-0000',
        // '0-000-000-0000',
        // '000-000-0000',
        // '(000) 000-0000',
        // '000-0000',
        // '+9981824139',
        // 9981824139,
        // 919981824139,
        '+919981824139'
        );
        //if sending in array then uncomment next foreach but record the status 1 or nothing for each array element
        //foreach($array AS $no){    
                    return ( ( preg_match( '/\d?(\s?|-?|\+?|\.?)((\(\d{1,4}\))|(\d{1,3})|\s?)(\s?|-?|\.?)((\(\d{1,3}\))|(\d{1,3})|\s?)(\s?|-?|\.?)((\(\d{1,3}\))|(\d{1,3})|\s?)(\s?|-?|\.?)\d{3}(-|\.|\s)\d{4}/', $no )
                    ||
                    preg_match('/([0-9]{8,13})/', str_replace(' ', '', $no))
                    ||
                    ( preg_match('/^\+?\d+$/', $no) && strlen($no) >= 8 && strlen($no) <= 13 ) )
                  );
           // }
        
}
function getURL() {
    $actual_link = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
    return $actual_link;
}
function getPayload() {
    try {

        $payload = json_decode(file_get_contents('php://input'),true);
        if ($payload == '' )
        {
            if ($_SERVER['REQUEST_METHOD'] == "POST") 
            {
                if (empty($_SERVER['QUERY_STRING']) ) {
                    foreach ( $_POST as $key => $value )
                        $payload[$key] = $value;
                }
                else {

                    foreach ( $_GET as $key => $value )
                        $payload[$key] = $value;
                }
            }
            else {
                foreach ( $_GET as $key => $value )
                    $payload[$key] = $value;
            }
        }
        return $payload;
    }
    catch(Exception $exception) {
        //returnData(array(array("error" => $exception->getMessage())));
        //return array(array("error" => $exception->getMessage()));
        throw new Exception(array(array("error" => $exception->getMessage())));
    }
}
function getAllPayload() {
    try {

        $payload = json_decode(file_get_contents('php://input'),true);

        foreach ( $_POST as $key => $value )
            $payload[$key] = $value;


        foreach ( $_GET as $key => $value )
            $payload[$key] = $value;


        return $payload;
    }
    catch(Exception $exception) {
        //returnData(array(array("error" => $exception->getMessage())));
        //return array(array("error" => $exception->getMessage()));
        throw new Exception(array(array("error" => $exception->getMessage())));
    }
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
function getValueFromStringUrl($url, $parameter_name)
{
    $parts = parse_url($url);
    if(isset($parts['query']))
    {
        parse_str($parts['query'], $query);
        if(isset($query[$parameter_name]))
        {
            return $query[$parameter_name];
        }
        else
        {
            return null;
        }
    }
    else
    {
        return null;
    }
}
function generateGuid() {

    if (function_exists('com_create_guid') === true)
        return trim(com_create_guid(), '{}');
    
    $data = openssl_random_pseudo_bytes(16);
    $data[6] = chr(ord($data[6]) & 0x0f | 0x40);
    $data[8] = chr(ord($data[8]) & 0x3f | 0x80);
    return vsprintf('%s%s-%s-%s-%s-%s%s%s', str_split(bin2hex($data), 4));

}
function isValidURL($URL) {
    $string = $URL;
    if(filter_var($string, FILTER_VALIDATE_URL)){
        return TRUE;
    }
    return FALSE;
}
function getTinyUrl($urlToShorten, $keyWord, $title) {

    $endPoint = "http://tinytj.com/yourls-api.php?";//signature=05e2685fc7&action=shorturl&format=json&url=http://www.traveljolly.com/index100_1.html&keyword=test2&title=Thesecondtest";
    $data = array(
        'signature' => '05e2685fc7',
        'action' => 'shorturl',
        'format' => 'json',
        'url' => $urlToShorten,
        'keyword' => $keyWord,
        'title' => $title
    );
    
    // Init the CURL session
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $endPoint);
    curl_setopt($ch, CURLOPT_HEADER, 0);            // No header in the result
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true); // Return, do not echo result
    curl_setopt($ch, CURLOPT_POST, 1);              // This is a POST request
    curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
    
    // Fetch and return content
    $data = curl_exec($ch);
    curl_close($ch);
    
    $data = json_decode( $data );
    if (isset($data->shorturl) && $data->shorturl != '') {
        return $data->shorturl;
    }
    return $data->shorturl." not shortened".$urlToShorten;
}
function Fetch($gatlingEntity) {

    $result = array(array("error" => " no results"));
    try {
        $conn = new \PDO(   "mysql:host=$gatlingEntity->servername;dbname=$gatlingEntity->dbname", $gatlingEntity->username, $gatlingEntity->password,
                    array(
                        \PDO::ATTR_ERRMODE => \PDO::ERRMODE_EXCEPTION,
                        \PDO::ATTR_PERSISTENT => false
                    )
                );

        $handle = $gatlingEntity->getSelectClause($conn, $gatlingEntity, 100);
        //echo print_r($handle);
        //echo print_r($gatlingEntity);
        $handle->execute();

        $result = $handle->fetchAll(\PDO::FETCH_OBJ);
    }
    catch(PDOException $exception) {
        ouputHeader("400", "Bad Request");
        returnResponse("error: " . $exception->getMessage());
    }
    finally {
        $conn = null;
    }
    return $result;
}
function ouputHeader($response_code, $response_string) {
    //http_response_code(404);
    // 200 'OK'
    // 201 'Created' and should provide link to GET record
    // 202 'Accepted'
    // 204 'Content'
    // 400 'Bad Request'
    // 401 'Unauthorized'
    // 402 'Payment Required'
    // 403 'Forbidden'
    // 404 'Not Found'
    // 405 'Method Not Allowed'
    // 406 'Not Acceptable'
    // 413 'Request Entity Too Large'
    // 414 'Request-URI Too Large'
    // 415 'Unsupported Media Type'
    // 500 'Internal Server Error'
    // 501 'Not Implemented'
    // 502 'Bad Gateway'
    // 503 'Service Unavailable'
    // 504 'Gateway Time-out'
    // 505 'HTTP Version not supported'
    header("HTTP/1.1 ".$response_code. " ".$response_string);
    header("Content-Type: application/json");
    header("Expires: 0");
    header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
    header("Cache-Control: no-store, no-cache, must-revalidate");
    header("Cache-Control: post-check=0, pre-check=0", false);
    header("Pragma: no-cache");
}
function returnResponseWithHeader($httpCode, $httpMessage, $data, $encode = true) {

    ouputHeader($httpCode, $httpMessage);

    returnResponse($data, $encode);

}
function returnResponse($data, $encode = true) { 
    if (is_array($data)){
        if (empty($data)) {
            echo json_encode(array(array("nodata" => " failed to return data")));
        }
        else {
            echo json_encode($data);
        }
    }
    else {
        //echo json_encode(array(array("error" => $_GET["action"] . " failed to retrieve data")));
        if ($encode)
            echo json_encode(array(array("data" => $data)));
        else
            echo $data;
    }
}
?>