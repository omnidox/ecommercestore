<?php

// Connect to the database
include ('db_connect.php');

// Start a session to access the buyer's ID
session_start();
$buyer_id =  $_SESSION['buyer_id'];

// Check if the user has clicked the "Remove" button for a particular item
if (isset($_POST['remove_item'])) {

    
    $product_id = $_POST['remove_item'];
    echo ("product_id here:" . $product_id);


    // Remove the item from the Shopping_Cart table
    $query = "DELETE FROM shopping_Cart WHERE Buyer_ID_FK = $buyer_id AND Prod_Key_FK = $product_id";
    $mysqli->query($query);
}

// Check if the user has clicked the "Checkout" button
if (isset($_POST['checkout'])) {
    // Redirect the user to the checkout page
    header("Location: checkout.php");
    exit;
}

// Retrieve the items in the buyer's shopping cart from the Shopping_Cart table
$result = $mysqli->query("SELECT * FROM shopping_Cart WHERE Buyer_ID_FK = $buyer_id");

// Initialize the total cost to 0
$total_cost = 0;

// Display the shopping cart items in a table
echo '<form action="shopping_cart.php" method="post">';
echo '<table>';
echo '<tr><th>Product ID</th><th>Quantity</th><th>Total Cost</th><th></th></tr>';
while ($row = $result->fetch_assoc()) {
    $product_id = $row['Prod_Key_FK'];
    $quantity = $row['Quantity'];
    $item_cost = $row['Total_Cost'];

    // Add the item cost to the total cost
    $total_cost += $item_cost;

    echo '<tr><td>' . $product_id . '</td><td>' . $quantity . '</td><td>' . $item_cost . '</td>';
    echo '<td><button type="submit" name="remove_item" value="'.$product_id.'">Remove</button></td>';
    echo '<input type="hidden" name="action" value=$product_id>';
    echo '</tr>';
}
echo '</table>';
echo '<p>Total cost: ' . $total_cost . '</p>';
echo '<button type="submit" name="checkout">Checkout</button>';
echo '</form>';

// Close the database connection
include ('db_close.php');