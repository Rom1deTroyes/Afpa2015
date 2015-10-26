<?xml version="1.0" encoding="UTF-8" ?>
<?php
include "../modeles/pays_M.php";

$listePays = Pays_M::getPays ();

echo "<listePays>";
foreach ( $listePays as $titre => $pays ) {
//    echo $titre;
    foreach ( $pays as $id => $label ) {
        echo "<pays id=" . $id . ">" . $label . "</pays>";
	}
}
echo "</listePays>";
?>