<?php

// Connect to the database
include("db_connect.php");

$mysqli = new mysqli($db_host, $db_user, $db_pass, $db_name);

if ($mysqli->connect_error) {
  die("Connection failed: " . $mysqli->connect_error);
}

// Define a Product class
class Product
{
    public $id;
    public $description;
    public $name;
    public $img_url;
    public $rating;
    public $price;
    public $quantity;
    public $category_id;
    public $owner_id;

    public function __construct($id, $description, $name, $img_url, $rating, $price, $quantity, $category_id, $owner_id)
    {
        $this->id = $id;
        $this->description = $description;
        $this->name = $name;
        $this->img_url = $img_url;
        $this->rating = $rating;
        $this->price = $price;
        $this->quantity = $quantity;
        $this->category_id = $category_id;
        $this->owner_id = $owner_id;
    }

    public static function all()
    {
        global $mysqli;

        $products = array();

        $result = $mysqli->query("SELECT * FROM product");

        while ($row = $result->fetch_assoc()) {
            $product = new Product(
                $row['Product_ID'],
                $row['Product_Description'],
                $row['Name'],
                $row['img_url'],
                $row['Rating'],
                $row['Price'],
                $row['Quantity'],
                $row['Prod_Cat_ID_FK'],
                $row['OwnerID_FK']
            );
            array_push($products, $product);
        }

        return $products;
    }

    public static function find($product_id)
    {
        global $mysqli;

        $result = $mysqli->query("SELECT * FROM product WHERE Product_ID = $product_id LIMIT 1");

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $product = new Product(
                $row['Product_ID'],
                $row['Product_Description'],
                $row['Name'],
                $row['img_url'],
                $row['Rating'],
                $row['Price'],
                $row['Quantity'],
                $row['Prod_Cat_ID_FK'],
                $row['OwnerID_FK']
            );
            return $product;
        } else {
            return null;
        }
    }

    public static function search($query)
    {
        global $mysqli;

        $products = array();



        $result = $mysqli->query("SELECT * FROM product WHERE Name LIKE '%$query%' OR Product_Description LIKE '%$query%'");

        while ($row = $result->fetch_assoc()) {
            $product = new Product(
                $row['Product_ID'],
                $row['Product_Description'],
                $row['Name'],
                $row['img_url'],
                $row['Rating'],
                $row['Price'],
                $row['Quantity'],
                $row['Prod_Cat_ID_FK'],
                $row['OwnerID_FK']
            );
            array_push($products, $product);
        }

        return $products;
    }

    public function save()
    {
        global $mysqli;

        $product_id = $this->id;
        $description = $mysqli->real_escape_string($this->description);
        $name = $mysqli->real_escape_string($this->name);
        $img_url = $mysqli->real_escape_string($this->img_url);
        $rating = $mysqli->real_escape_string($this->rating);
        $price = $mysqli->real_escape_string($this->price);
        $quantity = $mysqli->real_escape_string($this->quantity);
        $category_id = $mysqli->real_escape_string($this->category_id);
        $owner_id = $mysqli->real_escape_string($this->owner_id);

        if ($product_id == 0) {
            // Insert new record
            $query = "INSERT INTO product (product_Description, Name, img_url, Rating, Price, Quantity, Prod_Cat_ID_FK, OwnerID_FK) VALUES ('$description', '$name', '$img_url', '$rating', '$price', '$quantity', '$category_id', '$owner_id')";
            $mysqli->query($query);
            $this->id = $mysqli->insert_id;
        } else {
            // Update existing record
            $query = "UPDATE product SET Product_Description = '$description', Name = '$name', img_url = '$img_url', Rating = '$rating', Price = '$price', Quantity = '$quantity', Prod_Cat_ID_FK = '$category_id', OwnerID_FK = '$owner_id' WHERE Product_ID = $product_id";
            $mysqli->query($query);
        }
    }

    public function delete()
    {
        global $mysqli;

        $product_id = $this->id;

        $query = "DELETE FROM product WHERE Product_ID = $product_id";
        $mysqli->query($query);
    }
}

