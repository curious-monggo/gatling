<?php
include('../gatlingentity.class.php');
class tj_visit extends GatlingEntity {

    public $rid;
    public $created_ts; 
    public $guid; 
    public $source; 
    public $http_referer; 
    public $http_user_agent;
    public $remote_ip_address;
    public $host_name;
    public $afmc; 

    function __construct() {
        $this->className = "tj_visit";
        $this->tableName = "tj_visits";
        $this->whereClause = "SELECT rid, 
        created_ts, 
        guid, 
        source, 
        http_referer, 
        http_user_agent, 
        remote_ip_address,
        host_name,
        afmc";
        unset($this->create_ts);
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

        if ($tjEntity -> rid !== NULL) {
            $handle = $conn->prepare($this->whereClause.' FROM '.$this->tableName.' where rid = ? limit ?');
            $handle->bindValue(1, $tjEntity -> rid, PDO::PARAM_INT);
        };
        if ($tjEntity -> contact_id != NULL) {
            $handle = $conn->prepare($this->whereClause.' FROM '.$this->tableName.' where afmc = ? limit ?');
            $handle->bindValue(1, $tjEntity -> afmc);
        };
        if ($tjEntity -> guid != NULL) {
            $handle = $conn->prepare($this->whereClause.' FROM '.$this->tableName.' where guid = ? limit ?');
            $handle->bindValue(1, $tjEntity -> guid);
        };
        $handle->bindValue(2, $numberToReturn, PDO::PARAM_INT);
        return $handle;
    }

}

?>