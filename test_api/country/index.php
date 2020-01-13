<?php
//header('Access-Control-Allow-Origin','https=>//rgreenconsortium.bookingenginegiftcard.com');
// header('Access-Control-Allow-Origin=> *');
header("Content-Type=> application/json; charset=UTF-8");

//http=>//traveljolly.com/api/contacts/

require '../base.php';

function Post() {

    spl_autoload_register('country_autoloader');
    $tjEntity = new country();
    $responseMessage = "test";
    $payload = "";
    try {
        $payload = getPayload();
        $responseMessage = "Get payload";
        if(isset($payload["contactId"])) {
            $contactId = $payload["contactId"];
        } else if(isset($payload["id"])) {
            $contactId = $payload["id"];
        }
        
        if(!isset($payload["overwrite"])){
            $payload["overwrite"] = false;
        }
        $responseGetContact = GetContact($contactId);
        if(array_key_exists("Phone1", $responseGetContact[0]) && !array_key_exists("Country", $responseGetContact[0]) || array_key_exists("Phone1", $responseGetContact[0]) && $payload["overwrite"] == true){
            //echo "Phone1 field exists while Country does not";
            $responseMessage = "API CALL";


            // set API Access Key
            $access_key = "936b9991b6655bd3cbcec12c7a28d8a9";

            // set phone number
            $phone_number = $responseGetContact[0]["Phone1"];
            $replace = array('(', ')', '-', ' ');

            $phone_number = str_replace($replace , '', $phone_number);
            // Initialize CURL=>
            $ch = curl_init('https://apilayer.net/api/validate?access_key='.$access_key.'&number='.$phone_number.'');  
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

            // Store the data=>
            $json = curl_exec($ch);
            curl_close($ch);

            // Decode JSON response=>
            $validationResult = json_decode($json, true);

            // Access and use your preferred validation result objects
            $validationResult['valid'];
            $validationResult['country_code'];
            $validationResult['carrier'];
            $validationResult['line_type'];
        

            $app = new iSDK;
            $app->cfgCon("connection");

            if($validationResult['valid']){
                //do search array
                $responseMessage = "valid";
                $array_countries = array(
                 "AF" => "Afghanistan",
                 "AX" => "Aland Islands",
                 "AL" => "Albania",
                 "DZ" => "Algeria",
                 "AS" => "American Samoa",
                 "AD" => "Andorra",
                 "AO" => "Angola",
                 "AI" => "Anguilla",
                 "AQ" => "Antarctica",
                 "AG" => "Antigua And Barbuda",
                 "AR" => "Argentina",
                 "AM" => "Armenia",
                 "AW" => "Aruba",
                 "AU" => "Australia",
                 "AT" => "Austria",
                 "AZ" => "Azerbaijan",
                 "BS" => "Bahamas (the)",
                 "BH" => "Bahrain",
                 "BD" => "Bangladesh",
                 "BB" => "Barbados",
                 "BY" => "Belarus",
                 "BE" => "Belgium",
                 "BZ" => "Belize",
                 "BJ" => "Benin",
                 "BM" => "Bermuda",
                 "BT" => "Bhutan",
                 "BO" => "Bolivia (Plurinational State of)",
                 "BQ" => "Bonaire, Sint Eustatius and Saba",
                 "BA" => "Bosnia And Herzegovina",
                 "BW" => "Botswana",
                 "BV" => "Bouvet Island",
                 "BR" => "Brazil",
                 "IO" => "British Indian Ocean Territory (the)",
                 "BN" => "Brunei Darussalam",
                 "BG" => "Bulgaria",
                 "BF" => "Burkina Faso",
                 "BI" => "Burundi",
                 "CV" => "Cabo Verde",
                 "KH" => "Cambodia",
                 "CM" => "Cameroon",
                 "CA" => "Canada",
                 "KY" => "Cayman Islands (the)",
                 "CF" => "Central African Republic (the)",
                 "TD" => "Chad",
                 "CL" => "Chile",
                 "CN" => "China",
                 "CX" => "Christmas Island",
                 "CC" => "Cocos (Keeling) Islands (the)",
                 "CO" => "Colombia",
                 "KM" => "Comoros (the)",
                 "CD" => "Congo (the Democratic Republic of the)",
                 "CG" => "Congo (the)",
                 "CK" => "Cook Islands",
                 "CR" => "Costa Rica",
                 "CI" => "Cote d'Ivoire",
                 "HR" => "Croatia",
                 "CU" => "Cuba",
                 "CW" => "Curacao",
                 "CY" => "Cyprus",
                 "CZ" => "Czech Republic (the)",
                 "DK" => "Denmark",
                 "DJ" => "Djibouti",
                 "DM" => "Dominica",
                 "DO" => "Dominican Republic (the)",
                 "EC" => "Ecuador",
                 "EG" => "Egypt",
                 "SV" => "El Salvador",
                 "GQ" => "Equatorial Guinea",
                 "ER" => "Eritrea",
                 "EE" => "Estonia",
                 "ET" => "Ethiopia",
                 "FK" => "Falkland Islands (the) [Malvinas]",
                 "FO" => "Faroe Islands (the)",
                 "FJ" => "Fiji",
                 "FI" => "Finland",
                 "FR" => "France",
                 "GF" => "French Guiana",
                 "PF" => "French Polynesia",
                 "TF" => "French Southern Territories (the)",
                 "GA" => "Gabon",
                 "GM" => "Gambia (the)",
                 "GE" => "Georgia",
                 "DE" => "Germany",
                 "GH" => "Ghana",
                 "GI" => "Gibraltar",
                 "GR" => "Greece",
                 "GL" => "Greenland",
                 "GD" => "Grenada",
                 "GP" => "Guadeloupe",
                 "GU" => "Guam",
                 "GT" => "Guatemala",
                 "GG" => "Guernsey",
                 "GN" => "Guinea",
                 "GW" => "Guinea-Bissau",
                 "GY" => "Guyana",
                 "HT" => "Haiti",
                 "HM" => "Heard Island and Mcdonald Islands",
                 "VA" => "Holy See (the)",
                 "HN" => "Honduras",
                 "HK" => "Hong Kong",
                 "HU" => "Hungary",
                 "IS" => "Iceland",
                 "IN" => "India",
                 "ID" => "Indonesia",
                 "IR" => "Iran (Islamic Republic Of)",
                 "IQ" => "Iraq",
                 "IE" => "Ireland",
                 "IM" => "Isle Of Man",
                 "IL" => "Israel",
                 "IT" => "Italy",
                 "JM" => "Jamaica",
                 "JP" => "Japan",
                 "JE" => "Jersey",
                 "JQ" => "Johnston Island",
                 "JO" => "Jordan",
                 "KZ" => "Kazakhstan",
                 "KE" => "Kenya",
                 "KI" => "Kiribati",
                 "KP" => "Korea (the Democratic People's Republic of)",
                 "KR" => "Korea (the Republic of)",
                 "KW" => "Kuwait",
                 "KG" => "Kyrgyzstan",
                 "LA" => "Lao People's Democratic Republic (the)",
                 "LV" => "Latvia",
                 "LB" => "Lebanon",
                 "LS" => "Lesotho",
                 "LR" => "Liberia",
                 "LY" => "Libya",
                 "LI" => "Liechtenstein",
                 "LT" => "Lithuania",
                 "LU" => "Luxembourg",
                 "MO" => "Macao",
                 "MK" => "Macedonia (the former Yugoslav Republic of)",
                 "MG" => "Madagascar",
                 "MW" => "Malawi",
                 "MY" => "Malaysia",
                 "MV" => "Maldives",
                 "ML" => "Mali",
                 "MT" => "Malta",
                 "MH" => "Marshall Islands (the)",
                 "MQ" => "Martinique",
                 "MR" => "Mauritania",
                 "MU" => "Mauritius",
                 "YT" => "Mayotte",
                 "MX" => "Mexico",
                 "FM" => "Micronesia (Federated States of)",
                 "MQ" => "Midway Islands",
                 "MD" => "Moldova (the Republic of)",
                 "MC" => "Monaco",
                 "MN" => "Mongolia",
                 "ME" => "Montenegro",
                 "MS" => "Montserrat",
                 "MA" => "Morocco",
                 "MZ" => "Mozambique",
                 "MM" => "Myanmar",
                 "NA" => "Namibia",
                 "NR" => "Nauru",
                 "NP" => "Nepal",
                 "NL" => "Netherlands (the)",
                 "NC" => "New Caledonia",
                 "NZ" => "New Zealand",
                 "NI" => "Nicaragua",
                 "NE" => "Niger (the)",
                 "NG" => "Nigeria",
                 "NU" => "Niue",
                 "NF" => "Norfolk Island",
                 "MP" => "Northern Mariana Islands (the)",
                 "NO" => "Norway",
                 "OM" => "Oman",
                 "PK" => "Pakistan",
                 "PW" => "Palau",
                 "PS" => "Palestine, State of",
                 "PA" => "Panama",
                 "PG" => "Papua New Guinea",
                 "PY" => "Paraguay",
                 "PE" => "Peru",
                 "PH" => "Philippines (the)",
                 "PN" => "Pitcairn",
                 "PL" => "Poland",
                 "PT" => "Portugal",
                 "PR" => "Puerto Rico",
                 "QA" => "Qatar",
                 "RE" => "Reunion",
                 "RO" => "Romania",
                 "RU" => "Russian Federation (the)",
                 "RW" => "Rwanda",
                 "BL" => "Saint Barthelemy",
                 "SH" => "Saint Helena, Ascension and Tristan da Cunha",
                 "KN" => "Saint Kitts And Nevis",
                 "LC" => "Saint Lucia",
                 "MF" => "Saint Martin (French part)",
                 "PM" => "Saint Pierre and Miquelon",
                 "VC" => "Saint Vincent and the Grenadines",
                 "WS" => "Samoa",
                 "SM" => "San Marino",
                 "ST" => "Sao Tome And Principe",
                 "SA" => "Saudi Arabia",
                 "SN" => "Senegal",
                 "RS" => "Serbia",
                 "SC" => "Seychelles",
                 "SL" => "Sierra Leone",
                 "SG" => "Singapore",
                 "MF" => "Sint Maarten (Dutch part)",
                 "SK" => "Slovakia",
                 "SI" => "Slovenia",
                 "SB" => "Solomon Islands",
                 "SO" => "Somalia",
                 "ZA" => "South Africa",
                 "GS" => "South Georgia and the Sandwich Islands",
                 "SS" => "South Sudan",
                 "ES" => "Southern Rhodesia", 
                 "ES" => "Spain",
                 "LK" => "Sri Lanka",
                 "SD" => "Sudan (the)",
                 "SR" => "Suriname",
                 "SJ" => "Svalbard and Jan Mayen",
                 "SZ" => "Swaziland",
                 "SE" => "Sweden",
                 "CH" => "Switzerland",
                 "SY" => "Syrian Arab Republic",
                 "TW" => "Taiwan (Province of China)",
                 "TJ" => "Tajikistan",
                 "TZ" => "Tanzania, United Republic of",
                 "TH" => "Thailand",
                 "TL" => "Timor-Leste",
                 "TG" => "Togo",
                 "TK" => "Tokelau",
                 "TO" => "Tonga",
                 "TT" => "Trinidad and Tobago",
                 "TN" => "Tunisia",
                 "TR" => "Turkey",
                 "TM" => "Turkmenistan",
                 "TC" => "Turks And Caicos Islands (the)",
                 "TV" => "Tuvalu",
                 "UG" => "Uganda",
                 "UA" => "Ukraine",
                 "AE" => "United Arab Emirates (the)",
                 "GB" => "United Kingdom",
                 "US" => "United States",
                 "UM" => "United States Minor Outlying Islands (the)",
                 "BF" => "Upper Volta",
                 "UY" => "Uruguay",
                 "UZ" => "Uzbekistan",
                 "VU" => "Vanuatu",
                 "VE" => "Venezuela (Bolivarian Republic of)",
                 "VN" => "Viet Nam",
                 "VG" => "Virgin Islands (British)",
                 "VI" => "Virgin Islands (U.S.)",
                 "WF" => "Wallis and Futuna",
                 "EH" => "Western Sahara",
                 "YE" => "Yemen",
                 "ZM" => "Zambia",
                 "ZW" => "Zimbabwe"
                );
                
                if(array_key_exists($validationResult['country_code'], $array_countries)){
                    $payload["Country"] = $array_countries[$validationResult['country_code']];

                    $updateCountry = array();

                    try {
                        $updateCountry = array(
                            'Country' => $payload['Country']
                        );

                        $updateCon = $app->dsUpdate("Contact", $contactId, $updateCountry);
                        if(is_numeric($updateCon)) {
                            $responseMessage = "Country set";
                            $addResult = $app->grpAssign($contactId, 1133);
                            
                            if($addResult == true){
                                $responseMessage = "Country set and tag 1133 added";
                                if($validationResult['line_type'] == "mobile"){
                                    $addResult = $app->grpAssign($contactId, 1503);
                                    $responseMessage = "Country set, tag 1133 and 1503 added";
                                } else if($validationResult['line_type'] == "landline"){
                                    $addResult = $app->grpAssign($contactId, 1505);
                                    $responseMessage = "Country set, tag 1133 and 1505 added";
                                } else if($validationResult['line_type'] == "special_services"){
                                    $addResult = $app->grpAssign($contactId, 1507);
                                    $responseMessage = "Country set, tag 1133 and 1507 added";
                                } else if($validationResult['line_type'] == "toll_free"){
                                    $addResult = $app->grpAssign($contactId, 1509);
                                    $responseMessage = "Country set, tag 1133 and 1509 added";
                                } else if($validationResult['line_type'] == "premium_rate"){
                                    $addResult = $app->grpAssign($contactId, 1511);
                                    $responseMessage = "Country set, tag 1133 and 1511 added";
                                } else if($validationResult['line_type'] == "satellite"){
                                    $addResult = $app->grpAssign($contactId, 1513);
                                    $responseMessage = "Country set, tag 1133 and 1513 added";
                                } else if($validationResult['line_type'] == "paging"){
                                    $addResult = $app->grpAssign($contactId, 1515);
                                    $responseMessage = "Country set, tag 1133 and 1515 added";
                                } else {
                                    $addResult = $app->grpAssign($contactId, 1517);
                                    $responseMessage = "Country set, tag 1133 and 1517 added";
                                }

                            } else {
                                $responseMessage = "Country set but tag 1133 not added"; 
                            }
                        } else {
                            $responseMessage = "Infusionsoft Error: ".$updateCon;
                        }
						
						/*
                        $addResult = $app->grpAssign($payload["id"], 1133);
                        $responseMessage = "Country set";
                        if($addResult == true){
                            $responseMessage = "Country and tag 1133 set";
                        }
                        returnResponse($responseMessage);
						*/
                    }
                    catch(Exception $exception) {
                        throw new Exception("error:".$exception->getMessage());
                    }

                }
            } else {
                //if not valid
                $addResult = $app->grpAssign($contactId, 1539);
                $responseMessage = "Invalid number: $phone_number of contact id: $contactId , country not set, tag 1539 added";
            }





        }        
        returnResponse($responseMessage);
        //  ouputHeader("201", "Created");
        //  //returnResponse("http=>//traveljolly.com/api/contacts/".$result, false);
        //  returnResponse($payload["id"]);
    }
    catch(Exception $e) {
        ouputHeader("400", "Bad Request");
        returnResponse("error=> " . $e->getMessage());
    }
}
function Put() {

    spl_autoload_register('contacts_autoloader');
    $tjEntity = new contact();

    $payload = "";
    try {

        if (isset($_GET["id"]) && !empty($_GET["id"])) {
            $id = $_GET["id"];
        } else {
            throw new Exception("How about some data dude.");
        };
        $app = new iSDK;
        $app->cfgCon("connection");
        $payload = getPayload($payload);
        $groups = ""; $addGroups = ""; $removeGroups = "";
        if (isset($payload["Groups"]))
        {
            $groups = $payload["Groups"];
            unset($payload["Groups"]);
        }
        if (isset($payload["addGroups"]))
        {
            $addGroups = explode(",", $payload["addGroups"]);
            unset($payload["addGroups"]);
        }
        if (isset($payload["removeGroups"]))
        {
            $removeGroups = explode(",", $payload["removeGroups"]);
            unset($payload["removeGroups"]);
        }

        if (!empty($payload))
        {
            $result = $app->dsUpdate("Contact", $id, $payload);
            if (strpos($result, 'ERROR') !== false)
                throw new Exception($result);
        }
        if (is_array($removeGroups))
        {
            foreach($removeGroups as $group) {
                $removeResult = $app->grpRemove($id, $group);
            }
        }
        if (is_array($addGroups))
        {
            foreach($addGroups as $group) {
                $addResult = $app->grpAssign($id, $group);
            }
        }
    }
    catch(Exception $e) {
        ouputHeader("400", "Bad Request");
        returnResponse("error=> " . $e->getMessage());
    }
    returnResponse($result);
}

