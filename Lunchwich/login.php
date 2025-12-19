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
        <h3>Login</h3>
        <label for="user">Username: </label>
        <input type="text" id="username" name="user">
        <label for="pass">Password: </label>
        <input type="password" id="password" name="pass">
        <input type="submit" name="submit" value="Login">
        <a href="http://localhost/register.php">Register</a>
    </form>

    <?php 

            $dbhost = "localhost";
            $dbname = "recipebook";
            $dbuser = "bit_academy";
            $dbpass = "bit_academy";
            $pdo = new PDO("mysql:host=$dbhost;dbname=$dbname;charset=utf8mb4", $dbuser, $dbpass);

            $stmt = $pdo->prepare('SELECT * FROM `users` WHERE username = :us');
            $stmt->bindParam(':us', $_POST["user"], PDO::PARAM_STR);

            $stmt->execute();

            $result = $stmt->fetch(PDO::FETCH_ASSOC);

        if (isset($_POST["submit"])) {
        if (isset($result['username']) == 1) {
            if ($_POST['pass'] == $result['password']) {
                session_start();
                $_SESSION["loggedInUser"] = $result['id'];
                $_SESSION["username"] = $result['username'];
                header("Location: index.php");
            } else {
                echo "<h3>Wrong password!</h2>";
            }
        } else {
            echo "<h3>User not found!</h2>";
        }
    }
?>
</div>
    </body>