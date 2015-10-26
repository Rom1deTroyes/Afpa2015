<?php

/*
 * Air2Java
 * (c)2014 Rom1
 */

namespace Air2Java\Model;

/**
 * Description of Connexion_M
 *
 * @author Rom1
 */
class Connexion_M {
    /** @var AcessDao */
    var $dao = null;

    public function __construct() {
        $this->dao = new AcessDao() ;
    }

    /**
     * Find {@link User} by user/password.
     * Renvoie un utilisateur de la base à partir de son nom et pwd
     * @param user user
     * @param pwd password
     * @return User or <i>null</i> if not found
     * Get the User
     * @param User $user
     * @see AccessDao->getUser()
     */
    public function connect($user = null){

    }
}
