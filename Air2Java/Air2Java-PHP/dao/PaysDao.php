<?php

/*
 * Air2Java
 * (c)2014 Rom1
 */

namespace Air2Java;

/**
 * DAO for {@link Pays}.
 */
final class PaysDao extends Dao\AcessDao {

    /**
     * Find all {@link Pays}s by search criteria.
     * @return array array of {@link Pays}s
     */
    public function find(PaysSearchCriteria $search = null) {
        $result = array();
        foreach ($this->query($this->getFindSql($search)) as $row) {
            $pays = new Pays();
            PaysMapper::map($pays, $row);
            $result[$pays->getId()] = $pays;
        }
        return $result;
    }

    /**
     * Find {@link Pays} by identifier.
     * @return Pays Pays or <i>null</i> if not found
     */
    public function findById($id) {
        $row = $this->query('SELECT * FROM pays WHERE id = ' . (int) $id)->fetch();
        if (!$row) {
            return null;
        }
        $pays = new Pays();
        PaysMapper::map($pays, $row);
        return $pays;
    }

    /**
     *
     * @return array (size=1) 'PAYS' => array (size=241)
      0 => string '<div id="36"><p>Afghanistan</p></div>'
     */
    public function getPays() {
        // include_once 'metier/Pays.php';
        // TODO ajouter class=\'Pays\' dans <div>
        $sql = 'select XMLSERIALIZE(CONTENT XMLELEMENT(NAME "div",XMLATTRIBUTES(id_pays "id"),XMLFOREST(pays_label "span"))) AS Pays from pays order by pays_label';
        $result = $this->query($sql);
        return $result;
    }

    private function getFindSql(PaysSearchCriteria $search = null) {
        $sql = 'SELECT * FROM pays ';
        $orderBy = ' pays_label';
        $sql .= ' ORDER BY ' . $orderBy;
        return $sql;
    }

    /**
     * @return Pays
     * @throws Exception
     */
    private function execute($sql, Pays $pays) {
        $statement = $this->getDb()->prepare($sql);
        $this->executeStatement($statement, $this->getParams($pays));
        if (!$pays->getId()) {
            return $this->findById($this->getDb()->lastInsertId());
        }
        if (!$statement->rowCount()) {
            throw new NotFoundException('PAYS with ID "' . $pays->getId() . '" does not exist.');
        }
        return $pays;
    }

    private function getParams(Pays $pays) {
        $params = array(
            ':id' => $pays->getId(),
            ':label' => $pays->getPaysLabel(),
        );
        return $params;
    }

}
