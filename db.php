<?php
$servername = "sql104.infinityfree.com";
$username = "if0_36882451";
$password = "NDj6rAt4uFFAvM";
$dbname = "if0_36882451_product_db";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
