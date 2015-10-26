<?php

/* Air2Java
 * (c)2014 Rom1
 */
namespace Air2Java\Auth ;
/**
 * Mapper for {@link \Air2Java\Model\User} from array.
 */
final class UserMapper {

    private function __construct() { // Pattern Singleton
    }

    /**
     * Maps array to the given {@link User}.
     * <p>
     * Expected properties are:
     * <ul>
     *   <li>id</li>
     *   <li>user</li>
     *   <li>password</li>
     *   <li>status</li>
     * </ul>
     * @param \Air2Java\Model\User $user model
     * @param array $properties to map from.
     */    
    public static function map(\Air2Java\Model\User $user, array $properties) {
        if (\array_key_exists('id', $properties)) {
            $user->setId($properties['id']);
        }
        if (\array_key_exists('nom', $properties)) {
            $user->setNom($properties['nom']);
            if (\array_key_exists('password', $properties)) {
                $user->setPassword($properties['password']);
                if (\array_key_exists('status', $properties)) {
                    $user->setStatus($properties['status']);
                }
            }
        }
    }

}
