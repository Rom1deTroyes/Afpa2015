<?php

/*
 * Air2Java
 * (c)2014 Rom1
 */

namespace Air2Java\Model;

/**
 * Model for {@link Individu}
 *
 * @author Rom1
 */
class Individu_M {

    /**
     * Get all {@link Individu}s
     *
     * @return \ArrayObject of Individu
     */
    function getIndividus() {
        include_once '../dao/IndividuDao.php';

        $dao = new \Air2Java\dao\IndividuDao();
        $users = $dao->find();

        return $users;
    }

    /**
     * Get {@link Individu} by ID
     *
     * @param int $id The ID to search
     * @return Individu
     */
    function getIndividuById($id) {
        include_once '../dao/IndividuDao.php';

        $dao = new \Air2Java\dao\IndividuDao();
        $users = $dao->findById($id);

        return $users;
    }

    /**
     * Get {@link Individu} by Name
     *
     * @param sting $name The name to search
     * @return \ArrayObject of Individu
     */
    function getIndividuByName($name) {
        include_once '../dao/IndividuDao.php';

        $dao = new \Air2Java\dao\IndividuDao();
        $users = $dao->findByName($name);

        return $users;
    }

}
