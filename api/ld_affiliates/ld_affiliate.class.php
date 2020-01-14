<?php
//might want to include a base entity in the future include('../infusionsoftentity.class.php');

class ld_affiliate {

    public $id;
    public $email;
    public $first_name;
    public $last_name;
    public $created_at;
    public $updated_at;
    public $status;
    public $paypal_email; 
    public $unsubscribed;
    public $archived;
    public $pending_approval; 
    public $affiliate_url;
    public $affiliate_dashboard_url;
    public $compensation_tier_code;
    public $custom_fields = Array();

    function __construct() {
        //unset($this->DateCreated);//remove this property because affiliate table does not have it
    }

}

?>