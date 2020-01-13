<?php
abstract class InfusionSoftEntity 
{
    public $Id;
    public $DateCreated;


    function getSelectFieldsArray ($excludeCustomFields = FALSE) {
        $fields = array();
        $length = count(get_object_vars($this));
        $counter = 1;
        foreach (get_object_vars($this) as $key=>$val)
        {
            if ($excludeCustomFields && mb_substr($key, 0, 1, 'utf-8') == "_")
                continue;
            $fields[] = $key;

            $counter++;
        }
        return $fields;
    }
}

?>