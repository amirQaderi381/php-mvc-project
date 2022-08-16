<?php

namespace System\Database\DBConnection;


use PDO;
use PDOException;
use System\Config\Config;

class DBConnection
{

    private static $dbConnectionInstance = null;

    private function __construct()
    {
    }

    public static function getDBConnectionInstance()
    {
        if (self::$dbConnectionInstance == null) {

            $DBConnectionInstance = new DBConnection();
            self::$dbConnectionInstance = $DBConnectionInstance->dbconnection();
        }

        return self::$dbConnectionInstance;
    }


    private function dbconnection()
    {
        $options = array(
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::MYSQL_ATTR_INIT_COMMAND => "SET lc_time_names='de_DE',NAMES utf8",
        );

        try {

            return new PDO(
                "mysql:host=" . Config::get('database.DBHOST') . ";dbname=" . Config::get('database.DBNAME'),
                Config::get('database.DBUSERNAME'),
                Config::get('database.DBPASSWORD'),
                $options
            );
        } catch (PDOException $e) {
            echo "error in database connection : " . $e ."<br>";
            return false;
        }
    }

    public static function newInsertId()
    {
        return  self::getDBConnectionInstance()->lastInsertId();
    }
}
