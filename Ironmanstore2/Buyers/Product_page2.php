<?php

session_start();
include("db_connect.php");

// Set all table names to lowercase
$mysqli->query("SET lower_case_table_names=1");

// Set up pagination
$items_per_page = 10; // number of items to display per page
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1; // current page number
$offset = ($page - 1) * $items_per_page; // offset for LIMIT clause

// Set up search query
$search_query = isset($_GET['search']) ? $mysqli->real_escape_string($_GET['search']) : '';

// Get total number of items
$total_items = 0;
if ($search_query != '') {
    $result = $mysqli->query("SELECT COUNT(*) FROM product WHERE name LIKE '%$search_query%' OR product_description LIKE '%$search_query%'");
    $row = $result->fetch_row();
    $total_items = $row[0];
} else {
    $result = $mysqli->query("SELECT COUNT(*) FROM product");
    $row = $result->fetch_row();
    $total_items = $row[0];
}

// Get the products
if ($search_query != '') {
    $result = $mysqli->query("SELECT * FROM product WHERE name LIKE '%$search_query%' OR product_description LIKE '%$search_query%' LIMIT $offset, $items_per_page");
} else {
    $result = $mysqli->query("SELECT * FROM product LIMIT $offset, $items_per_page");
}

// Display the products
while ($row = $result->fetch_assoc()) {
    echo "<h2>" . $row['Name'] . "</h2>";
    // echo "<img src='" . $row['img_url'] . "' alt='Product image' />";
    echo "<img src='" . $row['img_url'] . "' alt='Product image' style='width: 250px; height: 250px;' />";
    echo "<p>" . $row['Product_Description'] . "</p>";
    echo "<p>Price: $" . $row['Price'] . "</p>";
    echo "<p>Quantity: " . $row['Quantity'] . "</p>";
    echo "<button onclick='addToCart(" . (int) $row['Product_ID'] . ")'>Add to Cart</button>";
    echo "<form action='dashboard.php'>
    <input type='submit' value='go back to homepage'></form>";
}

// Display pagination links
$total_pages = ceil($total_items / $items_per_page);
echo "<div class='pagination'>";

if ($page > 1) {
    echo "<a href='?page=" . ($page - 1) . "&search=$search_query'>Prev</a>";
}

for ($i = 1; $i <= $total_pages; $i++) {
    if ($i == $page) {
        echo "<span>" . $i . "</span>";
    } else {
        echo "<a href='?page=$i&search=$search_query'>$i</a>";
    }
}

if ($page < $total_pages) {
    echo "<a href='?page=" . ($page + 1) . "&search=$search_query'>Next</a>";

    include("db_close.php");
}


echo "</div>";



?>

<form action="" method="get">
    <input type="text" name="search" value="<?php echo $search_query; ?>" />
    <button type="submit">Search</button>
</form>

