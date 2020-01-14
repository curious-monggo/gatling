<?php


foreach ( $_GET as $key => $value )
    $payload[$key] = $value;

if (isset($_SERVER['HTTP_REFERER']))
    $payload["http_referer"] = $_SERVER['HTTP_REFERER'];
if (isset($_SERVER['HTTP_USER_AGENT']))
    $payload["http_user_agent"] = $_SERVER['HTTP_USER_AGENT'];

$payload["remote_ip_address"] = getUserIP();
$payload["host_name"] = gethostbyaddr($payload["remote_ip_address"]);

writeVisit($payload);

header("Content-type: image/gif");
readfile("tracker.gif");

function getUserIP() {
    if( array_key_exists('HTTP_X_FORWARDED_FOR', $_SERVER) && !empty($_SERVER['HTTP_X_FORWARDED_FOR']) ) {
        if (strpos($_SERVER['HTTP_X_FORWARDED_FOR'], ',')>0) {
            $addr = explode(",",$_SERVER['HTTP_X_FORWARDED_FOR']);
            return trim($addr[0]);
        } else {
            return $_SERVER['HTTP_X_FORWARDED_FOR'];
        }
    }
    else {
        return $_SERVER['REMOTE_ADDR'];
    }
}
function writeVisit($payload) {
    try
    {

        $postData = json_encode($payload);
        //echo "postData:".print_r($postData);
        //return;
        $opts = array('http' =>
            array(
                'method'  => "POST",
                "Content-Type" => "application/json",
                'header' => "Authorization: fc0eb8ab9c9c40469c560468bdc2621b\r\n" . "Content-Type: application/json\r\n",
                'content' => $postData
            )
        );

        $url = "https://traveljolly.com/api/tj_visits/";
        $context = stream_context_create($opts);
        $json = file_get_contents($url, false, $context);

    }
    catch(Exception $e) {

    }
    finally {

    }
}
?>