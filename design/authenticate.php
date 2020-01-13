<?php 
require 'config.php';
require 'functions.php';
	if(isset($_POST['email'], $_POST['password'])){
		//allow
		if(IsLoggedIn($_POST['email'], $_POST['password'])){
			header("Location: index.php");
		} else {
			header("Location: login.php");
		}
	} else {
		//redirect to login
		header("Location: login.php");
		
	}
	die();
?>