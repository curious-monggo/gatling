<?php

//$connInfo = array('connection:lf465:i:1fa7f149aafba224c5d0d8e305cb8f98:lf465.infusionsoft.com');



//before
//$connInfo = array('connection:lf465:i:c157e1313f98335fbdadf8f125d7b187:lf465.infusionsoft.com');
//acc name: lf465 TravelJolly RJ Randall
//app: lf465
//after
$connInfo = array(
    'connection:'.APP_NAME.':i:'.INFUSIONSOFT_API_KEY.':'.APP_NAME.'.infusionsoft.com');
?>
