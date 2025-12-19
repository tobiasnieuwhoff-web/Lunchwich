<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <div class=login>
        <form class="sort" method="post">
            <h3>Register</h3>
            <label for="user">Username: </label>
            <input type="text" id="username" name="user">
            <label for="pass">Enter a strong password: </label>
            <input type="text" id="password" name="pass">
            <input type="submit" name="submit" value="Login">
        </form>

        <?php

        $dbhost = "localhost";
        $dbname = "recipebook";
        $dbuser = "bit_academy";
        $dbpass = "bit_academy";
        $pdo = new PDO("mysql:host=$dbhost;dbname=$dbname;charset=utf8mb4", $dbuser, $dbpass);

        if (isset($_POST["submit"])) {
            if ($_POST['user'] != "") {
                if ($_POST['pass'] != "") {
                    $u = $_POST['user'];
                    $p = $_POST['pass'];
                    session_start();
                    $txt = "INSERT INTO `users` (`username`, `password`) VALUES ('$u', '$p')";
                    $stmt = $pdo->prepare($txt);
                    $stmt->execute();
                    header("Location: login.php");
                } else {
                    echo "<h3>Enter a password!</h2>";
                }
            } else {
                echo "<h3>Enter a username!</h2>";
            }
        }


        ?>
    </div>
</body>