





<?php

// Connect to the database
include ('db_connect.php');

// Check if the form has been submitted
if (isset($_POST['submit'])) {

    // Get the selected user and role
    $user_id = $_POST['user_id'];
    $role = $_POST['role'];


    $num_roles = 0;

    // Check if the user is an admin
    $sql = "SELECT * FROM admin WHERE User_id_FK = ?";
    $stmt = $mysqli->prepare($sql);
    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    $result = $stmt->get_result();
    $num_roles += $result->num_rows;
    
    // Check if the user is an owner
    $sql = "SELECT * FROM owner WHERE UserID_FK = ?";
    $stmt = $mysqli->prepare($sql);
    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    $result = $stmt->get_result();
    $num_roles += $result->num_rows;
    
    // Check if the user is an employee
    $sql = "SELECT * FROM employee WHERE user_id_FK = ?";
    $stmt = $mysqli->prepare($sql);
    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    $result = $stmt->get_result();
    $num_roles += $result->num_rows;
    
    // Check if the user is a buyer
    $sql = "SELECT * FROM buyer WHERE UserID_FK = ?";
    $stmt = $mysqli->prepare($sql);
    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    $result = $stmt->get_result();
    $num_roles += $result->num_rows;
    
    // Check if the user has any roles
    if ($num_roles > 0) {
        // The user has more than one role
        echo "Error: User already has a role!";
    } else {
          // If the role is "Buyer", insert a new row into the Buyer table
    if ($role == "Buyer") {
        $sql = "INSERT INTO buyer (UserID_FK) VALUES (?)";
        $stmt = $mysqli->prepare($sql);
        $stmt->bind_param("i", $user_id);
        $stmt->execute();
    }
    // If the role is "Employee", insert a new row into the Employee table
    elseif ($role == "Employee") {
        $sql = "INSERT INTO employee (user_id_FK, owner_ID_FK) VALUES (?,1)";
        $stmt = $mysqli->prepare($sql);
        $stmt->bind_param("i", $user_id);
        $stmt->execute();
    }
    }

}

// Select all users from the User table
$sql = "SELECT user.UserID, Fname, Lname, phone_number, country, state, Zip_Code, Street_Number, Street_Name, City, Apt_No, user_img_url, BuyerID, Employee_ID, OwnerID, Admin_ID
        FROM user
        LEFT JOIN buyer ON user.UserID = Buyer.UserID_FK
        LEFT JOIN employee ON user.UserID = Employee.user_id_FK
        LEFT JOIN owner ON user.UserID = owner.UserID_FK
        LEFT JOIN admin ON user.UserID = admin.User_id_FK";
$result = $mysqli->query($sql);

// Create a table to display the users and their roles
echo "<table>";
echo "<tr>";
echo "<th>Name</th>";
echo "<th>Phone Number</th>";
echo "<th>Address</th>";
echo "<th>Role</th>";
echo "</tr>";
while ($row = $result->fetch_assoc()) {
    $user_id = $row['UserID'];
    $name = $row['Fname'] . " " . $row['Lname'];
    $phone_number = $row['phone_number'];
    $address = $row['Street_Number'] . " " . $row['Street_Name'] . ", " . $row['City'] . ", " . $row['state'] . " " . $row['Zip_Code'];
    $role = "";



    if (!empty($row['BuyerID'])) {
        $role = "Buyer";
    } elseif (!empty($row['Employee_ID'])) {
        $role = "Employee";
    }
    elseif (!empty($row['OwnerID'])) {
        $role = "Owner";
    }
    elseif (!empty($row['Admin_ID'])) {
        $role = "Admin";
    }

    echo "<tr>";
    echo "<td>$name</td>";
   
    echo "<td>$phone_number</td>";
    echo "<td>$address</td>";
    echo "<td>$role</td>";
    echo "</tr>";
    }
    echo "</table>";
    
    // Create the dropdown menu for selecting a user
    echo "<form method='post'>";
    echo "<select name='user_id'>";
    $result = $mysqli->query($sql);
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
    