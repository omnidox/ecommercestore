<?php

// Connect to the database
include ('db_connect.php');

// Start a session to access the buyer's ID
session_start();
$buyer_id =  $_SESSION['buyer_id'];

// Retrieve the items in the buyer's shopping cart from the Shopping_Cart table
$result = $mysqli->query("SELECT * FROM Shopping_Cart WHERE Buyer_ID_FK = $buyer_id");

// Display the shopping cart items in a table
echo '<table>';
echo '<tr><th>Product ID</th><th>Quantity</th><th>Total Cost</th></tr>';
while ($row = $result->fetch_assoc()) {
    $product_id = $row['Prod_Key_FK'];
    $quantity = $row['Quantity'];
    $total_cost = $row['Total_Cost'];

    echo '<tr><td>' . $product_id . '</td><td>' . $quantity . '</td><td>' . $total_cost . '</td></tr>';
}
echo '</table>';

// Close the database connection
include ('db_close.php');

