<?php

/*
 * Air2Java
 * (c)2014 Rom1
 */

namespace Air2Java\Model;

/**
 * Model for {@link User}
 *
 * @author Rom1
 */
class User_M {
    /**
     * Get all {@link User}s
     *
     * @return \ArrayObject of User
     */
    function getUsers() {
        include_once '../dao/UserDao.php';

        $dao = new \Air2Java\dao\UserDao();
        $users = $dao->find();

        return $users;
    }

    /**
     * Get {@link User} by ID
     *
     * @param int $id The ID to search
     * @return User
     */
    function getUserById($id) {
        include_once '../dao/UserDao.php';

        $dao = new \Air2Java\dao\UserDao();
        $users = $dao->findById($id);

        return $users;
    }

    /**
     * Get {@link User} by Name
     *
     * @param sting $name The name to search
     * @return \ArrayObject of User
     */
    function getUserByName($name) {
        include_once '../dao/UserDao.php';

        $dao = new \Air2Java\dao\UserDao();
        $users = $dao->findByName($name);

        return $users;
    }
}
