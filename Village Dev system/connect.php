<?php

$db_name = 'mysql:host=localhost;dbname=village_dev_db';
$user_name = 'root';
$user_password = '';

try {
    // Create a PDO instance and set error mode to exception
    $conn = new PDO($db_name, $user_name, $user_password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Connected successfully"; 
} catch (PDOException $e) {
    // Handle connection error
    echo "Connection failed: " . $e->getMessage();
}

?>
