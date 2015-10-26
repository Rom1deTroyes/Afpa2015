<?php

// Facade

namespace Air2Java\Control;

require_once 'fw\Requete.php';
/** @var \Air2Java\Fw\Requete Fusion GET/POST of the HTTP Request */
$requete = new \Air2Java\Fw\Requete(array_merge($_GET, $_POST));

/** @var string Name of the Controleur to load. */
$controleurName = 'Index';
// Get the Controleur from Request.
if ($requete->existeParametre('c')) {
    // Première lettre en majuscule, la suite en minuscules
    $controleurName = ucfirst(strtolower($requete->getParametre('c')));
}

// Initiate the Controleur from file : page/<$controleurName>.php
$controleurFile = 'page/' . $controleurName . '.php';
if (file_exists($controleurFile)) {
    // Instanciation du contrôleur adapté à la requête
    require_once $controleurFile;

    switch ($controleurName) {
        case 'Index':
            $controleur = new Index($requete); //
            break;
        case 'Connexion':
            $controleur = new Connexion($requete);
            break;
        case 'Individus':
            $controleur = new Individus($requete);
            break;
        case 'Musicien':
            $controleur = new Musicien($requete);
            break;
        default:
            $controleur = new $controleurName($requete); // Connexion($requete); // Index($requete); //
            break;
    }

//    trim($controleur->getWidget(), " \t\n\r\0\x0B\x13");
    echo $controleur->getWidget();
} else {
    var_dump($requete);
    throw new \Exception("Controleur '$controleurFile' introuvable");
}
