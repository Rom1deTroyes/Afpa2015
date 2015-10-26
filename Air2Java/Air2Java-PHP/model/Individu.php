<?php

/*
 * Air2Java
 * (c)2014 Rom1
 */

namespace Air2Java\Model;

/**
 * Model class representing one Individu item.
 * @author Rom1
 * @category Model
 */
final class Individu {

    /** @var int */
    private $_id;

    /** @var string */
    private $_nom;

    /** @var string */
    private $_prenom;

    /** @var string */
    private $_status;

    /** @var \DateTime */
    private $_date_naissance;

    /** @var \DateTime */
    private $_lastModifiedOn;

    /**
     * Create new {@link Individu}.
     */
    public function __construct() {
        $this->_id = NAN;
        $this->_nom = NULL;
        $this->_prenom = NULL;
        $this->_status = NULL;
        $this->setDate_naissance();
        $this->setLastModifiedOn();
    }

    //~ Getters & setters

    /**
     * Return the Individu ID
     * @return int <i>null</i> if not persistent
     */
    public function getId() {
        return $this->_id;
    }

    /**
     * Set the Individu ID
     * @param int $id to be set
     * @throws Exception if ID already set.
     */
    public function setId($id) {
        if ($this->_id !== null && $this->_id != $id) {
            throw new Exception('Cannot change identifier to ' . $id . ', already set to ' . $this->_id);
        }
        $this->_id = (int) $id;
        $this->setLastModifiedOn();
    }

    /**
     * Return the Individu Name
     * @return string
     */
    public function getNom() {
        return $this->_nom;
    }

    /**
     * Set the Individu Name
     * @param string $name to be set
     */
    public function setNom($name) {
        $this->_nom = $name;
        $this->setLastModifiedOn();
    }

    /**
     * Return the Individu Prenom
     * @return string
     */
    public function getPrenom() {
        return $this->_prenom;
    }

    /**
     * Set the User Individu
     * @param string $prenom to be set.
     */
    public function setPrenom($prenom) {
        $this->_prenom = $prenom;
        $this->setLastModifiedOn();
    }

    /**
     * Return the User Status
     * @return string
     */
    public function getStatus() {
        return $this->_status;
    }

    /**
     * Set the User Status
     *
     * @param String $status to be set
     */
    public function setStatus($status) {
        $this->_status = $status;
        $this->setLastModifiedOn();
    }

    /**
     * Set the date of last modification.
     *
     * @param \DateTime $date
     */
    public function setLastModifiedOn(\DateTime $date = null) {
        $this->_lastModifiedOn = $date ? $date : new \DateTime();
    }

    /**
     *
     * @return \DateTime
     */
    public function getLastModifiedOn() {
        return $this->_lastModifiedOn;
    }

    /**
     * Set the Individu birth date.
     * @param \DateTime $date
     */
    private function setDate_naissance(\DateTime $date = NULL) {
        $this->_date_naissance = $date ? $date : new \DateTime();
    }

    /**
     *
     * @return \DateTime
     */
    public function getDate_naissance() {
        return $this->_date_naissance;
    }

}
