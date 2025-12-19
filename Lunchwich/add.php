<?php
session_start();

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

if (isset($_POST['submit'])) {                        
    $errorlist = [];

    if ($_POST['name'] === "") {
        array_push($errorlist, "Missing name");
    }
    if ($_POST['description'] === "") {
        array_push($errorlist, "Missing description");
    }
    if ($_POST['ingred'] === "") {
        array_push($errorlist, "Select at least 1 ingredient");
    }

    if ($_POST['name'] !== "" && $_POST['description'] !== "" && $_POST['ingred'] !== "") {
        $descript = $_POST['description'];
        $name = $_POST['name'];
        $author = $_SESSION['username'];
        $txt = "INSERT INTO `recipes` (`name`, `summary`, `author`) VALUES ('$name', '$descript', '$author')";
        $stmt = $pdo->prepare($txt);
        $stmt->execute();

        $stmt = $pdo->query('SELECT MAX(id) FROM recipes;');

        while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $current = $row['MAX(id)'];
            $import = explode(",", $_POST["ingred"]);
            $amount = count($import);
            foreach ($import as $im) {
                $imp = "INSERT INTO recipes_ingredient (recipe_id, ingredient_id, length) VALUES ($current, $im, $amount);";
                $stmt = $pdo->query($imp);
            }
        }

        header("Location: index.php");
        exit;
    } else {
        $er = implode(", ", $errorlist);
        echo "<script type='text/javascript'>alert('$er');</script>";
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <img class="home" id="hom" src="home.png">

    <div class="fullform">
    <form method="post"> 
        <input type="hidden" id="hidden" name="ingred" value="">
        <label for="name">Recipe name: </label>
        <input type="text" id="name" name="name">
        <label for="description">Recipe description: </label>
        <textarea id="description" name="description"></textarea>
        <p>Recipe ingredients:</p>

        <div class="contadd">
        <?php
        for ($a = 1; $a < 40; $a++) {
            echo "<div class='textboxadd '>";
            echo "<div class='falseadd' id='$a'> <img class='in addimg' src='images/$a.png'>  </div>";
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
        <br>
        <input type="submit" name="submit" id="addbutton" value="Add recipe">
    </form>
    </div>
    <script src="add.js"> </script>
</body>
</html>
