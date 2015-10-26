<?php

/*
 * Air2Java
 * (c)2014 Rom1
 */

namespace Air2Java\Auth;

require_once 'AccessDao.php';

/**
 * DAO for {@link \Air2Java\model\User}.
 *
 * @author Rom1
 */
final class UserDao extends \Air2Java\Dao\AcessDao {

    public function __construct() {
        parent::__construct();
    }

    /**
     * Find {@link User} by user/password.
     * Renvoie un utilisateur de la base à partir de son nom et pwd
     * @param string user
     * @param string password
     * @return \Air2Java\Model\User or <i>null</i> if not found
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
        $user = new \Air2Java\Model\User();
        require_once './mapping/UserMapper.php';
        UserMapper::map($user, $row);
        return $user;
    }

//		La fonction Java AccessDao équivalente :
//		String requete = ;
//		PreparedStatement reqp;
//		try {
//			reqp = connect_.prepareStatement(requete);
//			System.out.println("// AccessDao - requete: " + requete + " - "
//					+ nom + " / " + pwd);
//			reqp.setString(1, nom);
//			reqp.setString(2, pwd);
//
//			// execution de la requete
//			ResultSet result = reqp.executeQuery();
//			result.next();
//			User util = new User();
//			util.setNom(result.getString("NOM"));
//			util.setPassword(result.getString("PRENOM"));
//			System.out.println("// AccessDao - Utilisateur identifié: "
//					+ util.getNom());
//			reqp.close();
//			return util;
//		} catch (SQLException sqlE) {
//			System.out.println("// AccessDao - Erreur SQL : "
//					+ sqlE.getMessage().toString());
//			return null;
//		} catch (Exception e) {
//			System.out.println("// AccessDao - Erreur autre que SQL : "
//					+ e.getMessage().toString());
//			return null;
//		}
//	}

    /**
     * Find {@link User} by identifier.
     * @param int $id The ID to search
     * @return \Air2Java\Model\User or <i>null</i> if not found
     */
    public function findById($id) {
        $row = $this->query('SELECT id_individu, nom, prenom FROM individu WHERE id = ' . (int) $id)->fetch();
        if (!$row) {
            return null;
        }
        $user = new Air2Java\model\User();
        \UserMapper::map($user, $row);
        return $user;
    }

    /**
     * Save {@link User}.
     * @param \Air2Java\Model\User $user {@link User} to be saved
     * @return \Air2Java\Model\User saved {@link User} instance
     */
    public function save(\Air2Java\Model\User $user) {
        if ($user->getId() === null) {
            return $this->insert($user);
        }
        return $this->update($user);
    }

    /**
     * Delete {@link User} by identifier.
     * @param int $id {@link User} identifier
     * @return bool <i>true</i> on success, <i>false</i> otherwise
     */
    public function delete($id) {
        $sql = '
            UPDATE users SET
                username = :username,
                userpass = :userpass
            WHERE
                id = :id';
        $statement = $this->getDb()->prepare($sql);
        $this->executeStatement($statement, array(
            ':username' => "",
            ':userpass' => "",
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
     * @param \Air2Java\Model\User $user to instert
     * @return \Air2Java\Model\User inserted
     * @throws Exception
     */
    private function insert(Air2Java\model\User $user) {
        $now = new DateTime();
        $user->setId(null);
        $user->setCreatedOn($now);
        $user->setLastModifiedOn($now);
        $sql = '
            INSERT INTO user (id, nom, created_on, last_modified_on, status)
                VALUES (:id, :nom, :created_on, :last_modified_on, :status)';
        return $this->execute($sql, $user);
    }

    /**
     *
     * @param \Air2Java\Model\User $user to update.
     * @return \Air2Java\Model\User updated.
     * @throws Exception
     */
    private function update(Air2Java\model\User $user) {
        $user->setLastModifiedOn(new DateTime());
        $sql = '
            UPDATE user SET
                username = :username,
                userpass = :userpass,
                userstatus = :userstatus,
            WHERE
                id = :id';
        return $this->execute($sql, $user);
    }

    /**
     *
     * @param string $sql the sql request to execute
     * @param \Air2Java\Model\User $user User source
     * @return \Air2Java\Model\User
     * @throws Exception
     */
    private function execute($sql, \Air2Java\Model\User $user) {
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

    private function getParams(\Air2Java\model\User $user) {
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
            $user = new Air2Java\model\User();
            UserMapper::map($user, $row);
            $result[$user->getId()] = $user;
        }
        return $result;
    }

}
