<?php
include('../gatlingentity.class.php');
class quiz extends GatlingEntity {

    public $contact_id;
    public $email; 
    public $affiliate_name; 
    public $quiz_title; 
    public $quiz_result; 

    function __construct() {
        $this->className = "quiz";
        $this->tableName = "tj_quiz_results";
        $this->whereClause = "SELECT rid, 
        created_ts, 
        guid, 
        contact_id, 
        email, 
        quiz_title, 
        quiz_result";
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
    function getSelectClause ($conn, $gatlingEntity, $numberToReturn) {
        $tableName = "quizview";
        $whereClause ="SELECT rid, 
        created_ts, 
        guid, 
        contact_id, 
        email, 
        quiz_title, 
        quiz_result,
        title,
        description,
        image,
        result_title,
        result_description,
        result_image,
        max_marks,
        min_marks,
        score,
        total";
        $querySelected = FALSE;
        if ($gatlingEntity -> rid !== NULL) {
            $handle = $conn->prepare($whereClause.' FROM '.$tableName.' where rid = ? limit ?');
            $handle->bindValue(1, $gatlingEntity -> rid, PDO::PARAM_INT);
            $querySelected = TRUE;
        };
        if ($gatlingEntity -> contact_id != NULL) {
            $handle = $conn->prepare($whereClause.' FROM '.$tableName.' where contact_id = ? limit ?');
            $handle->bindValue(1, $gatlingEntity -> contact_id);
            $querySelected = TRUE;
        };
        if ($gatlingEntity -> email != NULL) {
            $handle = $conn->prepare($whereClause.' FROM '.$tableName.' where email = ? limit ?');
            $handle->bindValue(1, $gatlingEntity -> email);
            $querySelected = TRUE;
        };
        if ($gatlingEntity -> guid != NULL) {
            $handle = $conn->prepare($whereClause.' FROM '.$tableName.' where guid = ? limit ?');
            $handle->bindValue(1, $gatlingEntity -> guid);
            $querySelected = TRUE;
        };
        if ($querySelected == FALSE) {
            $handle = $conn->prepare($whereClause.' FROM '.$tableName.' where rid > 0');
        }else {
            $handle->bindValue(2, $numberToReturn, PDO::PARAM_INT);
        }
        return $handle;
    }

}

?>