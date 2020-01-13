<?php

	require("iSDK/isdk.php");
	$app = new iSDK;
	$app->cfgCon("connection");
	
	// I'm assuming if you're passing 1 variable you're passing all
	echo "Entered: </br>";
	if (isset($_POST['em'])) {
		$em = $_POST['em'];
		$fn = $_POST['fn'];
		$ln = $_POST['ln'];
		$ph = $_POST['ph'];
		foreach($_POST as $key=>$value){
			echo $key, ' => ', $value, "<br/>";
		}
	} elseif (isset($_GET['em'])) {
		$em = $_GET['em'];
		$fn = $_GET['fn'];
		$ln = $_GET['ln'];
		$ph = $_GET['ph'];
		foreach($_GET as $key=>$value){
			echo $key, ' => ', $value, "<br/>";
		}
	}
	
	// We can only update if we have the ID for that table
	// This searches the Contact table for the Id using this email
	$returnFields = array('Id','FirstName','LastName','Phone1','Email');
	$query = array('Email' => $em);
	$conId = $app->dsQuery("Contact",10,0,$query,$returnFields);
	
	echo 'Getting Id: <br/>'.$conId[0][Id].'<br/>';
	
	echo 'Existing Info: <br/><pre>',print_r($conId,1),'</pre>';
	
	$update = array('Phone1' => $ph,
					'FirstName' => $fn,
					'LastName' => $ln);
	$updateCon = $app->dsUpdate("Contact", $conId[0][Id], $update);
	
	$returnFields = array('Id','FirstName','LastName','Phone1','Email');
	$query = array('Email' => $em);
	$upconId = $app->dsQuery("Contact",10,0,$query,$returnFields);
	
	echo 'Updated info: <br/><pre>',print_r($upconId,1),'</pre>';
?>	