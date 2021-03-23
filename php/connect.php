<?php
/* Connexion à une base MySQL avec l'invocation de pilote */
$dsn = 'mysql:dbname=rankandgo;host=localhost';
$user = 'root';
$password = '';



try {
    $dbh = new PDO($dsn, $user, $password);
    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo ("Connection Failed");
}