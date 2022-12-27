<?php

// Connect to the database
include ('db_connect.php');





// Check if the form was submitted
if (isset($_POST['submit'])) {
    // Get the form data    
    $action = $_POST['action'];
    $user_id = $_POST['user_id'];

    // Check if the action is to delete a user
    if ($action == 'delete') {
        session_start();
        // Check if the user is trying to delete themselves
        if ($user_id == $_SESSION['user_id']) {
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

?>

<!-- HTML for the user management page -->
<h1>User Management</h1>

<!-- Display any errors -->
<?php if (isset($error)) { ?>
    <p style="color:red"><?php echo $error; ?></p>
<?php } ?>

<!-- List of users -->
<h2>List of users</h2>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Actions</th>
    </tr>
    <?php foreach ($users as $user) { ?>
        <tr>
            <td><?php echo $user['UserID']; ?></td>
            <td><?php echo $user['Fname'] . ' ' . $user['Lname']; ?></td>
            <td>
                <form method="post" action="admin_user_management.php">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="user_id" value="<?php echo $user['UserID']; ?>">
                    <input type="submit" name ="submit" value="Delete">
                </form>
            </td>
        </tr>
    <?php } ?>
</table>
