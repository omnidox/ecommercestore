<?php

// Connect to the database
$mysqli = new mysqli("localhost", "username", "password", "database");

// Check if the user who is trying to assign the role is an admin
$assigning_user_id = 1; // Replace with the ID of the user who is trying to assign the role
$sql = "SELECT * FROM admin WHERE User_id_FK = ?";
$stmt = $mysqli->prepare($sql);
$stmt->bind_param("i", $assigning_user_id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    // The user is an admin
    $row = $result->fetch_assoc();
    $admin_id = $row['Admin_ID'];

    // Assign the role of employee to the user
    $user_id = 2; // Replace with the ID of the user who is being assigned the role
    $sql = "INSERT INTO employee (user_id_FK, owner_ID_FK) VALUES (?, ?)";
    $stmt = $mysqli->prepare($sql);
    $stmt->bind_param("ii", $user_id, $admin_id);
    $stmt->execute();
} else {
    // The user is not an admin
    echo "You do not have permission to assign roles.";
}