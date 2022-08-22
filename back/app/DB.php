<?php

namespace App;

use Exception;
use PDO;

class DB
{
    private static ?DB $instance = null;
    private ?PDO $dbConnection = null;

    public function __construct()
    {
        $host = $_ENV['DB_HOST'];
        $port = $_ENV['DB_PORT'];
        $db = $_ENV['DB_DATABASE'];
        $user = $_ENV['DB_USERNAME'];
        $pass = $_ENV['DB_PASSWORD'];

        try {
            $this->dbConnection = new PDO("mysql:host=$host;port=$port;dbname=$db", $user, $pass);
        } catch (Exception $e) {
            exit($e->getMessage());
        }
    }

    public static function getInstance(): DB
    {
        if (is_null(static::$instance)) {
            static::$instance = new DB();
        }

        return static::$instance;
    }

    public function getConnection(): PDO
    {
        return $this->dbConnection;
    }
}
