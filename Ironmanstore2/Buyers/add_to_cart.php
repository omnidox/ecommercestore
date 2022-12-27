<?php

// Connect to the database
include ('db_connect.php');

// Retrieve the buyer's ID and the product ID and quantity from the form submission
session_start();

$buyer_id =  $_SESSION['buyer_id'];
$product_id = $_POST['product_id'];
$quantity = $_POST['quantity'];

// Retrieve the product's price from the Product table
$result = $mysqli->query("SELECT Price FROM product WHERE Product_ID = $product_id");
$row = $result->fetch_assoc();
$price = $row['Price'];

// Calculate the total cost for the quantity of the product
$total_cost = $price * $quantity;

// Insert a new entry into the Shopping_Cart table
$query = "INSERT INTO shopping_Cart (Buyer_ID_FK, Prod_Key_FK, Quantity, Total_Cost) VALUES ('$buyer_id', '$product_id', '$quantity', '$total_cost')";
$mysqli->query($query);


include ('db_close.php');
// Redirect the user back to the shopping cart page
header("Location: shopping_cart.php");
exit;
