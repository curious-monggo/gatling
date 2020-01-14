<?php
include('../infusionsoftentity.class.php');

class ccharge extends InfusionSoftEntity {

    public $Amt;
    public $ApprCode;
    public $CCId;
    public $MerchantId;
    public $OrderNum;
    public $PaymentGatewayId;
    public $PaymentId;
    public $RefNum;

    function __construct() {
        unset($this->DateCreated);//remove this property because payment table does not have it
    }

}

?>