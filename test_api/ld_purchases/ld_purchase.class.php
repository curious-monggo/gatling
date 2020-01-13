<?php
//might want to include a base entity in the future include('../infusionsoftentity.class.php');

class ld_purchase {

    public $id;
    public $email;
    public $purchase_code;
    public $purchase_amount;
    public $plan_code;
    public $commission_amount_override;
    public $created_at;

    function __construct() {
        //unset($this->DateCreated);//remove this property because affiliate table does not have it
    }

}

?>