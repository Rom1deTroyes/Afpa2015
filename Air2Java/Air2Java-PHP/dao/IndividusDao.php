<?php

/*
 * Air2Java
 * (c)2014 Rom1
 */

namespace Air2Java\Auth;

require_once 'AccessDao.php';

/**
 * DAO for {@link \Air2Java\model\Individu}.
 *
 * @author Rom1
 */
final class IndividusDao extends \Air2Java\Dao\AcessDao {

    public function __construct() {
        parent::__construct();
    }

    /**
     * Find {@link User} by user/password.
     * Renvoie un utilisateur de la base à partir de son nom et pwd
     * @param string user
     * @param string password
     * @return \Air2Java\Model\Individu or <i>null</i> if not found
     * @todo Utiliser un preparde statement !
      $sql = '
      SELECT id_individu as id, nom as username, prenom as userpass, date_naissance as ceatedOn
      FROM individus
      WHERE nom = :username
      AND prenom = :userpass ' ;
      $statement = $this->getDb()->prepare($sql);
      $this->executeStatement($statement, array(
      ':username' => $username,
      ':userpass' => $userpass,
      ));

     * @TODO : une vraie identification par la table Utilisateurs !
     */
    public function getUser($username, $userpass) {
        $username = filter_var($username, FILTER_SANITIZE_STRING);
        $userpass = filter_var($userpass, FILTER_SANITIZE_STRING);
        $row = $this->query("select id_individu as id, nom as username, prenom as userpass, date_naissance as ceatedOn from INDIVIDUS where NOM = '" . (string) $username . "' and PRENOM = '" . (string) $userpass . "' order by id ")->fetch();
        if (!$row) {
            return null;
        }
        $user = new \Air2Java\Model\Individu();
        require_once './mapping/UserMapper.php';
        UserMapper::map($user, $row);
        return $user;
    }

    /**
     * Find {@link Individu} by identifier.
     * @param int $id The ID to search
     * @return \Air2Java\Model\Individu or <i>null</i> if not found
     */
    public function findById($id) {
        $row = $this->query('SELECT id_individu, nom, prenom FROM individu WHERE id = ' . (int) $id)->fetch();
        if (!$row) {
            return null;
        }
        $individu = new Air2Java\Model\Individu();
        \IndividuMapper::map($individu, $row);
        return $individu;
    }

    /**
     * Save {@link Individu}.
     * @param \Air2Java\Model\Individu $individu {@link Individu} to be saved
     * @return \Air2Java\Model\Individu saved {@link Individu} instance
     */
    public function save(\Air2Java\Model\Individu $individu) {
        if ($individu->getId() === null) {
            return $this->insert($individu);
        }
        return $this->update($individu);
    }

    /**
     * Delete {@link Individu} by identifier.
     * @param int $id {@link Individu} identifier
     * @return bool <i>true</i> on success, <i>false</i> otherwise
     */
    public function delete($id) {
        $sql = '
            UPDATE individu SET
                nom = :nom,
                prenom = :prenom
            WHERE
                id = :id';
        $statement = $this->getDb()->prepare($sql);
        $this->executeStatement($statement, array(
            ':nom' => "",
            ':prenom' => "",
            ':id' => $id,
        ));
        return $statement->rowCount() == 1;
    }

    /**
     * @TODO
     */
    private function getFindSql(TodoSearchCriteria $search = null) {
        $sql = 'SELECT * FROM todo WHERE deleted = 0 ';
        $orderBy = ' priority, due_on';
        if ($search !== null) {
            if ($search->getStatus() !== null) {
                $sql .= 'AND status = ' . $this->getDb()->quote($search->getStatus());
                switch ($search->getStatus()) {
                    case Todo::STATUS_PENDING:
                        $orderBy = 'due_on, priority';
                        break;
                    case Todo::STATUS_DONE:
                    case Todo::STATUS_VOIDED:
                        $orderBy = 'due_on DESC, priority';
                        break;
                    default:
                        throw new Exception('No order for status: ' . $search->getStatus());
                }
            }
        }
        $sql .= ' ORDER BY ' . $orderBy;
        return $sql;
    }

    /**
     * @param \Air2Java\Model\Individu $individu to instert
     * @return \Air2Java\Model\Individu inserted
     * @throws Exception
     */
    private function insert(Air2Java\model\Individu $individu) {
        $now = new DateTime();
        $individu->setId(null);
        $individu->setCreatedOn($now);

        $sql = '
            INSERT INTO individus (id, nom, prenom, date_naissance)
                VALUES (:id, :nom, :prenom, :date_naissance)';
        return $this->execute($sql, $individu);
    }

    /**
     *
     * @param \Air2Java\Model\Individu $individu to update.
     * @return \Air2Java\Model\Individu updated.
     * @throws Exception
     */
    private function update(Air2Java\model\Individu $individu) {
        $individu->setLastModifiedOn(new DateTime());
        $sql = '
            UPDATE individu SET
                nom = :nom,
                prenom = :prenom,
                date_naissance = :date_naissance,
            WHERE
                id = :id';
        return $this->execute($sql, $individu);
    }

    /**
     *
     * @param string $sql the sql request to execute
     * @param \Air2Java\Model\Individu $user User source
     * @return \Air2Java\Model\Individu
     * @throws Exception
     */
    private function execute($sql, \Air2Java\Model\Individu $user) {
        $statement = $this->getDb()->prepare($sql);
        $this->executeStatement($statement, $this->getParams($user));
        if (!$user->getId()) {
            return $this->findById($this->getDb()->lastInsertId());
        }
        if (!$statement->rowCount()) {
            throw new NotFoundException('User with ID "' . $user->getId() . '" does not exist.');
        }
        return $user;
    }

    private function getParams(\Air2Java\model\Individu $user) {
        $params = array(
            ':id' => $user->getId(),
            ':username' => $user->getNom(),
            ':userpass' => $user->getPassword(),
            ':userstatus' => $user->getStatus(),
            ':last_modified_on' => self::formatDateTime($user->getLastModifiedOn()),
            ':created_on' => self::formatDateTime($user->getCreatedOn()),
        );
        if ($user->getId()) {
            // unset created date, this one is never updated
            unset($params[':created_on']);
        }
        return $params;
    }

    private static function formatDateTime(DateTime $date) {
        return $date->format(DateTime::ISO8601);
    }

    /**
     * Find all {@link User}s by search criteria.
     * @return array array of {@link User}s
     */
    public function find(UserSearchCriteria $search = null) {
        $result = array();
        foreach ($this->query($this->getFindSql($search)) as $row) {
            $user = new Air2Java\model\Individu();
            UserMapper::map($user, $row);
            $result[$user->getId()] = $user;
        }
        return $result;
    }

}
