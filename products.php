<?php
include 'db.php';

// Retrieve filter parameters from URL query string
$price_min = isset($_GET['min_price']) && $_GET['min_price'] !== '' ? (float)$_GET['min_price'] : null;
$price_max = isset($_GET['max_price']) && $_GET['max_price'] !== '' ? (float)$_GET['max_price'] : null;
$category = isset($_GET['category']) ? $_GET['category'] : null;
$sale_status = isset($_GET['sale_status']) ? $_GET['sale_status'] : null;
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
$products_per_page = 12;
$offset = ($page - 1) * $products_per_page;

// Start building the SQL query
$sql = "SELECT * FROM products WHERE 1=1";

// Add conditions based on filter parameters
if ($price_min !== null) {
    $sql .= " AND price >= " . (float)$price_min;
}
if ($price_max !== null) {
    $sql .= " AND price <= " . (float)$price_max;
}
if ($category) {
    $sql .= " AND category = '$category'";
}
if ($sale_status) {
    $sql .= " AND sale_status = '$sale_status'";
}

// Add pagination limit and offset
$sql .= " LIMIT $products_per_page OFFSET $offset";

// Execute the query
$result = $conn->query($sql);

// Fetch products into an array
$products = [];
while ($row = $result->fetch_assoc()) {
    $products[] = $row;
}

// Calculate total number of products for pagination
$total_sql = "SELECT COUNT(*) as total FROM products WHERE 1=1";
if ($price_min !== null) {
    $total_sql .= " AND price >= " . (float)$price_min;
}
if ($price_max !== null) {
    $total_sql .= " AND price <= " . (float)$price_max;
}
if ($category) {
    $total_sql .= " AND category = '$category'";
}
if ($sale_status) {
    $total_sql .= " AND sale_status = '$sale_status'";
}

// Execute total count query
$total_result = $conn->query($total_sql);
$total_row = $total_result->fetch_assoc();
$total_products = $total_row['total'];

// Prepare JSON response
$response = [
    'products' => $products,
    'total_products' => $total_products,
    'current_page' => $page,
    'products_per_page' => $products_per_page
];

// Set response headers and send JSON data
header('Content-Type: application/json');
echo json_encode($response);
?>
