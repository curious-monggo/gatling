<?php
abstract class GatlingEntity {


    public $className;
    public $tableName;
    public $servername = "localhost";
    public $username = "root";
    public $password = "";
    public $dbname = "gatling";
    public $whereClause;
    public $rid;
    public $create_ts;
    public $guid;

    function __construct() {
        $this->className = "GatlingEntity";
    }
    function getSelectClause ($conn, $gatlingEntity, $numberToReturn) {
        throw new Exception('getSelectClause method not implemented.');
    }
    function getInsertClause ($payload) {
        throw new Exception('getInsertClause method not implemented.');
    }
    function setMe() {

        //property_exists() 
        $id = undefined;

        try {

            if (isset($_GET["id"]) && !empty($_GET["id"])) {
                $id = $_GET["id"];
            } else {
                throw new Exception("How about some data dude.");
            };

        }
        catch(Exception $exception) {
            throw $exception;
        }

    }
    function doPost($payload, $gatlingEntity) {
        throw new Exception("function not implemented");
    }
    function Fetch($gatlingEntity) {
        throw new Exception("function not implemented");
    }
    function Retrieve() {

        $result = array(array("error" => " no results"));
        try {
            $conn = new \PDO(   "mysql:host=$this->servername;dbname=$this->dbname;port=3306;", $this->username, $this->password,
                        array(
                            \PDO::ATTR_ERRMODE => \PDO::ERRMODE_EXCEPTION,
                            \PDO::ATTR_PERSISTENT => false
                        )
                    );
    
            $handle = $this->getSelectClause($conn, null, 100);
            //echo print_r($handle);
            $handle->execute();
    
            $result = $handle->fetchAll(\PDO::FETCH_OBJ);
            
        }
        catch(PDOException $exception) {
           throw $exception;
        }
        finally {
            $conn = null;
        }
        return $result;
    }
}

?>