<?php

namespace System\Router;

class TestRoute
{
    private $current_route;
    private $method_field;
    private $values = [];
    private $routes;


    public function __construct()
    {
        $this->current_route = explode("/", CURRENT_ROUTE);
        $this->method_field = $this->methodField();
        global $routes;
        $this->routes = $routes;
    }

    public function run()
    {
        $match = $this->match();
        if (empty($match)) {
            $this->error404();
        }

        $classPath = str_replace("\\", "/", $match['class']);
        $path = BASE_DIR . "app/Http/Controllers/" . $classPath . ".php";

        if (!file_exists($path)) {
            $this->error404();
        }

        $class = "\App\Http\Controllers\\" . $match['class'];
        $object = new $class();

        if (method_exists($object, $match['method'])) {
        }
    }


    public function match()
    {
        $reservedRoutes = $this->routes[$this->method_field];

        foreach ($reservedRoutes as $reservedRoute) {

            if ($this->compare($reservedRoute['url']) == true) {
                return ["class" => $reservedRoute['class'], "method" => $reservedRoute['method']];
            } else $this->values = [];
        }
        return [];
    }

    private function compare($reservedRouteUrl)
    {
        if (trim($reservedRouteUrl, "/") == "") {
            return trim($this->current_route[0], "/") == "" ? true : false;
        }


        $reservedRouteUrlArray = explode("/", $reservedRouteUrl);
        if (sizeof($reservedRouteUrlArray) !== sizeof($this->current_route)) {
            return false;
        }

        foreach ($this->current_route as $key => $currentRouteElement) {
            $reservedRouteUrl = $reservedRouteUrlArray[$key];

            if (substr($reservedRouteUrl, 0, 1) == "{" && substr($reservedRouteUrl, -1) == "}") {
                array_push($this->values, $currentRouteElement);
            } elseif ($reservedRouteUrl != $currentRouteElement) {
                return false;
            }
        }
        return true;
    }

    public function error404()
    {
        http_response_code(404);
        include __DIR__ . DIRECTORY_SEPARATOR . "View" . DIRECTORY_SEPARATOR . "404.php";
    }

    public function methodField()
    {
        $method_field = strtolower($_SERVER['REQUEST_METHOD']);

        if ($method_field = "post") {
            if (isset($_POST['_method'])) {
                if ($_POST['_method'] == 'put') {
                    $method_field = "put";
                } elseif ($_POST['_method'] == 'delete') {
                    $method_field = "delete";
                }
            }
        }
        return $method_field;
    }
}