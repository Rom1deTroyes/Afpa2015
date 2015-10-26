<?php

/**
 * Air2Java
 * (c)2014 Rom1
 */

namespace Air2Java\Modele;

/**
 * Model for {@link Pays}.
 */
class Pays {

    /** @var int Pays ID */
    var $Id_Pays;

    /** @var string Pays Label */
    var $pays_label;

    /**
     *
     * @param int $Id_Pays
     * @param string $pays_label
     */
    function __construct($Id_Pays, $pays_label) {
        $this->Id_Pays = $Id_Pays;
        $this->pays_label = $pays_label;
    }

    /**
     *
     * @return int
     */
    function getId() {
        return $this->Id_Pays;
    }

    /**
     *
     * @return int
     */
    function getId_pays() {
        return $this->Id_Pays;
    }

    /**
     *
     * @return string
     */
    function getPays_label() {
        return $this->pays_label;
    }

}
