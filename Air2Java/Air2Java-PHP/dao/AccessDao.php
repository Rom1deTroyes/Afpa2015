<?php
/* 
 * Air2Java
 * (c)2014 Rom1
 */

namespace Air2Java\Dao ;

require_once 'ConnectDao.php';
/**
 * DAO for {@link Air2Java}.
 */
class AcessDao extends ConnectDao {

    /** @var \PDO */
    protected $db = null;

    public function __construct() {
        parent::getDb();
//        $this->db = $this->getDb();
    }


    public function __destruct() {
        // close db connection
        $this->db = null;
    }

    /**
     * @return \PDO
     */
    protected function getDb() {
        if ($this->db == null) {
            $this->db = ConnectDao::getDb();
        }
        return $this->db;
    }

    private function executeStatement(\PDOStatement $statement, array $params) {
        if (!$statement->execute($params)) {
            self::throwDbError($this->getDb()->errorInfo());
        }
    }

    /**
     * @return \PDOStatement
     * @TODO if... self:: ou $this-> ?
     */
    protected function query($sql) {
        $statement = $this->getDb()->query($sql, \PDO::FETCH_ASSOC);
        if ($statement === false) {
            self::throwDbError($this->getDb()->errorInfo());
        }
        return $statement;
    }

    private static function throwDbError(array $errorInfo) {
        // TODO log error, send email, etc.
        throw new \Exception('DB error [' . $errorInfo[0] . ', ' . $errorInfo[1] . ']: ' . $errorInfo[2]);
    }

    private static function formatDateTime(\DateTimeme $date) {
        return $date->format(DateTime::ISO8601);
    }
}