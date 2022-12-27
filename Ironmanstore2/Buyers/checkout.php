<?php

// Connect to the database
include ('db_connect.php');

// Start a session to access the buyer's ID
session_start();
$buyer_id =  $_SESSION['buyer_id'];

// Check if the user has clicked the "Confirm" button
if (isset($_POST['checkout'])) {

        // Retrieve the items in the buyer's shopping cart from the Shopping_Cart table
        $result = $mysqli->query("SELECT * FROM shopping_Cart WHERE Buyer_ID_FK = $buyer_id");

        // // Loop through the items in the shopping cart and update the quantity in the Product table
        while ($row = $result->fetch_assoc()) {
            $product_id = $row['Prod_Key_FK'];
            $quantity = $row['Quantity'];
    
            $query = "UPDATE product SET Quantity = Quantity - $quantity WHERE Product_ID = $product_id";
            $mysqli->query($query);
        }
    // Retrieve the address details from the form fields
    $country = $_POST['country'];
    $state = $_POST['state'];
    $zip_code = $_POST['zip_code'];
    $street_number = $_POST['street_number'];
    $street_name = $_POST['street_name'];
    $city = $_POST['city'];
    $apt_no = $_POST['apt_no'];

    // echo $country;


    // Validate the form fields (e.g., make sure that the apt_no is a positive integer)


    // Add error handling here if any of the form fields are invalid

    // Retrieve the items in the buyer's shopping cart from the Shopping_Cart table
    $result = $mysqli->query("SELECT * FROM shopping_Cart WHERE Buyer_ID_FK = $buyer_id");

    // Calculate the total cost of the items in the cart
    $total_cost = 0;
    while ($row = $result->fetch_assoc()) {
        $item_cost = $row['Total_Cost'];

        // Add the item cost to the total cost
        $total_cost += $item_cost;
    }

    // Calculate the tax based on the buyer's location
    $tax_rate = 0.10; // for example, assume a 10% tax rate
    $tax_calculated = round($total_cost * $tax_rate, 2);
    $price_before_tax = $total_cost;
    $price_after_tax = round($total_cost + $tax_calculated, 2);

    echo "tax calculated:" . $tax_calculated;
    // Insert the order details into the Order table
    $query = "INSERT INTO `order` (total_cost, Price_after_tax, price_before_tax, tax_calculated, Timestamp, Country, State, Zip_code, street_number, street_name, city, apt_no, Buyer_ID_FK) 
    VALUES ($total_cost, $price_after_tax, $price_before_tax, $tax_calculated, CURRENT_TIMESTAMP, '$country', '$state', '$zip_code', $street_number, '$street_name', '$city', $apt_no, $buyer_id)";
    $mysqli->query($query);
    

    // if ($mysqli->error) {
    //     echo "Error1: " . $mysqli->error;
    // }

    // Get the OrderID of the inserted row
    $order_id = $mysqli->insert_id;


    // echo "OrderID: " . $order_id;


    // Insert the items in the shopping cart into the Order_Item table
    $result = $mysqli->query("SELECT * FROM shopping_Cart WHERE Buyer_ID_FK = $buyer_id");

    // if ($mysqli->error) {
    //     echo "Error2: " . $mysqli->error;
    // }

    // // Get the OrderID of the inserted row
    // $order_id = $mysqli->insert_id;

    // Insert the items in the shopping cart into the Order_Item table
    $result = $mysqli->query("SELECT * FROM shopping_Cart WHERE Buyer_ID_FK = $buyer_id");
    // if ($mysqli->error) {
    //     echo "Error2: " . $mysqli->error;
    // }
    while ($row = $result->fetch_assoc()) {
        $product_id = $row['Prod_Key_FK'];
        $quantity = $row['Quantity'];

        echo ("this is the input for order_item");
        echo($order_id);
        echo ($product_id);
        echo ($quantity);


        $query = "INSERT INTO order_Item (Order_ID_FK, Prod_Key_FK, Quantity) VALUES ($order_id, $product_id, $quantity)";
        $mysqli->query($query);
        // if ($mysqli->error) {
        //     echo "Error2: " . $mysqli->error;
        // }
    }

    // Clear the shopping cart
    $query = "DELETE FROM shopping_Cart WHERE Buyer_ID_FK = $buyer_id";
    $mysqli->query($query);

    include("db_close.php");
    // Redirect the user to the checkout confirmation page
    header("Location: checkout_confirmation.php");
    exit;


}


?>


<form action="" method="post">
    <!-- Other form fields and buttons here -->
<!-- Form fields for the address details -->
<label for="country">Country:</label><br>
<input type="text" id="country" name="country"><br>
<label for="state">State:</label><br>
<input type="text" id="state" name="state"><br>
<label for="zip_code">Zip Code:</label><br>
<input type="text" id="zip_code" name="zip_code"><br>
<label for="street_number">Street Number:</label><br>
<input type="number" id="street_number" name="street_number"><br>
<label for="street_name">Street Name:</label><br>
<input type="text" id="street_name" name="street_name"><br>
<label for="city">City:</label><br>
<input type="text" id="city" name="city"><br>
<label for="apt_no">Apartment Number:</label><br>
<input type="number" id="apt_no" name="apt_no"><br>

    <!-- Confirm button -->
    <button type="submit" name="checkout">Confirm</button>
</form>
