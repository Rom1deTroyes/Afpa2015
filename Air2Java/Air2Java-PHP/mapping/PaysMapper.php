<?php

/* Air2Java
 * (c)2014 Rom1
 */
namespace Air2Java ;
/**
 * Mapper for {@link Pays} from array.
 */
final class PaysMapper {

    private function __construct() { // Pattern Singleton
    }

    /**
     * Maps array to the given {@link Pays}.
     * <p>
     * Expected properties are:
     * <ul>
     *   <li>id</li>
     *   <li>label</li>
     * </ul>
     * @param Pays $pays model
     * @param array $properties to map from.
     */
    public static function map(Pays $pays, array $properties) {
        if (array_key_exists('id', $properties)) {
            $pays->setId($properties['id']);
        }
        if (array_key_exists('nom', $properties)) {
            $pays->setLabel($properties['label']);
        }
    }
}
