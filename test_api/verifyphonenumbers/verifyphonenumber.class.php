<?php
include('../tjentity.class.php');
class verifyphonenumber extends GatlingEntity {

    public $created_ts;
    public $valid;
    public $number; 
    public $local_format; 
    public $international_format; 
    public $country_prefix; 
    public $country_code;
    public $country_name;
    public $location;
    public $carrier;
    public $line_type;

    function __construct() {
        $this->className = "verifyphonenumber";
        $this->tableName = "num_verified";
        $this->whereClause = "SELECT rid, 
        created_ts, 
        IF(valid = 1, 'True', 'False') AS valid,
        number, 
        local_format, 
        international_format, 
        country_prefix,
        country_code,
        country_name,
        location,
        carrier,
        line_type";

        unset($this->create_ts);
        unset($this->guid);
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

        if (isset($tjEntity -> international_format)) {
            $handle = $conn->prepare($this->whereClause.' FROM '.$this->tableName.' where international_format = ? limit ?');
            $handle->bindValue(1, $tjEntity -> international_format);
        };

        $handle->bindValue(2, $numberToReturn, PDO::PARAM_INT);

        return $handle;
    }

}

?>