<?php
include('../infusionsoftentity.class.php');

class invoicepayment extends InfusionSoftEntity {

    public $Amt;
    public $Id;
    public $InvoiceId;
    public $LastUpdated;
    public $PayDate;
    public $PayStatus;
    public $PaymentId;
    public $SkipCommission;

    function __construct() {
        unset($this->DateCreated);//remove this property because payment table does not have it
    }

}

?>