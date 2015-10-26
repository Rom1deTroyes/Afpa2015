<?php

/*
 * Air2Java
 * (c)2014 Rom1
 */

namespace Air2Java\Control;

require_once 'page/Connexion.php';

class Index {

    /** @var \DOMDocument */
    private $doc = null;

    /**
     *
     * @param \Air2Java\Fw\Requete $requete
     */
    public function __construct($requete = null) {

        /**
         * Load Layout
         */
        $doc = new \DOMDocument;
        $doc->preserveWhiteSpace = false;
        $doc->loadHTMLFile('./page/layout.html');

        /**
         * Load Connexion widget
         */
        $connexWidget = new \Air2Java\Control\Connexion($requete);
        $docConnex = new \DOMDocument;
        $docConnex->preserveWhiteSpace = true;
        $docConnex->loadHTML($connexWidget->getWidget());

        $connexentry = $docConnex->getElementById("connexion");
        $entry = $doc->getElementById("connexion");

        $connexentry = $doc->importNode($connexentry, TRUE);

        $entry->parentNode->replaceChild($connexentry, $entry);

        $this->doc = $doc;
    }

    public function getWidget() {
        return $this->doc->saveHTML();
    }

}
