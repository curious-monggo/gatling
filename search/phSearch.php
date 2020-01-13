<?php

	require("iSDK/isdk.php");
	$app = new iSDK;
	$app->cfgCon("connection");
	
	if (isset($_POST['ph'])) {
		$ph = $_POST['ph'];
	} elseif (isset($_GET['ph'])) {
		$ph = $_GET['ph'];
	}
	
	echo "Entered ph: ".$_GET['ph']."</br>";
	
	// InfusionSoft will always return the phone 
	// number formated as (xxx) xxx-xxxx so we 
	// need to strip what's entered & format it 
	// for the search
	
	// There's no match on less than 10 digits
	
	
	$ph = str_replace('-', '', $ph); 
	$ph = preg_replace('/[^0-9]/','',$ph);

	echo "Cleaned ph: ".$ph."</br>";
	
	// This may be overkill, a hacked preg_replace
	// may have been enough
	if(strlen($ph) > 10) {
		$countryCode = substr($ph, 0, strlen($ph)-10);
		$areaCode = substr($ph, -10, 3);
		$nextThree = substr($ph, -7, 3);
		$lastFour = substr($ph, -4, 4);
		//	$ph = '+'.$countryCode.' ('.$areaCode.') '.$nextThree.'-'.$lastFour; // leave out country code
			$ph = '('.$areaCode.') '.$nextThree.'-'.$lastFour;
	}
	else if(strlen($ph) == 10) {
		$areaCode = substr($ph, 0, 3);
		$nextThree = substr($ph, 3, 3);
		$lastFour = substr($ph, 6, 4);
			$ph = '('.$areaCode.') '.$nextThree.'-'.$lastFour;
	}
	else if(strlen($ph) == 7) {
		$nextThree = substr($ph, 0, 3);
		$lastFour = substr($ph, 3, 4);
			$ph = $nextThree.'-'.$lastFour;
		}

	echo "Searched ph: ".$ph."<br/>";
	
	$returnFields = array('Id','FirstName','LastName','Email','Phone1');
	$query = array('Phone1' => $ph);
	$contacts = $app->dsQuery("Contact",10,0,$query,$returnFields);
	
	
	echo '<br/>contact:<pre>',print_r($contacts,1),'</pre>';
	
?>	