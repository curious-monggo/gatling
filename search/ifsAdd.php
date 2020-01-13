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
	
	// Check if contact already exist
	$returnFields = array('Id','FirstName', 'LastName','Email','Phone1');
	$data = $app->findByEmail($em, $returnFields);
	
	echo 'Existing Match on Email: (if the array is empty the contact will be added)<pre>',print_r($data,1),'</pre>';
	
	// The last variable determines how you 
	// want to match records. In this case 
	// I only matched based on 'Email', but 
	// we could have used 'EmailAndName', or
	// 'EmailAndNameAndCompany'
	$app->addWithDupCheck(array('FirstName' => $fn, 'LastName' => $ln, 'Email' => $em, 'Phone1' => $ph), 'Email');
	
	$returnFields = array('Id','FirstName', 'LastName','Email','Phone1');
	$data = $app->findByEmail($em, $returnFields);
	
	echo 'Updated or Added contact: <pre>',print_r($data,1),'</pre>';
	
	
?>	