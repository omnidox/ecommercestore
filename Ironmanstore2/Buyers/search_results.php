<?php

include("Product_object.php");

$search_query = $_GET['query'];

$products = Product::search($search_query);

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