<?php
include '../infusionsoftentity.class.php';

class contactgroup extends InfusionSoftEntity {

    public $GroupDescription;
    public $GroupName;

    function __construct() {
        unset($this->DateCreated);
    }

}

?>