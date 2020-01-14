<?php
session_start(); 
define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PASS', '');
define('DB_NAME', 'gatling');

// Try and connect using the info above.
$con = mysqli_connect(DB_HOST, DB_USER, DB_PASS, DB_NAME);
if ( mysqli_connect_errno() ) {
	// If there is an error with the connection, stop the script and display the error.
	die ('Failed to connect to MySQL: ' . mysqli_connect_error());
} else {
	//echo 'connect Success';
}

?>