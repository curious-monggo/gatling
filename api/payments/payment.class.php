<?php
include('../infusionsoftentity.class.php');

class payment extends InfusionSoftEntity {

    public $ChargeId;
    public $Commission;
    public $ContactId;
    public $Id;
    public $InvoiceId;
    public $LastUpdated;
    public $PayAmt;
    public $PayDate;
    public $PayNote;
    public $PayType;
    public $RefundId;
    public $Synced;
    public $UserId;

    function __construct() {
        unset($this->DateCreated);//remove this property because payment table does not have it
    }

}

?>