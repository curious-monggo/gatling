<?php
include('../gatlingentity.class.php');
class is_activation_code extends GatlingEntity {

    public $changed_ts;
    public $activation_code;
    public $initial_Value;
    public $email_address;
    public $first_name;
    public $last_name;
    public $start_date;
    public $end_date;
    public $rows; 
    public $assignCode = 0;
    public $contactId;

    function __construct() {
        $this->className = "is_activation_code";
        $this->tableName = "tj_activation_codes";
        $this->whereClause = "SELECT rid, 
        guid,
        created_ts, 
        changed_ts,
        activation_code,
        initial_value,
        email_address,
        first_name,
        last_name,
        start_date,
        end_date";

    }
    function getInsertClause ($payload) {
        $sql = "INSERT INTO " .$this->tableName." (";
        $values = array();
        $columns = array();
        foreach ($payload as $key=>$val)
        {
            $values[] = $val;
            $columns[] = $key;
        }
        $sql = $sql . join(', ', $columns) . ') VALUES(:'. join(', :',$columns) . ')';
        return $sql;
    }
    function getUpdateClause ($payload) {
        $sql = "UPDATE " .$this->tableName;
        $removeComma = False;
        $iterations = 0;
        foreach ($payload as $key=>$val)
        {
            if ($key == "rid")
                continue;
            $iterations++;
            if ($iterations == 1)
                $sql = $sql." SET ".$key."='".$val."',";
            else
                $sql = $sql." ".$key."='".$val."',";

        }
        if ($iterations > 0)
            $sql = substr($sql, 0, -1);//remove last ,
        if (!isset($this-> rid))
            throw new Exception("missing rid");

        $sql = $sql ." where rid = ".$this-> rid;
//echo "sql:".$sql;
        return $sql;
    }
    function getSelectClause($conn, $tjEntity, $numberToReturn) {
        //$tjEntity is here only because php won't allow multiple function signatures
        //refactor this function in all GatlingEntity derived classes to remove parm $tjEntity
        if (isset($this-> rows)) {
            $numberToReturn = $this-> rows;
        }
        if (isset($this-> rid) && !empty($this-> rid)) {
            $handle = $conn->prepare($this->whereClause.' FROM '.$this->tableName.' where rid = ? limit ?');
            $handle->bindValue(1, $this-> rid, PDO::PARAM_INT);
        };
        if (isset($this-> email_address) && !empty($this-> email_address)) {
            $handle = $conn->prepare($this->whereClause.' FROM '.$this->tableName.' where email_address = ? limit ?');
            $handle->bindValue(1, $$this-> email_address);
        };
        if (isset($this-> guid) && !empty($this-> guid)) {
            $handle = $conn->prepare($this->whereClause.' FROM '.$this->tableName.' where guid = ? limit ?');
            $handle->bindValue(1, $this-> guid);
        };
        if (isset($this-> activation_code) && !empty($this-> activation_code)) {
            $handle = $conn->prepare($this->whereClause.' FROM '.$this->tableName.' where activation_code = ? limit ?');
            $handle->bindValue(1, $this-> activation_code);
        };

        if (!isset($handle) && isset($this-> rows)) {

            // if ($this-> assignCode == "1") {
            //     $handle = $conn->prepare($this->whereClause.' FROM '.$this->tableName.' where changed_ts IS null limit ?');
            //     $handle->bindValue(1, intval($this-> rows), PDO::PARAM_INT);

            // } else {
                $handle = $conn->prepare($this->whereClause.' FROM '.$this->tableName.' where changed_ts IS null limit ?');
                $handle->bindValue(1, intval($this-> rows), PDO::PARAM_INT);
            //}
                return $handle;
        }

        $handle->bindValue(2, $numberToReturn, PDO::PARAM_INT);
        return $handle;
    }
    function setMe() {

        //property_exists() 
        $id = null;

        try 
        {
            if (isset($_GET["id"]) && !empty($_GET["id"])) {
                $id = $_GET["id"];
            } else if(isset($_GET["contactId"]) && !empty($_GET["contactId"])) {
                $this-> contactId = $_GET["contactId"];
            } else {
                if (isset($_GET["rows"]) && !empty($_GET["rows"])) {
                    $this-> rows = $_GET["rows"];
                    if (isset($_GET["assignCode"]) && !empty($_GET["assignCode"])) {
                        $this-> assignCode = $_GET["assignCode"];
                    }
                } else {
                    throw new Exception("How about some data dude. ".$this-> className);
                }
            };
            if (is_numeric($id) && $id > 0 && $id == round($id, 0)){
                //validate as number
                $this-> rid = $id;
            } else {
                if (preg_match("/^(\{)?[a-f\d]{8}(-[a-f\d]{4}){4}[a-f\d]{8}(?(1)\})$/i", $id)) {
                    $this-> guid = $id;
                } else {
                    //is it a phonenumber expecting + countrycode etc like +1234567890
                    if (validPhoneNumber($id) && property_exists($this, $this-> phone_number)) {
                        $this-> phone_number = str_replace("$2B", "+", $id);
                        $id = undefined;
                    } else {
                        if (strpos($id, 'TSD') !== false) {
                            $this-> activation_code = $id;
                        } else {
                            //validate as email
                            if (property_exists($this, $this-> email_address)) {
                                $this-> email_address = $id;
                                $id = undefined;
                            }
                        }
                    }
                }
            }

        }
        catch(Exception $exception) {
            throw $exception;
        }
    }
    function Create($payload) {
        try {
    
            $conn = new \PDO(   "mysql:host=$this->servername;dbname=$this->dbname;port=3306;", $this->username, $this->password,
                        array(
                            \PDO::ATTR_ERRMODE => \PDO::ERRMODE_EXCEPTION,
                            \PDO::ATTR_PERSISTENT => false
                        )
                    );
            
            $payload = (array) $payload;//convert payload to array for processing

            $sql = $this->getInsertClause($payload);
            $prep = $conn->prepare($sql);
            foreach($payload as $key=>$val){
                $prep->bindValue($key, $val);
            }
            $prep->execute();
            
            return $prep;
    
    
        }
        catch(PDOException $e) {
            throw $e;
        }
        finally {
            $conn = null;
        }
    }
    
    function Update($payload) {
        try {
    
            $conn = new \PDO(   "mysql:host=$this->servername;dbname=$this->dbname;port=3306;", $this->username, $this->password,
                        array(
                            \PDO::ATTR_ERRMODE => \PDO::ERRMODE_EXCEPTION,
                            \PDO::ATTR_PERSISTENT => false
                        )
                    );
            
            $payload = (array) $payload;//convert payload to array for processing
            if (!isset($payload->changed_ts)) {
                $currentDateTime = new DateTime('America/New_York');
                $payload["changed_ts"] = $currentDateTime-> format('Y-m-d h:i:s');
            }

            $sql = $this->getUpdateClause($payload);
            $prep = $conn->prepare($sql);
            foreach($payload as $key=>$val){
                $prep->bindValue($key, $val);
            }
            $prep->execute();
            
            return $prep;
    
    
        }
        catch(PDOException $e) {
            throw $e;
        }
        finally {
            $conn = null;
        }
    }

    function testResponse() {
        return $rows;
    }
}

?>