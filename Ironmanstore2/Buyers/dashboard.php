<?php

// Start the session
session_start();

// Check if the user is logged in
if (!isset($_SESSION['user'])) {
    // If not, redirect to the login page
    header('Location: Buyer_Login.php');
    exit;
}

// Get the user data from the session
$user = $_SESSION['user'];

?>

<!-- HTML for the dashboard page -->
<h1>Welcome, <?php echo $user['Fname']; ?>!</h1>
<p>This is your dashboard, where you can manage your account and access special features.</p>

<!-- Example of a protected feature -->
<h2>Protected Feature</h2>
<p>Only logged in users can access this feature.</p>

<form action="Product_page.php">
    <input type="submit" value="Lets Buy Ironman Products">
</form>

<!-- <form action="order_history.php">
    <input type="submit" value="order_history">
</form> -->


<!-- Example of a logout button -->
<form method="post" action="logout.php">
    <input type="submit" value="Log Out">
</form>
