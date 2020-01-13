<?php

	require("iSDK/isdk.php");
	$app = new iSDK;
	$app->cfgCon("connection");
	
	if (isset($_POST['em'])) {
		$em = $_POST['em'];
	} elseif (isset($_GET['em'])) {
		$em = $_GET['em'];
	}
	
	echo "Entered em: ".$_GET['em']."</br>";
	
	$returnFields = array('Id','FirstName', 'LastName','Email','Phone1');
	$data = $app->findByEmail($em, $returnFields);
	
	echo '<pre>',print_r($data,1),'</pre>';
	
?>	