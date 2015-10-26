<?php

/*
 * Air2Java
 * (c)2014 Rom1
 */

namespace Air2Java\Model;

/**
 * Model class representing one Pays item.
 * @author Rom1
 * @category Model
 */
final class Pays {

    /** @var int */
    private $_id;

    /** @var string */
    private $_label;

    /**
     * Create new {@link Pays}.
     */
    public function __construct() {
        $this->_id = NAN;
        $this->_label = NULL;
    }

    //~ Getters & setters

    /**
     * Return the Pays ID
     * @return int <i>null</i> if not persistent
     */
    public function getId() {
        return $this->_id;
    }

    /**
     * Set the Pays ID
     * @param ine $id to be set
     * @throws Exception if ID already set.
     */
    public function setId($id) {
        if ($this->_id !== null && $this->_id != $id) {
            throw new Exception('Cannot change identifier to ' . $id . ', already set to ' . $this->_id);
        }
        $this->_id = (int) $id;
    }

    /**
     * Return the Pays label
     * @return string
     */
    public function getLabel() {
        return $this->_label;
    }

    /**
     * Set the Pays label
     * @param String $label to be set
     */
    public function setLabel($label) {
        $this->_label = $label;
    }
}
