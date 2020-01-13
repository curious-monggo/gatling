<?php

	require("iSDK/isdk.php");
	$app = new iSDK;
	$app->cfgCon("connection");
	
	if (isset($_POST['val'])) {
		$val = $_POST['val'];
	} elseif (isset($_GET['val'])) {
		$val = $_GET['val'];
	}
	
	echo "Entered val GET: ".$_GET['val']."</br>";
	echo "Entered val POST: ".$_POST['val']."</br>";
	
	echo "Searched ph: ".$val."<br/>";
	
	//$returnFields = array('Id','FirstName','LastName','Email','Phone1', 'Phone1Type', 'Groups', 'LeadSource', "_AFFemail", '_AFFphone', '_GiftCardPin');
	//$returnFields = array('Id','Name','Label','DataType');
	//$returnFields = array('Id','DateCreated','Email','Type', 'LastClickDate', 'LastOpenDate', 'LastSentDate');
	//$returnFields = array('AffiliateId','ContactId','DateExpires', 'DateSet','IpAddress','Id', 'Info', 'Source', 'Type');
	//$returnFields = array('AffCode','ContactId','AffName', 'DefCommissionType', 'Id', 'SaleAmt', 'Status');
	
	
	//$query = array('LastName' => $val);
	

	//$contacts = $app->dsQuery("Contact",100,0,$query,$returnFields);
	//$contacts = $app->dsQuery("EmailAddStatus",100,0,$query,$returnFields);

	$returnFields = array('DataType', 'DefaultValue', 'FormId','GroupId', 'Id', 'Label', 'ListRows', 'Name', 'Values');
	$query = array('FormId' => 1);
	$contacts = $app->dsQuery("DataFormField",100,0,$query,$returnFields);
	echo '<br/>contact:<pre>',print_r($contacts,1),'</pre>';

	$query = array('FormId' => -1);
	$contacts = $app->dsQuery("DataFormField",100,0,$query,$returnFields);

	//$contacts = $app->dsQuery("Referral",100,0,$query,$returnFields);
	//$contacts = $app->dsQuery("Affiliate",100,0,$query,$returnFields);
	//$returnFields = array('ActionDate', 'ActionDescription', 'ContactId','ActionType', 'CreatedBy', 'CreationDate', 'CreationNotes', 'ObjectType');
	//$query = array('ContactId' => $val);
	//$contacts = $app->dsQuery("ContactAction",100,0,$query,$returnFields);
	
	
	echo '<br/>contact:<pre>',print_r($contacts,1),'</pre>';
	
?>	