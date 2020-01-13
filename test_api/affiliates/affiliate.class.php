<?php
include('../infusionsoftentity.class.php');

class affiliate extends InfusionSoftEntity {

    public $AffCode;
    public $AffName;
    public $ContactId;
    public $DefCommissionType;
    public $Id;
    public $LeadAmt;
    public $LeadCookieFor;
    public $LeadPercent;
    public $NotifyLead;
    public $NotifySale;
    public $ParentId;
    public $Password;
    public $PayoutType;
    public $SaleAmt;
    public $SalePercent;
    public $Status;

    function __construct() {
        unset($this->DateCreated);//remove this property because affiliate table does not have it
    }

}

?>