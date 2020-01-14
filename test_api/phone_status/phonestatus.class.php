<?php
include('../tjentity.class.php');
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
        if ($tjEntity -> prospect_phone != undefined) {
            $handle = $conn->prepare($this->whereClause.' FROM '.$this->tableName.' where prospect_phone = ? limit ?');
            $handle->bindValue(1, $tjEntity -> prospect_phone);
        };

        $handle->bindValue(2, $numberToReturn, PDO::PARAM_INT);
        return $handle;
    }

}

?>