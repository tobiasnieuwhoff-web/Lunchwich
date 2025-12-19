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

    <?php
    session_start();

    $_SESSION['filter'] = 0;

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

    $_SESSION["list1"] = $_GET["ids"];
    ?>
    <div class="cont2">
        <div class="side">
            <h1 class="h1two">Selected ingredients</h1>
            <table>
                <?php
                $ingarray = explode(",", $_GET["ids"]);
                foreach ($ingarray as $i) {
                    $stmt = $pdo->prepare("SELECT * FROM `ingredients` WHERE id = :input");
                    $stmt->bindParam(':input', $i, PDO::PARAM_INT);
                    $stmt->execute();
                    $row = $stmt->fetch(PDO::FETCH_ASSOC);
                    if ($row) {
                        $p = $row["name"];
                        echo "<tr><td>$p</td> <td><img class='in chosenimg' src='images/$i.png'></td></tr>";
                    }
                }
                ?>
            </table>


        </div>
        <div class="test">
            <h1 class="h1two">Selected ingredients</h1>
            <div class="cont">
                <?php
                for ($a = 32; $a < 39; $a++) {
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
        </div>

    <button id="lastpage">Next step</button>

        <script src="scriptpagetwo.js"></script>

</body>