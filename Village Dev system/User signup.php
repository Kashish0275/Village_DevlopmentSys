<?php
include 'connect.php'; // Include the database connection file

session_start(); // Start the session

// Enable error reporting
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Initialize message array
$message = [];

// Check if user is already logged in
if (isset($_SESSION['user_id'])) {
    header('Location: User login.php'); // Redirect to home if logged in
    exit();
}

// Process form submission
if (isset($_POST['submit'])) {
    // Sanitize and validate inputs
    $full_name = filter_var(trim($_POST['full_name']), FILTER_SANITIZE_STRING);
    $email_address = filter_var(trim($_POST['email_address']), FILTER_SANITIZE_EMAIL);
    $password = filter_var(trim($_POST['password']), FILTER_SANITIZE_STRING);
    $address = filter_var(trim($_POST['address']), FILTER_SANITIZE_STRING);
    $phone_number = filter_var(trim($_POST['phone_number']), FILTER_SANITIZE_STRING);

    // Validate email address
    if (!filter_var($email_address, FILTER_VALIDATE_EMAIL)) {
        $message[] = 'Invalid email format!';
    } else {
        // Hash the password
        $hashed_password = sha1($password);

        // Check if email already exists in the database
        $select_user = $conn->prepare("SELECT * FROM users WHERE email_address = ?");
        $select_user->execute([$email_address]);
        
        if ($select_user->rowCount() > 0) {
            $message[] = 'Email already exists!';
        } else {
            // Insert new user into the database
            $insert_user = $conn->prepare("INSERT INTO users (full_name, email_address, password, address, phone_number) VALUES (?, ?, ?, ?, ?)");
            $insert_user->execute([$full_name, $email_address, $hashed_password, $address, $phone_number]);
            
            // Redirect to login page after successful registration
            header('Location: User login.php'); // Change this to your actual login page
            exit();
        }
    }   
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Sign Up</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: orangered;
            background-color: #f0f0f0; /* Optional background color */
        }
        .container {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            width: 300px;
            text-align: center;
        }
        h1 {
            color: #e3eee3;
            font-weight: 700;
            font-size: 28px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ddd;
            background-color: #fff;
            color: #333;
            border-radius: 4px;
            font-size: 16px;
        }
        .form-group button {
            width: 100%;
            padding: 10px;
            background-color: #e67e22;
            border: none;
            color: white;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
        }
        .form-group button:hover {
            background-color: #d35400;
        }
        .message {
            color: white;
            margin-bottom: 15px;
        }
        .login-link {
            margin-top: 10px;
            color: #e67e22;
            text-decoration: none;
        }
        .login-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Sign Up</h1>
        
        <!-- Display messages -->
        <?php if (!empty($message)) : ?>
            <div class="message">
                <?php foreach ($message as $msg) : ?>
                    <p><?php echo htmlspecialchars($msg); ?></p>
                <?php endforeach; ?>
            </div>
        <?php endif; ?>

        <form action="" method="post">
            <div class="form-group">
                <input type="text" name="full_name" placeholder="Full Name" required>
            </div>
            <div class="form-group">
                <input type="email" name="email_address" placeholder="Email Address" required>
            </div>
            <div class="form-group">
                <input type="password" name="password" placeholder="Password" required>
            </div>
            <div class="form-group">
                <input type="text" name="address" placeholder="Address" required>
            </div>
            <div class="form-group">
                <input type="tel" name="phone_number" placeholder="Phone Number" required>
            </div>
            <div class="form-group">
                <button type="submit" name="submit">Sign Up</button>
            </div>
        </form>
        <a class="login-link" href="User login.php">Already have an account? Login here</a>
    </div>
</body>
</html>
