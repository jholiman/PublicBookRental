<?php

$serverName = "localhost";
$username = "root";
$password = "";
$dbName = "bookrental";

$conn = mysqli_connect($serverName, $username, $password, $dbName);

if(!$conn) {
    die("Connection to the database failed: ".mysqli_connect_error());
}
?>
