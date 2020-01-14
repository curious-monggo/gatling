<?php
require 'request.class.php';
spl_autoload_register('apiAutoload');

try
{
    $request = new Request();
    // route the request to the right place
    //echo "request:".print_r($request);
    $controller_name = ucfirst($request-> url_elements[1]) . 'Controller';
    if (class_exists($controller_name)) {

        $model_name = rtrim(ucfirst($request-> url_elements[1]), "s") . 'Model';
        if(class_exists($model_name)) {
            $mName = $model_name;
            $model = new $mName();
            $controller = new $controller_name();
            $action_name = strtolower($request-> verb) . 'Action';
            if (method_exists($controller, $action_name)) {
                $result = $controller->$action_name($request, $model);
                //$view_name = ucfirst($request->format) . 'View';
                $view_name = $request->format. 'View';
                if(class_exists($view_name)) {
                    $vName = ucfirst($view_name);
                    $view = new $vName();
                    $view->render($request, $result);
                }
                else{
                    echo print_r($result);
                }
            }
            else {
                header("HTTP/1.1 405 Method Not Allowed");
            }
        }
        else{
            header("HTTP/1.1 404 Not Found");
        }

     }else{
        header("HTTP/1.1 404 Not Found");
     }
}
catch(Exception $ex) 
{
    echo "error: " . $exception->getMessage();
}

function apiAutoload($classname)
{
    if (preg_match('/[a-zA-Z]+Controller$/', $classname)) {
        include __DIR__ . '/controllers/' . $classname . '.php';
        return true;
    } elseif (preg_match('/[a-zA-Z]+Model$/', $classname)) {
        include __DIR__ . '/models/' . $classname . '.php';
        return true;
    } elseif (preg_match('/[a-zA-Z]+View$/', $classname)) {
        include __DIR__ . '/views/' . $classname . '.php';
        return true;
    }
}

?>