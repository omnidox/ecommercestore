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


    // Check if the current user is an buyer
$current_user_id = $user["UserID"];  // Replace with the current user's ID
$buyer_query = "SELECT * FROM buyer WHERE UserID_FK = $current_user_id";
$buyer_result = $mysqli->query($buyer_query);

if ($mysqli->error) {
    echo "Error2: " . $mysqli->error;
  }
$buyer = $buyer_result->fetch_assoc();

    if ($buyer_result->num_rows == 0) {
    // The current user is not an buyer
    die('Error: You are not a buyer.');
    }

    if ($result->num_rows == 0) {
        die('Error: The specified user does not exist.');
      }

    // Check if the user exists and the password is correct
    if ($user && password_verify($password, $user['Password'])) {
        // Login successful, start a session and redirect to the dashboard
        session_start();
        $_SESSION['user'] = $user;
        $_SESSION['buyer_id'] = $buyer['BuyerID'];

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
