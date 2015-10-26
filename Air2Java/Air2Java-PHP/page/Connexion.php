<?php

/*
 * Air2Java
 * (c)2014 Rom1
 */

namespace Air2Java\Control;

require_once 'model/User.php';

/**
 * Manage the Connexion of the User to the Application.
 */
class Connexion {

    /** @var \Air2Java\Fw\Requete */
    public $requete = null;

    /** @var \Air2Java\Model\User */
    private $user = null;

    /** @var string @deprecated since version 0/
      private $userstatus = null;

      /**
     *
     * @param Requete $requete
     * @return type
     */
    public function __construct($requete = null) {
        $this->requete = $requete;

        if ($requete->existeParametre('a')) {
            // Première lettre en majuscule, la suite en minuscules
            $action = \ucfirst(\strtolower($requete->getParametre('a')));
        } else {
            $action = "Disconnect";
        }
        $this->doAction($action);

        return $this->getWidget();
    }

    /**
     * The <div id="connexion">
     * @return DOMNode
     */
    public function getWidget() {
        $doc = new \DOMDocument;
        $doc->preserveWhiteSpace = true;

        $this->isConnected() ? $doc->loadHTMLFile('page/edit/connexion.html') : $doc->loadHTMLFile('page/show/connexion.html', LIBXML_HTML_NOIMPLIED);
        return ($doc->saveHTML());
    }

    /**
     * @return boolean true if user status is defined.
     */
    private function isConnected() {
        return (!$this->user->getStatus());
    }

//    private function connect($username,$userpass) {
    /**
     * Authenticate the User
     * @param \Air2Java\Model\User $user User to connect in.
     * @return boolean true if user status is defined.
     * @TODO : une vraie identification !
     */
    private function connect($user) {
        require_once './dao/UserDao.php';
        $dao = new \Air2Java\Auth\UserDao();
        $this->user->setStatus($dao->getUser($user->getNom(), $user->getPassword()));
        //return ($user->getNom() == $user->getPassword());
        return $this->user->getStatus();
    }

    /**
     * Disconnect {@link User} by Clearing the {@link Session}.
     */
    private function disconnect() {
        /** @var \Air2Java\Fw\Session */
        $session = $this->requete->getSession();
        $session->setAttribut('username', NULL);
        $session->setAttribut('userpass', NULL);
        $session->setAttribut('userstatus', NULL);

//        if ($session->existeAttribut('username')) {
//            $session->setAttribut('username', NULL);
//        }
//        if ($session->existeAttribut('userpass')) {
//            $session->setAttribut('userpass', NULL);
//        }
//        if ($session->existeAttribut('userstatus')) {
//            $session->setAttribut('userstatus', NULL);
//        }
    }

    /**
     * Execute an Action
     * @param string $action Action to be donne.
     */
    private function doAction($action) {
        $this->user = new \Air2Java\Model\User();
        switch ($action) {
            case "Connect":
                $this->user->setNom($this->requete->existeParametre('username') ? $this->requete->getParametre('username') : null);
                $this->user->setPassword($this->requete->existeParametre('userpass') ? $this->requete->getParametre('userpass') : null);

                $this->user->setStatus($this->connect($this->user));
                break;
            case "Disconnect":
                $this->disconnect();
                break;
            default:
                break;
        }
    }

}
