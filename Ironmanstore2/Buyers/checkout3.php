<?php

// Connect to the database
include ('db_connect.php');

// Start a session to access the buyer's ID
session_start();
$buyer_id =  $_SESSION['buyer_id'];

// Check if the user has clicked the "Checkout" button
if (isset($_POST['checkout'])) {
    // Retrieve the items in the buyer's shopping cart from the Shopping_Cart table
    $result = $mysqli->query("SELECT * FROM Shopping_Cart WHERE Buyer_ID_FK = $buyer_id");



    // Calculate the total cost of the items in the cart
    $total_cost = 0;
    while ($row = $result->fetch_assoc()) {
        $item_cost = $row['Total_Cost'];

        // Add the item cost to the total cost
        $total_cost += $item_cost;
    }

    // Calculate the tax based on the buyer's location
    $tax_rate = 0.10; // for example, assume a 10% tax rate
    $tax_calculated = $total_cost * $tax_rate;
    $price_before_tax = $total_cost;
    $price_after_tax = $total_cost + $tax_calculated;

    // Insert the order details into the Order table
    $query = "INSERT INTO Order (OrderID, Total_cost, Price_after_tax, Price_before_tax, Tax_calculated, Timestamp, Country, State, Zip_code, street_number, street_name, city, apt_no, Buyer_ID_FK) 
    VALUES (NULL, $total_cost, $price_after_tax, $price_before_tax, $tax_calculated, CURRENT_TIMESTAMP, 'USA', 'CA', '90210', $street_number, $street_name, $city, $apt_no, $buyer_id)";
    $mysqli->query($query);

    if ($mysqli->error) {
        echo "Error2: " . $mysqli->error;
      }
    
    // Get the OrderID of the inserted row
    $order_id = $mysqli->insert_id;

    // Insert the items in the shopping cart into the Order_Item table
    $result = $mysqli->query("SELECT * FROM Shopping_Cart WHERE Buyer_ID_FK = $buyer_id");
    if ($mysqli->error) {
        echo "Error2: " . $mysqli->error;
      }
    while ($row = $result->fetch_assoc()) {
        $product_id = $row['Prod_Key_FK'];
        $quantity = $row['Quantity'];

        $query = "INSERT INTO Order_Item (Order_ID_FK, Prod_Key_FK, Quantity) VALUES ($order_id, $product_id, $quantity)";
        $mysqli->query($query);
        if ($mysqli->error) {
            echo "Error2: " . $mysqli->error;
          }
    }

    // Clear the shopping cart
    $query = "DELETE FROM Shopping_Cart WHERE Buyer_ID_FK = $buyer_id";
    $mysqli->query($query);

    // Redirect the user to the checkout confirmation page
header("Location: checkout_confirmation.php");
exit;
}

// Retrieve the items in the buyer's shopping cart from the Shopping_Cart table
$result = $mysqli->query("SELECT * FROM Shopping_Cart WHERE Buyer_ID_FK = $buyer_id");

// Initialize the total cost to 0
$total_cost = 0;

// Display the shopping cart items in a table
echo '<form action="" method="post">';
echo '<table>';
echo '<tr><th>Product ID</th><th>Quantity</th><th>Total Cost</th><th></th></tr>';
while ($row = $result->fetch_assoc()) {
$product_id = $row['Prod_Key_FK'];
$quantity = $row['Quantity'];
$item_cost = $row['Total_Cost'];

// Add the item cost to the total cost
$total_cost += $item_cost;

echo '<tr><td>' . $product_id . '</td><td>' . $quantity . '</td><td>' . $item_cost . '</td>';
echo '<td><button type="submit" name="remove_item" value="' . $product_id . '">Remove</button></td>';
echo '</tr>';

}
echo '</table>';
echo '<p>Total cost: ' . $total_cost . '</p>';
echo '<button type="submit" name="checkout">Checkout</button>';
echo '</form>';

// Close the database connection
include ('db_close.php');




