<?php

/*
 * Air2Java
 * (c)2014 Rom1
 */

namespace Air2Java\Control;

require_once 'model/User.php';

class Individu {

    private $requete = null;
    private $individu = null;

    public function __construct($requete = null) {
        $this->requete = $requete;

        if ($requete->existeParametre('a')) {
            // Première lettre en majuscule, la suite en minuscules
            $action = ucfirst(strtolower($requete->getParametre('a')));
        } else {
            $action = "ShowAll";
        }
        $this->doAction($action);
    }

    /**
     * The <div id="individu">
     * @return DOMNode
     */
    public function getWidget() {
        $doc = new DOMDocument;
        $doc->preserveWhiteSpace = true;

        $this->isConnected() ? $doc->loadHTMLFile('page/edit/individu.html') : $doc->loadHTMLFile('page/show/individu.html');

        return ($doc->saveHTML());
    }

    /**
     * @return boolean true if user status is defined.
     */
    private function isConnected() {
        return (!$this->userstatus);
    }

//    private function connect($username,$userpass) {
    /**
     * Authenticate the User
     * @param User $user User to connect in.
     * @return boolean true if user status is defined.
     * @TODO : une vraie identification !
     */
    private function connect($user) {
        return ($user->getNom() == $user->getPrenom());
    }

    /**
     * Disconnect {@link User} by Clearing the {@link Session}.
     */
    private function disconnect() {
        $session = new Session();
        if ($session->existeAttribut('username')) {
            $session->setAttribut('username', NULL);
        }
        if ($session->existeAttribut('userpass')) {
            $session->setAttribut('userpass', NULL);
        }
        if ($session->existeAttribut('userstatus')) {
            $session->setAttribut('userstatus', NULL);
        }
    }

    /**
     * Execute an Action
     * @param string $action Action to be donne.
     */
    private function doAction($action) {
        switch ($action) {
            case "Connect":
                $user = new User(
                        $this->requete->existeParametre('username') ? $this->requete->getParametre('username') : ""
                        , $this->requete->existeParametre('userpass') ? $this->requete->getParametre('userpass') : ""
                );
                $this->useerstatus = $this->connect($user);
                break;
            case "ShowAll":

                break;
            default:
                break;
        }
    }

}
