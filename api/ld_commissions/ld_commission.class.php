<?php
//might want to include a base entity in the future include('../infusionsoftentity.class.php');

class ld_commission {

    public $id;
    public $email;
    public $created_at;
    public $updated_at;
    public $status;
    public $custom_status;
    public $first_name;
    public $last_name;
    public $latest_visitor;//object
    //"id":1337,
    //"tracking_code":"d3132b4d-afbb-4adc-970c-547553659ea6"


    function __construct() {
        //unset($this->DateCreated);//remove this property because affiliate table does not have it
    }

}

?>