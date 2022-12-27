<?php

include ('db_connect.php');




// Check for form submission
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Get the form data
    $username = $mysqli->real_escape_string($_POST['username']);
    $password = $mysqli->real_escape_string($_POST['password']);

    // Query the database for the user
    $query = "SELECT * FROM user WHERE user_name = '$username'";
    $result = $mysqli->query($query);
    $user = $result->fetch_assoc();


    // Check if the current user is an admin
$current_user_id = $user["UserID"];  // Replace with the current user's ID
$admin_query = "SELECT * FROM admin WHERE User_id_FK = $current_user_id";
$admin_result = $mysqli->query($admin_query);

    if ($admin_result->num_rows == 0) {
    // The current user is not an admin
    die('Error: You are not authorized to perform this action.');
    }

    if ($result->num_rows == 0) {
        die('Error: The specified user does not exist.');
      }

    // Check if the user exists and the password is correct
    if ($user && password_verify($password, $user['Password'])) {
        // Login successful, start a session and redirect to the dashboard
        session_start();
        $_SESSION['user'] = $user;

        $current_user_id = $user['UserID'];

        $_SESSION['user_id'] = $current_user_id;  // Replace with the current user's ID
        header('Location: dashboard.php');
        exit;
    } else {
        // Login failed, display an error message
        $error = 'Invalid username or password';
    }
}

include("db_close.php");

?>

<!-- HTML form for the login page -->
<form method="post" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required>
    <br>
    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required>
    <br>
    <input type="submit" value="Log In">
</form>

<?php if (isset($error)) { ?>
    <p><?php echo $error; ?></p>
<?php } ?>
