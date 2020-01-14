<?php
include 'apiView.php';
class JsonView extends ApiView {

    public function render($content) {
        //parent:: outputHeader("201", "OK");
        //$this-> outputHeader("201", "OK");
        $this->somefunction();
       // header('Content-Type: application/json; charset=utf8');
        echo json_encode($content);
        return true;
    }
    public function somefunction() {
        echo "some function";
    }
    function ouputHeader($response_code, $response_string) {
        //http_response_code(404);
        // 200 'OK'
        // 201 'Created' and should provide link to GET record
        // 202 'Accepted'
        // 204 'Content'
        // 400 'Bad Request'
        // 401 'Unauthorized'
        // 402 'Payment Required'
        // 403 'Forbidden'
        // 404 'Not Found'
        // 405 'Method Not Allowed'
        // 406 'Not Acceptable'
        // 413 'Request Entity Too Large'
        // 414 'Request-URI Too Large'
        // 415 'Unsupported Media Type'
        // 500 'Internal Server Error'
        // 501 'Not Implemented'
        // 502 'Bad Gateway'
        // 503 'Service Unavailable'
        // 504 'Gateway Time-out'
        // 505 'HTTP Version not supported'
        header("HTTP/1.1 ".$response_code. " ".$response_string);
        header("Content-Type: application/json");
        header("Expires: 0");
        header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
        header("Cache-Control: no-store, no-cache, must-revalidate");
        header("Cache-Control: post-check=0, pre-check=0", false);
        header("Pragma: no-cache");
    }
}

?>