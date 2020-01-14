<?php
include('../gatlingentity.class.php');
class phonesentsms extends GatlingEntity {

    public $affiliate_activity_country; 
    public $affiliate_activity_language; 
    public $affiliate_email;
    public $affiliate_giftcard;
    public $affiliate_giftcardpin; 
    public $affiliate_gps; 
    public $affiliate_latitude;
    public $affiliate_longitude; 
    public $affiliate_phone; 
    public $affiliate_pin; 
    public $affiliate_contact_cnt; 
    public $affiliate_contact_device;
    public $affiliate_contact_email_cnt;
    public $affiliate_contact_sms_cnt;
    public $affiliate_contact_version;
    public $affiliate_msg;
    public $prospect_email;
    public $prospect_giftcard;
    public $prospect_name;
    public $prospect_phone;
    public $prospect_pin;

    function __construct() {
        $this->className = "phonesentsms";
        $this->tableName = "tj_phone_sent_sms";
        $this->whereClause = "SELECT 
        rid,
        create_ts, 
        affiliate_activity_country, 
        affiliate_activity_language, 
        affiliate_email,
        affiliate_giftcard,
        affiliate_giftcardpin, 
        affiliate_gps, 
        affiliate_latitude,
        affiliate_longitude, 
        affiliate_name,
        affiliate_phone, 
        affiliate_pin, 
        affiliate_contact_cnt,
        affiliate_contact_device,
        affiliate_contact_email_cnt,
        affiliate_contact_sms_cnt,
        affiliate_contact_version,
        affiliate_msg,
        prospect_email,
        prospect_giftcard,
        prospect_name,
        prospect_phone,
        prospect_pin, guid";
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
    function getSelectClause ($conn, $gatlingEntity, $numberToReturn) {

        if ($gatlingEntity -> rid !== null) {
            $handle = $conn->prepare($this->whereClause.' FROM '.$this->tableName.' where rid = ? limit ?');
            $handle->bindValue(1, $gatlingEntity -> rid, PDO::PARAM_INT);
        };
        if ($gatlingEntity -> affiliate_email != null) {
            $handle = $conn->prepare($this->whereClause.' FROM '.$this->tableName.' where affiliate_email = ? limit ?');
            $handle->bindValue(1, $gatlingEntity -> affiliate_email);
        };
        if ($gatlingEntity -> guid != null) {
            $handle = $conn->prepare($this->whereClause.' FROM '.$this->tableName.' where guid = ? limit ?');
            $handle->bindValue(1, $gatlingEntity -> guid);
        };
        $handle->bindValue(2, $numberToReturn, PDO::PARAM_INT);
        return $handle;
    }

}

?>