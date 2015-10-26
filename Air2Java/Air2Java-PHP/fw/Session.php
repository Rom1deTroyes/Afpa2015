<?php

namespace Air2Java\Fw;

/**
 * Classe modélisant la session.
 * Encapsule la superglobale PHP $_SESSION.
 */
class Session {

    /**
     * Constructeur.
     * Démarre ou restaure la session
     * @author Rom1
     */
    public function __construct() {
        try {
            switch (session_status()) {
                case PHP_SESSION_ACTIVE :
                    // Session is Active, nothing to do !
                    // @TODO session_name($Cookie) ?
                    break;
                case PHP_SESSION_DISABLED :
                    throw new \Exception("Session DISABLED");
                    break;
                case PHP_SESSION_NONE :
                    // No Session found, start one :
                    session_start();
                    break;
                default:
                    break;
            }
        } catch (Exception $e) {
            var_dump($e); // session ko
        }
    }

    /**
     * Détruit la session actuelle
     */
    public function detruire() {
        session_destroy();
    }

    /**
     * Ajoute un attribut à la session
     *
     * @param string $nom Nom de l'attribut
     * @param string $valeur Valeur de l'attribut
     */
    public function setAttribut($nom, $valeur) {
        $_SESSION[$nom] = $valeur;
    }

    /**
     * Renvoie vrai si l'attribut existe dans la session
     *
     * @param string $nom Nom de l'attribut
     * @return bool Vrai si l'attribut existe et sa valeur n'est pas vide
     */
    public function existeAttribut($nom) {
        return (isset($_SESSION[$nom]) && $_SESSION[$nom] != "");
    }

    /**
     * Renvoie la valeur de l'attribut demandé
     *
     * @param string $nom Nom de l'attribut
     * @return string Valeur de l'attribut
     * @throws Exception Si l'attribut n'existe pas dans la session
     */
    public function getAttribut($nom) {
        if ($this->existeAttribut($nom)) {
            return $_SESSION[$nom];
        } else {
            throw new \Exception("Attribut '$nom' absent de la session");
        }
    }

}
