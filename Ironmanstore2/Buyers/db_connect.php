<?php
// Connect to the database
$db_host = 'localhost';
$db_user = 'root';
$db_pass = '';
$db_name = 'iron_man_store1';
$mysqli = new mysqli($db_host, $db_user, $db_pass, $db_name);

// Check for errors
if ($mysqli->connect_error) {
  die('Connect Error (' . $mysqli->connect_errno . ') ' . $mysqli->connect_error);
}