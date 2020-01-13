<?php
abstract class TJEntity {


    public $className;
    public $tableName;
    public $servername = "tj-db-instance.cujlwyt0hcdy.us-east-1.rds.amazonaws.com";
    public $username = "root";
    public $password = "TJp!234567";
    public $dbname = "traveljolly";
    public $whereClause;
    public $rid;
    public $create_ts;
    public $guid;

    function __construct() {
        $this->className = "TJEntity";
    }
    function getSelectClause ($conn, $tjEntity, $numberToReturn) {
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


    //url formate like http://traveljolly.com/api/phone_status/rjr@traveljolly.com&val=test&name=aname&third=3
        //Entered val GET: test x</br>Entered val POST:  x</br>querystring: id=rjr@traveljolly.com&val=test&name=aname&third=3 x</br>Array
                // (
                //     [id] => rjr@traveljolly.com
                //     [val] => test
                //     [name] => aname
                //     [third] => 3
                // )
                //params: 1 x</br>
            // $queryParams = undefined;
            // parse_str($_SERVER['QUERY_STRING'], $queryParams);
            // echo "Entered val GET: ".$_GET['val']." x</br>";
            // echo "Entered val POST: ".$_POST['val']." x</br>";
            // echo "querystring: ".$_SERVER['QUERY_STRING']." x</br>";
            // echo "params: ".print_r($queryParams)." x</br>";
            
        }
        catch(Exception $exception) {
            throw $exception;
        }

    }
    function doPost($payload, $tjEntity) {
        throw new Exception("function not implemented");
    }
    function Fetch($tjEntity) {
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