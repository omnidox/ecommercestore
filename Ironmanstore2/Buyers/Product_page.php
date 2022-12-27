<?php

include("Product_object.php");

// Retrieve all products from the database
$products = Product::all();

// Loop through the products and display them on the page
foreach ($products as $product) {
    echo '<h2>' . $product->name . '</h2>';
    echo '<img src="' . $product->img_url . '" width="250" height="250">';
    echo '<p>' . $product->description . '</p>';
    echo '<p>Price: $' . $product->price . '</p>';
    echo '<p>Quantity: ' . $product->quantity . '</p>';
    echo '<form action="add_to_cart.php" method="post">';
    echo '<input type="hidden" name="product_id" value="' . $product->id . '">';
    echo '<input type="number" name="quantity" min="1" max="' . $product->quantity . '">';
    echo '<input type="submit" value="Add to Cart">';
    echo '</form>';
  }

  
$search_query = 'keyword';

$products = Product::search($search_query);

foreach ($products as $product) {
  // Display the product
}


include("db_close.php");
?>

<form action="search_results.php" method="get">
  <label for="query">Search for products:</label><br>
  <input type="text" id="query" name="query" placeholder="Enter search query">
  <input type="submit" value="Search">
</form>