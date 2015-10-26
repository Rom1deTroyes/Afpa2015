<?php
/**
 * (c) 2014 Air2Java
 * @author Rom1
 */
namespace Air2Java\Model ;

/**
 * Model for Pays
 */
class Pays_M {
	function getPays() {
		include_once '../dao/PaysDao.php';

		$dao = new \Air2Java\dao\PaysDao();
		$pays = $dao->getPays();

		return $pays;
	}
}