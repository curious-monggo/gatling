<?php
include('../tjentity.class.php');
class phonerequests extends TJEntity {

    public $request_format;
    public $affiliate_longitude; 
    public $affiliate_name; 
    public $affiliate_activity_language; 
    public $affiliate_activity_country; 
    public $affiliate_giftcard; 
    public $affiliate_latitude; 
    public $affiliate_email; 
    public $affiliate_pin; 
    public $affiliate_giftcardpin; 
    public $affiliate_contact_device; 
    public $affiliate_contact_version;
    public $affiliate_phone;

    function __construct() {
        $this->className = "phonerequests";
        $this->tableName = "tj_phone_requests";
        $this->whereClause = "SELECT rid, 
        create_ts, 
        request_format, 
        affiliate_longitude, 
        affiliate_name, 
        affiliate_activity_language, 
        affiliate_activity_country, 
        affiliate_giftcard, 
        affiliate_latitude, 
        affiliate_email, 
        affiliate_pin, 
        affiliate_giftcardpin, 
        affiliate_contact_device, 
        affiliate_contact_version, 
        affiliate_phone, 
        guid";
    }
    function getInsertClause ($payload) {
        $sql = "INSERT INTO " .$this->tableName." (";
        $binds = array();
        $columns = array();
        foreach ($payload as $key=>$val)
        {
            $binds[] = $val;
            $columns[] = $key;
        }
        $sql = $sql . join(', ', $columns) . ') VALUES(:'. join(', :', $columns) . ')';
        return $sql;
    }
    function getSelectClause ($conn, $tjEntity, $numberToReturn) {
        
        if ($tjEntity -> rid !== undefined) {
            $handle = $conn->prepare($this->whereClause.' FROM '.$this->tableName.' where rid = ? limit ?');
            $handle->bindValue(1, $tjEntity -> rid, PDO::PARAM_INT);
        };
        if ($tjEntity -> affiliate_email != undefined) {
            $handle = $conn->prepare($this->whereClause.' FROM '.$this->tableName.' where affiliate_email = ? limit ?');
            $handle->bindValue(1, $tjEntity -> affiliate_email);
        };
        if ($tjEntity -> guid != undefined) {
            $handle = $conn->prepare($this->whereClause.' FROM '.$this->tableName.' where guid = ? limit ?');
            $handle->bindValue(1, $tjEntity -> guid);
        };
        $handle->bindValue(2, $numberToReturn, PDO::PARAM_INT);
        return $handle;
    }

}

?>