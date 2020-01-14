<?php
include 'apiView.php';
class JsonView extends ApiView {

    public function render($request, $data) {

        if (isset($data[0]["error"]))
            $this-> setHeader("400", "Bad Request");
        else
        {
            if ($request-> verb == "POST")
                $this-> setHeader("201", "ACCEPTED");
            else
                $this-> setHeader("200", "OK");
        //}
            //echo json_encode($data);
       // header('Content-Type: application/json; charset=utf8');
            if (is_array($data)){
                if (empty($data)) {
                    echo json_encode(array(array("nodata" => " failed to return data")));
                }
                else {
                    echo json_encode($data);
                }
            }
            else {
                echo json_encode(array(array("data" => $data)));
            }
        }
        return true;
    }
    
}

?>