<?php

// Connect to the database
include ('db_connect.php');

// Start a session to access the buyer's ID
session_start();
$buyer_id =  $_SESSION['buyer_id'];


// Retrieve the most recent order for the buyer
$result = $mysqli->query("SELECT * FROM `order` WHERE Buyer_ID_FK = $buyer_id ORDER BY Timestamp DESC LIMIT 1");
$order = $result->fetch_assoc();

// Retrieve the items in the order from the Order_Item table
$result = $mysqli->query("SELECT * FROM order_Item WHERE Order_ID_FK = " . $order['OrderID']);

// Display the order details and items
echo '<h1>Order Confirmation</h1>';
echo '<p>Order ID: ' . $order['OrderID'] . '</p>';
echo '<p>Total cost: ' . $order['total_cost'] . '</p>';
echo '<p>Price after tax: ' . $order['Price_after_tax'] . '</p>';
echo '<p>Price before tax: ' . $order['price_before_tax'] . '</p>';
echo '<p>Tax calculated: ' . $order['tax_calculated'] . '</p>';
echo '<p>Timestamp: ' . $order['Timestamp'] . '</p>';
echo '<p>Country: ' . $order['Country'] . '</p>';
echo '<p>State: ' . $order['State'] . '</p>';
echo '<p>Zip code: ' . $order['Zip_code'] . '</p>';
echo '<p>Street number: ' . $order['street_number'] . '</p>';
echo '<p>Street name: ' . $order['street_name'] . '</p>';
echo '<p>City: ' . $order['city'] . '</p>';
echo '<p>Apartment number: ' . $order['apt_no'] . '</p>';
echo '<h2>Order Items</h2>';
echo '<table>';
echo '<tr><th>Product ID</th><th>Quantity</th></tr>';
while ($row = $result->fetch_assoc()) {
    $product_id = $row['Prod_Key_FK'];
    $quantity = $row['Quantity'];

    echo '<tr><td>' . $product_id . '</td><td>' . $quantity . '</td></tr>';
}
echo '</table>';

// Close the database connection
include ('db_close.php');

