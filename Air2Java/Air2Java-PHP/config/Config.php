<?php

/*
 * Air2Java
 * (c)2014 Rom1
 */

namespace Air2Java ;

/**
 * Configuration of the Application
 *
 * @author Rom1
 */
final class Config {

    /** @var array of configuration parameters */
    private static $params = null;

    /**
     * Get the configuration parameters for the Application
     * @param $section The .ini file to load.
     * @return array of configuration params.
     * @throws Exception if $section not exist.
     */
    public static function getConfig($section = null) {
        if ($section === null) { // If no $section required, return all params
            return self::getParams();
        }

        $params = self::getParams();
        if (!array_key_exists($section, $params)) {
            throw new Exception('Unknown config section: ' . $section);
        }
        return $params[$section];
    }

    /**
     * @return array of configuration param.
     */
    private static function getParams() {
        if (self::$params !== null) {
            return self::$params;
        }
        self::$params = \parse_ini_file('./config/config.ini', true);
        return self::$params;
    }

}