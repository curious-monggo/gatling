<?php
//header('Access-Control-Allow-Origin: *');

require '../base.php';

function Post() {

    ouputHeader("405", "Method Not Allowed");
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