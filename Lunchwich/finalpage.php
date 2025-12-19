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
    if (isset($_POST['none'])) {
        $_SESSION['filter'] = 0;
    } else if (isset($_POST['one'])) {
        $_SESSION['filter'] = 1;
    } else if (isset($_POST['two'])) {
        $_SESSION['filter'] = 2;
    }
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
    <div class="cont3">
        <div class="test">
            <h1 class="h1two">Selected ingredients</h1>
            <table>
                <?php
                if ($_GET["ids"] === "") {
                    $merged = $_SESSION["list1"];
                } else {
                    $merged = $_SESSION["list1"] . "," . $_GET["ids"];
                }


                $ingarray = explode(",", $merged);
                $aantalselect = count($ingarray);

                foreach ($ingarray as $i) {
                    $stmt = $pdo->prepare("SELECT * FROM `ingredients` WHERE id = :input");
                    $stmt->bindParam(':input', $i, PDO::PARAM_INT);
                    $stmt->execute();
                    $row = $stmt->fetch(PDO::FETCH_ASSOC);
                    if ($row) {
                        $p = $row["name"];
                        echo "<tr> <td>$p</td> <td><img class='in chosenimg' src='images/$i.png'></td></tr>";
                    }
                }

                ?>
            </table>
        </div>
        <div class="recepten">
            <?php





            $tt = "SELECT * FROM recipes_ingredient WHERE ";
            $tmpholder = [];
            foreach ($ingarray as $itt) {
                $tmpholder[] = "ingredient_id = $itt";
            }
            $tt .= implode(" OR ", $tmpholder);
            $tt .= " GROUP BY recipe_id";
            $stmt = $pdo->prepare($tt);
            $stmt->execute();
            $row6 = $stmt->fetchAll(PDO::FETCH_ASSOC);


            foreach ($row6 as $r) {
                $id = $r['recipe_id'];

                $txt = "SELECT DISTINCT * FROM recipes_ingredient WHERE "; //selecteerd filter 
                $tempholder = [];
                foreach ($ingarray as $it) {
                    $tempholder[] = "ingredient_id LIKE $it";
                }
                $txt .= implode(" OR ", $tempholder);
                $stmt = $pdo->prepare($txt);
                $stmt->execute();
                $row2 = $stmt->fetchAll(PDO::FETCH_ASSOC);

                $stmt = $pdo->prepare("SELECT * FROM `recipes` WHERE id = :input"); //selecteerd recept
                $stmt->bindParam(':input', $id, PDO::PARAM_INT);
                $stmt->execute();
                $row3 = $stmt->fetch(PDO::FETCH_ASSOC);
                $name = $row3['name'];
                $author = $row3['author'];
                $desc = $row3['summary'];
                //--------------------------------------------------------------------
                $stmt = $pdo->prepare("SELECT * FROM `recipes_ingredient` WHERE recipe_id = :input"); // selecteer ingredientreceipt ding
                $stmt->bindParam(':input', $id, PDO::PARAM_INT);
                $stmt->execute();
                $row5 = $stmt->fetchAll(PDO::FETCH_ASSOC);
                //--------------------------------------------------------------------
                $stmt = $pdo->prepare("SELECT * FROM `ingredients` WHERE id = :input"); //selecteerd ingredient
                $stmt->bindParam(':input', $id, PDO::PARAM_INT);
                $stmt->execute();
                $row4 = $stmt->fetchAll(PDO::FETCH_ASSOC);
                //--------------------------------------------------------------------
                $stmt = $pdo->prepare("SELECT ingredient_id FROM `recipes_ingredient` WHERE recipe_id = $id"); // selecteer ingredientreceipt ding
                $stmt->execute();
                $test = $stmt->fetchAll(PDO::FETCH_ASSOC);
                foreach ($ingarray as &$value) {
                    $value = (int)$value;
                }
                $inids = array_column($test, 'ingredient_id');
                $result = array_intersect($ingarray, $inids);


                if (count($result) == $r['length']) {

                    echo "<div class='final good' id='$id' good'><h1>$name</h1><p class='desc'>$desc <br> Author: $author</p><div class='smallcont'>";
                    foreach ($row5 as $r5) {
                        $img = $r5['ingredient_id'];
                        echo " <img class='small' src='images/$img.png'>";
                    };
                    echo "</div> </div>";
                } elseif (count($result) == ($r['length'] - 1) and  $_SESSION['filter'] >= 1) {
                    echo "<div class='final mid' id='$id' mid'><h1>$name</h1><p class='desc'>$desc <br> Author: $author</p><div class='smallcont'>";
                    foreach ($row5 as $r5) {

                        $img = $r5['ingredient_id'];
                        echo " <img class='small' src='images/$img.png'>";
                    };
                    echo "</div> <p class='mis'> Missing 1 ingredient |  Matching: " . count($result) . " ingredients</p></div>";
                } elseif (count($result) == ($r['length'] - 2) and  $_SESSION['filter'] >= 2) {
                    echo "<div class='final bad' id='$id' bad'><h1>$name</h1><p class='desc'>$desc <br> Author: $author</p><div class='smallcont'>";
                    foreach ($row5 as $r5) {

                        $img = $r5['ingredient_id'];
                        echo " <img class='small' src='images/$img.png'>";
                    };
                    echo "</div> <p class='mis'> Missing 2 ingredients |  Matching: " . count($result) . " ingredients</p></div>";
                };
            };



            ?>
        </div>
        <div class="wid">
            <h3>Filter Width</h2>
                <form method="post">
                    <div class="widin">
                        <p>Off by: None</p>
                        <button type="submit" name="none" class="mar1">X</button>
                    </div>
                    <div class="widin2">
                        <p>Off by: 1</p>
                        <button type="submit" name="one" class="mar2">1</button>
                    </div>
                    <div class="widin2">
                        <p>Off by: 2</p>
                        <button type="submit" name="two" class="mar3">2</button>
                    </div>
                    <?php




                    ?>
                </form>
        </div>
    </div>
    <?php
    ?>
    <script src="finalpage.js"></script>
</body>