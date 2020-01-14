<?php
include('../gatlingentity.class.php');
class phonestatus extends GatlingEntity {

    public $prospect_email;
    public $prospect_phone;
    public $prospect_type;
    public $affiliate_email; 
    public $status; 

    function __construct() {
        $this->className = "phonestatus";
        $this->tableName = "tj_phone_status";
        $this->whereClause = "SELECT rid, 
        create_ts, 
        prospect_email,
        prospect_phone,
        prospect_type,
        affiliate_email,
        status, 
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
    function getSelectClause ($conn, $gatlingEntity, $numberToReturn) {
        
        if ($gatlingEntity -> rid !== undefined) {
            $handle = $conn->prepare($this->whereClause.' FROM '.$this->tableName.' where rid = ? limit ?');
            $handle->bindValue(1, $gatlingEntity -> rid, PDO::PARAM_INT);
        };
        if ($gatlingEntity -> affiliate_email != undefined) {
            $handle = $conn->prepare($this->whereClause.' FROM '.$this->tableName.' where affiliate_email = ? limit ?');
            $handle->bindValue(1, $gatlingEntity -> affiliate_email);
        };
        if ($gatlingEntity -> guid != undefined) {
            $handle = $conn->prepare($this->whereClause.' FROM '.$this->tableName.' where guid = ? limit ?');
            $handle->bindValue(1, $gatlingEntity -> guid);
        };
        if ($gatlingEntity -> prospect_phone != undefined) {
            $handle = $conn->prepare($this->whereClause.' FROM '.$this->tableName.' where prospect_phone = ? limit ?');
            $handle->bindValue(1, $gatlingEntity -> prospect_phone);
        };

        $handle->bindValue(2, $numberToReturn, PDO::PARAM_INT);
        return $handle;
    }

}

?>