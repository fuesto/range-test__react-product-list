<?php
header("Access-Control-Allow-Origin: *"); // Allows requests from any origin
header("Access-Control-Allow-Methods: GET"); // Limits allowed HTTP methods to GET
header("Access-Control-Allow-Headers: Content-Type"); // Allows specific headers
header('Content-Type: application/json');

// Database connection
$host = 'localhost';
$dbname = 'product_db';
$username = 'root';
$password = '';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Pagination logic
    $limit = 20;
    $offset = isset($_GET['page']) ? intval($_GET['page']) * $limit : 0;
    $stmt = $pdo->prepare('SELECT name, price, was_price, reviews, img FROM product LIMIT :limit OFFSET :offset');
    $stmt->bindParam(':limit', $limit, PDO::PARAM_INT);
    $stmt->bindParam(':offset', $offset, PDO::PARAM_INT);
    $stmt->execute();
    $products = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode(['product_arr' => $products]);
} catch (PDOException $e) {
    echo json_encode(['error' => $e->getMessage()]);
}