function Get() {
   // echo "URI=>".$_SERVER["REQUEST_URI"];
   // echo "method=>".$_SERVER['REQUEST_METHOD'];
   // echo "pathinfo=>".$_SERVER["PATH_INFO"];
   // $url_elements = explode('/', $_SERVER['PATH_INFO']);
   // echo "uri=>".print_r($url_elements);
    try {
        
        spl_autoload_register('contacts_autoloader');
        $tjEntity = new contact();
        $app = new iSDK;
        $app->cfgCon("connection");

        $queryParams = "";
        $queryString = $_SERVER['QUERY_STRING'];
        if (array_key_exists('id', $_GET)) { 
            if (empty($_GET['id'])) {
            //if id not set remove from querystring
            $queryString = str_replace('id=&', '', $queryString);
            } 
        }
        $queryString = str_replace('path=', '', $queryString);
        $queryParams = getUrlParms($queryString);
        //echo "qs=> ".print_r($queryString);
        //$returnFields = array('Id','FirstName','LastName','Email','Phone1', 'Phone1Type', 'Groups', 'LeadSource', "_AFFemail", '_AFFphone', '_GiftCardPin');
        $excludeCustomFields = TRUE;
        $returnFields = $tjEntity->getSelectFieldsArray($excludeCustomFields);
        if ($excludeCustomFields) {//so get custom fields from api
            $returnCustomFields = array('DataType', 'DefaultValue', 'FormId','GroupId', 'Id', 'Label', 'ListRows', 'Name', 'Values');
            $queryCustomFields = array('FormId' => -1);
            $customFields = $app->dsQuery("DataFormField",100,0,$queryCustomFields,$returnCustomFields);
            //echo "customFields=> ".print_r($customFields);
            foreach ($customFields as $key=>$val)
            {
                //if ($key["Name"] == "Name")
                    $returnFields[] = "_".$val["Name"];
            }
        }
        $query = $queryParams;
        //echo "<br>query = ".print_r($returnFields)."<br>";
        $result = $app->dsQuery("Contact",100,0,$query,$returnFields);

        //echo "queryparms=> ".print_r($queryParams)." x</br>";
        // echo "Entered val GET=> ".$_GET['val']." x</br>";
        // echo "Entered val POST=> ".$_POST['val']." x</br>";
        // echo "querystring=> ".$_SERVER['QUERY_STRING']." x</br>";
        // echo "params=> ".print_r($queryParams)." x</br>";
        // echo "properties=> ".$tjEntity->getSelectClause()." x</br>";


    }
    catch(Exception $exception) {
         ouputHeader("400", "Bad Request");
         returnResponse("error=> " . $exception->getMessage());
     }
     
    returnResponse($result);
}
function Delete() {
    ouputHeader("405", "Method Not Allowed");
}
function GetContact($contactid) {

    try {
        
        spl_autoload_register('country_autoloader');
        $tjEntity = new country();
        $app = new iSDK;
        $app->cfgCon("connection");

        $returnFields = array('Id','FirstName','LastName','Email','Phone1', 'Country');
        $query =array('Id' => $contactid);
        //echo "ReturnFields=>".print_r($returnFields);
        //echo "query=> ".print_r($query);

        $result = $app->dsQuery("Contact",100,0,$query,$returnFields);

        //echo "result=> ".print_r($result);
        return $result;
    }
    catch(Exception $exception) {
         ouputHeader("400", "Bad Request");
         returnResponse("error=> " . $exception->getMessage());
     }
}
?>