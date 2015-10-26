<?php

/* Air2Java
 * (c)2014 Rom1
 */

namespace Air2Java\Individus;

/**
 * Mapper for {@link \Air2Java\Model\Individu} from array.
 */
final class IndividuMapper {

    private function __construct() { // Pattern Singleton
    }

    /**
     * Maps array to the given {@link Individu}.
     * <p>
     * Expected properties are:
     * <ul>
     *   <li>id</li>
     *   <li>nom</li>
     *   <li>prenom</li>
     *   <li>date_naissance</li>
     * </ul>
     * @param \Air2Java\Model\Individu $individu model
     * @param array $properties to map from.
     */
    public static function map(\Air2Java\Model\Individu $individu, array $properties) {
        if (\array_key_exists('id', $properties)) {
            $individu->setId($properties['id']);
        }
        if (\array_key_exists('nom', $properties)) {
            $individu->setNom($properties['nom']);
        }
        if (\array_key_exists('prenom', $properties)) {
            $individu->setPrenom($properties['prenom']);
        }
        if (\array_key_exists('status', $properties)) {
            $individu->setDate_naissance($properties['date_naissance']);
        }
    }

}
