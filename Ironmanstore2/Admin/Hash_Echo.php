<?php

// Get the password from the user
$password = 'password123';

// Generate the password hash
$hash = password_hash($password, PASSWORD_DEFAULT);

// Echo the password hash
echo $hash;

?>