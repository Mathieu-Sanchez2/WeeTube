<?php 
$dsn = 'mysql:dbname=weetube;host=localhost';
$user = 'weetube';
$password = 'XaLPbEWte6Oxb[Dk';

$bdd = new PDO($dsn, $user, $password);
var_dump($bdd);