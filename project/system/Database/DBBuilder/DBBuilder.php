<?php

namespace System\Database\DBBuilder;

use System\Config\Config;
use System\Database\DBConnection\DBConnection;

class DBBuilder
{

    public function __construct()
    {
        $this->createTables();
        die("migrations run successfully");
    }

    private function getMigrations()
    {
        $oldMigrationsArray = $this->getOldMigrations();

        $migrationsDirectory = Config::get('app.BASE_DIR') . DIRECTORY_SEPARATOR . 'database' . DIRECTORY_SEPARATOR .
         'migrations' . DIRECTORY_SEPARATOR;

        // The glob() function returns an array of filenames or directories matching a specified pattern.

        $allMigrationsArray = glob($migrationsDirectory . '*.php');

        $newMigrationsArray = array_diff($allMigrationsArray, $oldMigrationsArray);

        $this->putOldMigrations($allMigrationsArray);

        $sqlCodeArray = [];

        foreach ($newMigrationsArray as $fileName) {
            $sqlCode = require $fileName;
            array_push($sqlCodeArray, $sqlCode[0]);
        }

        return $sqlCodeArray;
    }

    private function getOldMigrations()
    {
        //This function is the preferred way to read the contents of a file into a string.

        $data = file_get_contents(__DIR__ . '/OldTables.db');

        return empty($data) ? [] : unserialize($data);
    }

    private function putOldMigrations($value)
    {
        // The file_put_contents() writes data to a file.

        file_put_contents(__DIR__ . '/OldTables.db', serialize($value));
    }


    private function createTables()
    {

        $migrations = $this->getMigrations();

        $pdoInstance = DBConnection::getDBConnectionInstance();

        foreach ($migrations as $migration) {
            $statement = $pdoInstance->prepare($migration);
            $statement->execute();
        }

        return true;
    }
}
