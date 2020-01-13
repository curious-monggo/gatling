<?php
include('BaseController.php');
class ContactsController extends BaseController
{
    public function getAction($request, $model) {

        $retrieveResult = $model->retrieve($request);
        $data = $retrieveResult;
        return $data;
    }

    public function postAction($request) {
        $data = $request->parameters;
        //echo "POST DATA:".print_r($data);
        $data['message'] = "This data was submitted";
        return $data;
    }
}

?>