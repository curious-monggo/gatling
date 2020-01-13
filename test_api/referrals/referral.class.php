<?php
include('../infusionsoftentity.class.php');

class referral extends InfusionSoftEntity {

    public $AffiliateId;
    public $ContactId;
    public $DateExpires;
    public $DateSet;
    public $IPAddress;
    public $Info;
    public $Source;
    public $Type;

    function __construct() {
        unset($this->DateCreated);//remove this property because affiliate table does not have it
    }

}

?>