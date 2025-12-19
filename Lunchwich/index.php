<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <?php
    session_start();

    if (isset($_SESSION['loggedInUser'])) {
        echo '
    <form method="post">
        <input class="but" type="submit" name="logout" value="Logout">
        <h3><?php  ?></h3>
    </form> ';
    }
    if (isset($_POST["add"])) {
        if (isset($_SESSION['loggedInUser'])) {
            header("Location: add.php");
        } else {
            header("Location: login.php");
        }
    }
    if (isset($_POST["logout"])) {
        session_destroy();
    }

    $_SESSION["state"] = "red";

    $dbhost = "localhost";
    $dbname = "recipebook";
    $dbuser = "bit_academy";
    $dbpass = "bit_academy";

    try {
        $pdo = new PDO("mysql:host=$dbhost;dbname=$dbname;charset=utf8mb4", $dbuser, $dbpass);
    } catch (PDOException $err) {
        echo "Database error";
        exit();
    }

    ?>
    <div class="bigbox">
            <h1 class="title">Lunchwich</h1>
        <h1 class="h1ind">Select your ingredients</h1>
        <div class="cont">
            <?php
            for ($a = 1; $a < 32; $a++) {
                echo "<div class='textbox'>";
                echo "<div class='false' id='$a'> <img class='in' src='images/$a.png'>  </div>";
                $stmt = $pdo->prepare("SELECT * FROM `ingredients` WHERE id = :id");
                $stmt->bindParam(':id', $a, PDO::PARAM_INT);
                $stmt->execute();
                $row = $stmt->fetch(PDO::FETCH_ASSOC);
                if ($row) {
                    $b = $row['name'];
                    echo "<p>$b<p>";
                }
                echo "</div>";
            }

            ?>
        </div>
        <button id="nextpage" class="but">Next step</button>

        <form method="post">
            <input class="but" type="submit" name="add" value="Add Recipe +">
        </form>
    </div>
    <script src="script.js"></script>
</body>

</html>