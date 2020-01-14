<?php
include('../gatlingentity.class.php');
class tj_business_partner extends GatlingEntity {

    public $created_ts;
    public $created_by;
    public $changed_ts; 
    public $changed_by; 
    public $row_version; 
    public $code;
    public $company_name;
	public $referrers_fullname;
	public $leadsource_id;
	public $ref_email;
	public $ref_giftcard;
	public $ref_pin;
	public $country;

    function __construct() {
        $this->className = "TJBusinessPartner";
        $this->tableName = "tj_business_partners";
        $this->whereClause = "SELECT rid, 
        created_ts, 
        created_by,
        changed_ts, 
        changed_ts, 
        changed_by,
        row_version,
        code,
		company_name,
		referrers_fullname,
		leadsource_id,
		ref_email,
		ref_giftcard,
		ref_pin,
      country";

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

        if (isset($tjEntity -> company_name)) {
            $handle = $conn->prepare($this->whereClause.' FROM '.$this->tableName.' where company_name = ? limit ?');
            $handle->bindValue(1, $tjEntity -> company_name);
        };

        $handle->bindValue(2, $numberToReturn, PDO::PARAM_INT);

        return $handle;
    }

}

?>