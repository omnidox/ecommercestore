<?php


// connect to database
include ('db_connect.php');

// Check if the form has been submitted
if (isset($_POST['submit'])) {

    // Get the selected user and role
    $user_id = $_POST['user_id'];
    $role = $_POST['role'];

    // If the role is "Buyer", insert a new row into the Buyer table
    if ($role == "Buyer") {
        $sql = "INSERT INTO buyer (UserID_FK) VALUES (?)";
        $stmt = $mysqli->prepare($sql);
        $stmt->bind_param("i", $user_id);
        $stmt->execute();
    }
    // If the role is "Employee", insert a new row into the Employee table
    elseif ($role == "Employee") {
        $sql = "INSERT INTO employee (user_id_FK) VALUES (?)";
        $stmt = $mysqli->prepare($sql);
        $stmt->bind_param("i", $user_id);
        $stmt->execute();
    }
}

// Select all users from the User table
$sql = "SELECT UserID, Fname, Lname FROM user";
$result = $mysqli->query($sql);

// Create the dropdown menu for selecting a user
echo "<form method='post'>";
echo "<select name='user_id'>";
while ($row = $result->fetch_assoc()) {
    $user_id = $row['UserID'];
    $name = $row['Fname'] . " " . $row['Lname'];
    echo "<option value='$user_id'>$name</option>";
}
echo "</select>";

// Create the dropdown menu for selecting a role
echo "<select name='role'>";
echo "<option value='Buyer'>Buyer</option>";
echo "<option value='Employee'>Employee</option>";
echo "</select>";

echo "<input type='submit' name='submit' value='Assign Role'>";
echo "</form>";

include("db_close.php");

?>