<?php

/*
 * Air2Java
 * (c)2014 Rom1
 */

namespace Air2Java\Control;

require_once 'model/User.php';

class Individus {

    /** @var \Air2Java\Fw\Requete */
    private $requete = null;

    /** @var \Air2Java\Model\Individu */
    private $individu = null;

    /** $var \DOMDocument */
    private $doc = null;

    public function __construct($requete = null) {
        $this->requete = $requete;

        /** @var string Action */
        $action = 'ShowAll';
        if ($requete->existeParametre('a')) {
            // Première lettre en majuscule, la suite en minuscules
            $action = ucfirst(strtolower($requete->getParametre('a')));
        }
        $this->doAction($action);
    }

    /**
     * The <div id="individu">
     * @return DOMNode
     */
    public function getWidget() {
        if (!isset($this->doc)) {
            $this->doc = new \DOMDocument;
            $this->doc->preserveWhiteSpace = true;
        }
        !$this->isConnected() ? $this->doc->loadHTMLFile('page/edit/individu.html') : $this->doc->loadHTMLFile('page/show/individu.html', LIBXML_HTML_NOIMPLIED);

        return ($this->doc->saveHTML());
    }

    /**
     * @return boolean true if user status is defined.
     */
    private function isConnected() {
        return ($this->requete->getSession()->existeAttribut('userstatus'));
    }

    /**
     * Execute an Action
     * @param string $action Action to be donne.
     */
    private function doAction($action) {
        switch ($action) {
            case 'Connect':
                $user = new User(
                        $this->requete->existeParametre('username') ? $this->requete->getParametre('username') : ""
                        , $this->requete->existeParametre('userpass') ? $this->requete->getParametre('userpass') : ""
                );
                $this->useerstatus = $this->connect($user);
                break;
            case 'show':
                $this->isConnected() ? $this->doc->loadHTMLFile('page/edit/individu.html') : $this->doc->loadHTMLFile('page/show/individu.html', LIBXML_HTML_NOIMPLIED);

                break;
            case 'ShowAll':

                break;
            default:
                break;
        }
    }

}
