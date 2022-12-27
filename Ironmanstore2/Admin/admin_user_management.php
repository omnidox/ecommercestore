<?php

// Connect to the database
include ('db_connect.php');

// Check if the form was submitted
if (isset($_POST['submit'])) {
    // Get the form data    
    $action = $_POST['action'];
    

    // Check if the action is to add a user
    if ($action == 'add') {
        // Get the user data from the form
        $fname = $mysqli->real_escape_string($_POST['fname']);
        $mname = $mysqli->real_escape_string($_POST['mname']);
        $lname = $mysqli->real_escape_string($_POST['lname']);
        $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
        $phone_number = $mysqli->real_escape_string($_POST['phone_number']);
        $user_name = $mysqli->real_escape_string($_POST['user_name']);
        $country = $mysqli->real_escape_string($_POST['country']);
        $state = $mysqli->real_escape_string($_POST['state']);
        $zip_code = $mysqli->real_escape_string($_POST['zip_code']);
        $street_number = $mysqli->real_escape_string($_POST['street_number']);
        $street_name = $mysqli->real_escape_string($_POST['street_name']);
        $city = $mysqli->real_escape_string($_POST['city']);
        $apt_no = $mysqli->real_escape_string($_POST['apt_no']);
        $user_img_url = $mysqli->real_escape_string($_POST['user_img_url']);

        // Insert the user data into the User table
        $query = "INSERT INTO user (Fname, Mname, Lname, Password, phone_number, user_name, country, state, Zip_Code, Street_Number, Street_Name, City, Apt_No, user_img_url) VALUES ('$fname', '$mname', '$lname', '$password', '$phone_number', '$user_name', '$country', '$state', '$zip_code', '$street_number', '$street_name', '$city', '$apt_no', '$user_img_url')";

        // if (isset($query)) {
        //     // $query has a value
        //     echo "$query";
        //   } else {
        //     // $query is not set or is null
        //     echo ("no cigar");
        //   }
          
        
        $mysqli->query($query);
    }
    // Check if the action is to delete a user
    elseif ($action == 'delete') {

      
        //get form data

        $user_id = $_POST['user_id'];
        
        // Check if the user is trying to delete themselves
        session_start();
        if ($user_id == $_SESSION['user']['UserID']) {
            // If so, display an error message
            $error = 'You cannot delete yourself!';
        } else {
            // Otherwise, delete the user
            $query = "DELETE FROM user WHERE UserID = '$user_id'";
            $mysqli->query($query);
            
        }
    }
}

// Get the current list of users
$query = "SELECT * FROM user";
$result = $mysqli->query($query);
$users = $result->fetch_all(MYSQLI_ASSOC);
// echo $_POST['submit'];

include("db_close.php");
?>

<!-- HTML for the user management page -->
<h1>User Management</h1>

<!-- Display any errors -->
<?php if (isset($error)) { ?>
    <p style="color:red"><?php echo $error; ?></p>
<?php } ?>

<!-- Form for adding a new user -->
<h2>Add a new user</h2>
<form method="post" action="admin_user_management.php">
    <input type="hidden" name="action" value="add">
    <label for="fname">First name:</label><br>
    <input type="text" id="fname" name="fname" required><br>
    <label for="mname">Middle name:</label><br>
    <input type="text" id="mname" name="mname" required><br>
    <label for="lname">Last name:</label><br>
    <input type="text" id="lname" name="lname" required><br>
    <label for="password">Password:</label><br>
    <input type="password" id="password" name="password" required><br>
    <label for="phone_number">Phone number:</label><br>
    <input type="text" id="phone_number" name="phone_number" required><br>
    <label for="user_name">Username:</label><br>
    <input type="text" id="user_name" name="user_name" required><br>
    <label for="country">Country:</label><br>
    <input type="text" id="country" name="country" required><br>
    <label for="state">State:</label><br>
    <input type="text" id="state" name="state" required><br>
    <label for="zip_code">Zip code:</label><br>
    <input type="text" id="zip_code" name="zip_code"><br>
    <label for="street_number">Street number:</label><br>
    <input type="text" id="street_number" name="street_number"><br>
    <label for="street_name">Street name:</label><br>
    <input type="text" id="street_name" name="street_name"><br>
    <label for="city">City:</label><br>
    <input type="text" id="city" name="city"><br>
    <label for="apt_no">Apartment number:</label><br>
    <input type="text" id="apt_no" name="apt_no"><br>
    <label for="user_img_url">Profile image URL:</label><br>
    <input type="text" id="user_img_url" name="user_img_url"><br><br>
<input type="submit" name="submit" value="Add User">
</form>

<!-- Table showing the current list of users -->
<h2>Current users</h2>
<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Username</th>
        <th>Actions</th>
    </tr>
    <?php foreach ($users as $user) { ?>
        <tr>
            <td><?php echo $user['UserID']; ?></td>
            <td><?php echo $user['Fname'] . ' ' . $user['Lname']; ?></td>
            <td><?php echo $user['user_name']; ?></td>
            <td>
                <!-- Form for deleting the user -->
                <form method="post" action="admin_user_management.php">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="user_id" value="<?php echo $user['UserID']; ?>">
                    <input type="submit" name ="submit" value="Delete">
                </form>
            </td>
        </tr>
    <?php } ?>
</table>


