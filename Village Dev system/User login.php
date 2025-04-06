<?php
include 'connect.php'; // Include the database connection file

session_start(); // Start the session

// Initialize message array
$message = [];

// Check if user is already logged in
if (isset($_SESSION['user_id'])) {
    header('Location: home page2.php'); // Redirect to home if logged in
    exit();
}

// Process form submission
if (isset($_POST['submit'])) {
    // Sanitize and validate inputs
    $full_name = filter_var(trim($_POST['full_name']), FILTER_SANITIZE_STRING);
    $password = filter_var(trim($_POST['password']), FILTER_SANITIZE_STRING);

    // Hash the password
    $hashed_password = sha1($password);

    // Prepare and execute the query to check credentials
    $select_user = $conn->prepare("SELECT * FROM users WHERE full_name = ? AND password = ?");
    $select_user->execute([$full_name, $hashed_password]);
    $row = $select_user->fetch(PDO::FETCH_ASSOC);

    if ($select_user->rowCount() > 0) {
        $_SESSION['user_id'] = $row['user_id']; // Store user ID in session
        header('Location: home page2.html'); // Redirect to home page after successful login
        exit();
    } else {
        $message[] = 'Incorrect username or password!'; // Error message
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User - Login</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: orangered;
            overflow: hidden;
        }

        /* Video background styling */
        .video-bg {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            object-fit: cover;
        }

        /* Login container styling */
        .login-container {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            width: 300px;
            text-align: center;
            z-index: 1;
        }

        .login-container h1 {
            margin-bottom: 20px;
            color: #e3eee3;
            font-weight: 700;
            font-size: 28px;
        }

        .login-container input {
            width: calc(100% - 22px);
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
            background-color: #fff;
            color: #333;
        }

        .login-container button {
            width: 100%;
            padding: 10px;
            background-color: #e67e22;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .login-container button:hover {
            background-color: #d35400;
        }

        .login-container a {
            display: block;
            margin-top: 10px;
            color: #e67e22;
            text-decoration: none;
        }

        .login-container a:hover {
            text-decoration: underline;
        }

        .message {
            color: #ff4d4d; /* Error message color */
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <!-- Background video -->
    <video class="video-bg" src="User video.mp4" autoplay loop muted></video>

    <!-- Login form container -->
    <div class="login-container">
        <h1>User Login</h1>

        <!-- Display error messages -->
        <?php if (!empty($message)) : ?>
            <div class="message">
                <?php foreach ($message as $msg) : ?>
                    <p><?php echo htmlspecialchars($msg); ?></p>
                <?php endforeach; ?>
            </div>
        <?php endif; ?>

        <form action="" method="POST">
            <input type="text" name="full_name" placeholder="Full Name" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit" name="submit">Login</button>
        </form>
        <a href="#">Forgot Password?</a>
        <a href="User signup.php">Don't have an account? Sign up here</a>
    </div>
</body>
</html>
