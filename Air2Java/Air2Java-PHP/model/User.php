<?php

/*
 * Air2Java
 * (c)2014 Rom1
 */

namespace Air2Java\Model;

/**
 * Model class representing one User item.
 * @author Rom1
 * @category Model
 */
final class User {

    /** @var int */
    private $_id;

    /** @var string */
    private $_nom;

    /** @var string */
    private $_password;

    /** @var string */
    private $_status;

    /** @var \DateTime */
    private $_createdOn;

    /** @var \DateTime */
    private $_lastModifiedOn;

    /**
     * Create new {@link User}.
     */
    public function __construct() {
        $this->_id = NAN;
        $this->_nom = NULL;
        $this->_password = NULL;
        $this->_status = NULL;
        $this->setCreatedOn();
        $this->setLastModifiedOn();
    }

    //~ Getters & setters

    /**
     * Return the User ID
     * @return int <i>null</i> if not persistent
     */
    public function getId() {
        return $this->_id;
    }

    /**
     * Set the User ID
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
     * Return the User Name
     * @return string
     */
    public function getNom() {
        return $this->_nom;
    }

    /**
     * Set the User Name
     * @param string $name to be set
     */
    public function setNom($name) {
        $this->_nom = $name;
        $this->setLastModifiedOn();
    }

    /**
     * Return the User Password
     * @return string
     */
    public function getPassword() {
        return $this->_password;
    }

    /**
     * Set the User Password
     * @param string $password to be set.
     */
    public function setPassword($password) {
        $this->_password = $password;
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
     * Set the User Creation date.
     * @param \DateTime $date
     */
    private function setCreatedOn(\DateTime $date = NULL) {
        $this->_createdOn = $date ? $date : new \DateTime();
    }

    /**
     *
     * @return \DateTime
     */
    public function getCreatedOn() {
        return $this->_createdOn;
    }

}
