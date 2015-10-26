<?php

/*
 * Air2Java
 * (c)2014 Rom1
 */

namespace Air2Java\Dao ;

/**
 * Connect to the Database using the [db] section of config/config.ini
 * and offer a PDO acces by the getDb() function.
 * @author Rom1
 */
class ConnectDao {
    /** @var \PDO */
    private $db = null;

    /**
     * Private Constructor for Singleton Pattern
     */
    private function __construct() { // Pattern Singleton
    }

    /**
     *  Close db connection and liberate the ressource.
     */
    public function __destruct() {
        $this->db = null;
//        self::$db = null;
    }

    /**
     * (PHP 5 &gt;= 5.1.0, PECL pdo &gt;= 0.1.0)
     * @link \PDO::__construct()
     * @return \PDO instance representing a connection to a database
     * @throws Exception if new PDO() fails.
     * @author Rom1 <air2Java@localhost>
     */
//    protected function getDb() {
//        if (self::db !== null) {
//            return self::db;
//        }
//
//        require_once './config/Config.php';
//
//        $config = \Air2Java\Config::getConfig("db");
//        try {
//            $this->db = new \PDO($config['dsn'], $config['username'], $config['password']);
//        } catch (Exception $ex) {
//            throw new \Exception('DB connection error: ' . $ex->getMessage());
//        }
//        return self::db;
//    }
    protected function getDb() {
        if ($this->db !== null) {
            return $this->db;
        }

        require_once './config/Config.php';

        $config = \Air2Java\Config::getConfig("db");
        try {
            $this->db = new \PDO($config['dsn'], $config['username'], $config['password']);
        } catch (Exception $ex) {
            throw new Exception('DB connection error: ' . $ex->getMessage());
        }
        return $this->db;
    }
}
