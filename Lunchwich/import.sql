DROP DATABASE IF EXISTS `recipebook`;
CREATE DATABASE `recipebook`;
USE `recipebook`;

CREATE TABLE `recipes` (
    id MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    summary TEXT NOT NULL,
    author VARCHAR(100) NOT NULL

);

CREATE TABLE `ingredients` (
    id MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE `recipes_ingredient` (
    recipe_id MEDIUMINT NOT NULL,
    ingredient_id MEDIUMINT NOT NULL,
    FOREIGN KEY (recipe_id) REFERENCES recipes(id),
    FOREIGN KEY (ingredient_id) REFERENCES ingredients(id)
);

CREATE TABLE `users` (
	id MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL
    );

INSERT INTO `users` (`username`, `password`) VALUES ('Coolname', 'Securepassword123');

INSERT INTO `recipes` (`name`, `summary`, `author`) VALUES
('Smoky Turkey Melt', 'Warm sandwich with turkey, cheddar, smoky spices and toasted bread', 'ChatGpt'),
('Crispy Chicken Crunch', 'Chicken, lettuce, cucumber and tangy mayo on wheat', 'ChatGpt'),
('Mediterranean Tuna Roll', 'Tuna, olives, tomato and herbs wrapped in soft tortilla', 'ChatGpt'),
('Bacon Sunrise Stack', 'Bacon, egg, tomato and cheese on toasted sourdough', 'ChatGpt'),
('Avocado Herb Delight', 'Avocado, basil, tomato and olive oil on whole wheat', 'ChatGpt'),
('Ham Pesto Ciabatta', 'Ham with mozzarella, pesto and tomato in ciabatta', 'ChatGpt'),
('Triple Cheese Grill', 'Melted mozzarella, Swiss and cheddar on crisped bread', 'ChatGpt'),
('Turkey Pickle Cruncher', 'Turkey, pickles and mustard on rye with lettuce', 'ChatGpt'),
('Chicken Paprika Melt', 'Chicken, paprika seasoning, tomato, cheese on ciabatta', 'ChatGpt'),
('Tuna Garden Fresh', 'Tuna, cucumber, tomato and lettuce with light mayo', 'ChatGpt'),
('Bacon Pepper Jack Bite', 'Bacon and cheese with fresh pepper slices on wheat', 'chatGpt'),
('Avocado Egg Supreme', 'Avocado, egg, tomato and onion on rye', 'ChatGpt'),
('Ham Garlic Butter Stack', 'Ham spread with garlic butter and tomato on baguette', 'ChatGpt'),
('Chicken Basil Fusion', 'Chicken, basil, mozzarella and tomato on soft bread', 'ChatGpt'),
('Turkey Olive Medley', 'Turkey, olives, tomato, cucumber and oregano', 'ChatGpt'),
('Tuna Honey Crunch', 'Tuna, honey mustard, onion and pickles on baguette', 'ChatGpt'),
('Bacon Cucumber Slice', 'Bacon, cucumber, lettuce and Swiss cheese', 'ChatGpt'),
('Avocado Ranch Melt', 'Avocado, ranch-style dressing, tomato and lettuce', 'ChatGpt'),
('Ham Rustic Roll', 'Ham, butter and pepper on crusty sourdough', 'ChatGpt'),
('Chicken Deluxe Toast', 'Chicken, mozzarella, lettuce, tomato, egg and mayo', 'ChatGpt'),
('Turkey Sweet Pepper', 'Turkey, bell pepper, cheddar and mustard on wheat', 'ChatGpt'),
('Tuna Basil Olive', 'Tuna with basil, olives and tomato on rye', 'ChatGpt'),
('Bacon Onion Crunch', 'Bacon, onion, lettuce and ketchup on whole wheat', 'ChatGpt'),
('Avocado Pickle Snap', 'Avocado, pickles, tomato and mayo on soft bread', 'ChatGpt'),
('Ham Tomato Classic', 'Ham, tomato, lettuce and butter on wheat', 'ChatGpt'),
('Chicken Pesto Pepper', 'Chicken, pesto, bell pepper, mozzarella on rye', 'ChatGpt'),
('Turkey Garden Club', 'Turkey, lettuce, cucumber, tomato and mayo', 'ChatGpt'),
('Tuna Zesty Melt', 'Tuna, mustard, olives and tomato on ciabatta', 'ChatGpt'),
('Bacon Triple Stack', 'Bacon, tomato, lettuce, egg and Swiss', 'ChatGpt'),
('Avocado Olive Crunch', 'Avocado, olives, tomato and herb spread', 'ChatGpt'),
('Ham Egg Morning Melt', 'Ham, egg, onion and cheese pressed on wheat', 'ChatGpt'),
('Chicken Honey Dijon', 'Chicken with honey mustard, lettuce and tomato', 'ChatGpt'),
('Turkey Basil Tomato', 'Turkey, basil, tomato and butter on baguette', 'ChatGpt'),
('Tuna Pepper Jack Twist', 'Tuna, pepper, tomato and cheddar', 'ChatGpt'),
('Bacon Avocado Roll', 'Bacon, avocado, tomato and mayo in a tortilla', 'ChatGpt'),
('Green Garden Veg Melt', 'Avocado, cucumber, pepper, lettuce on sourdough', 'ChatGpt'),
('Ham Mozzarella Toast', 'Ham and mozzarella toasted on ciabatta', 'ChatGpt'),
('Chicken Pickle Cruncher', 'Chicken, pickles, mustard, lettuce and tomato', 'ChatGpt'),
('Turkey Spicy Melt', 'Turkey with pepper flakes, cheese and onion', 'ChatGpt'),
('Tuna Egg Fresh', 'Tuna, egg, tomato and olives on baguette', 'ChatGpt'),
('Bacon Ranch Pepper', 'Bacon, ranch spread, tomato and bell pepper', 'ChatGpt'),
('Avocado Basil Cream', 'Avocado, basil, tomato and creamy dressing', 'ChatGpt'),
('Ham Swiss Deluxe', 'Ham, Swiss, lettuce and buttered bread', 'ChatGpt'),
('Chicken Olive Medallion', 'Chicken, olives, cucumber and tomato', 'ChatGpt'),
('Turkey Mozzarella Roll', 'Turkey, mozzarella, pepper and lettuce', 'ChatGpt'),
('Tuna Garlic Crunch', 'Tuna, garlic spread, tomato and onion', 'ChatGpt'),
('Bacon Mustard Clasp', 'Bacon, mustard, lettuce and tomato', 'ChatGpt'),
('Avocado Cheddar Grill', 'Avocado, cheddar, tomato and onion', 'ChatGpt'),
('Ham Pesto Zing', 'Ham, pesto, tomato and lettuce', 'ChatGpt'),
('Chicken Pepper Egg Melt', 'Chicken, egg, pepper and mozzarella on wheat', 'ChatGpt');

INSERT INTO `ingredients` (`name`) VALUES
('Ham'),
('Chicken'),
('Turkey'),
('Tuna'),
('Bacon'),
('Mozzarella'),
('Swiss cheese'),
('Cheddar'),
('Paprika'),
('Olives'),
('Lettuce'),
('Tomato'),
('Onion'),
('Cucumber'),
('Bell pepper'),
('Avocado'),
('Pickles'),
('Mayonnaise'),
('Mustard'),
('Ketchup'),
('Honey mustard'),
('Pesto'),
('Hummus'),
('Butter'),
('Salt'),
('Pepper'),
('Oregano'),
('Basil'),
('Garlic spread'),
('Olive tapenade'),
('Egg'),
('Any bread'),
('Baguette'),
('Ciabatta'),
('Sourdough'),
('Bagel'),
('Tortilla'),
('Toaster'),
('Sandwich Iron');

INSERT INTO recipes_ingredient (recipe_id, ingredient_id) VALUES
(1,3),(1,8),(1,25),(1,26),(1,32),
(2,2),(2,11),(2,14),(2,18),(2,32),
(3,4),(3,10),(3,12),(3,27),(3,36),
(4,5),(4,31),(4,12),(4,7),(4,20),(4,32),
(5,16),(5,28),(5,12),(5,26),(5,32),
(6,1),(6,6),(6,22),(6,12),(6,34),
(7,6),(7,7),(7,8),(7,32),
(8,3),(8,17),(8,19),(8,11),(8,32),
(9,2),(9,9),(9,12),(9,6),(9,35),
(10,4),(10,14),(10,12),(10,18),(10,32),
(11,5),(11,7),(11,15),(11,12),(11,32),
(12,16),(12,31),(12,12),(12,13),(12,32),
(13,1),(13,29),(13,12),(13,33),(13,34),
(14,2),(14,28),(14,6),(14,12),(14,32),
(15,3),(15,10),(15,12),(15,27),(15,11),(15,32),
(16,4),(16,21),(16,13),(16,17),(16,32),
(17,5),(17,14),(17,11),(17,12),(17,20),(17,32),
(18,16),(18,18),(18,11),(18,12),(18,32),
(19,1),(19,24),(19,25),(19,26),(19,36),
(20,2),(20,6),(20,11),(20,12),(20,31),(20,18),(20,32),
(21,3),(21,15),(21,8),(21,19),(21,11),(21,32),
(22,4),(22,27),(22,12),(22,10),(22,32),
(23,5),(23,13),(23,11),(23,20),(23,32),
(24,16),(24,17),(24,12),(24,18),(24,32),
(25,1),(25,12),(25,11),(25,24),(25,32),
(26,2),(26,22),(26,15),(26,6),(26,32),
(27,3),(27,11),(27,12),(27,18),(27,14),(27,32),
(28,4),(28,19),(28,10),(28,12),(28,32),
(29,5),(29,31),(29,7),(29,11),(29,12),(29,32),
(30,16),(30,10),(30,12),(30,22),(30,32),
(31,1),(31,31),(31,13),(31,6),(31,32),
(32,2),(32,21),(32,12),(32,11),(32,32),
(33,3),(33,28),(33,12),(33,24),(33,33),(33,32),
(34,4),(34,15),(34,8),(34,12),(34,32),
(35,5),(35,16),(35,18),(35,32),
(36,16),(36,14),(36,15),(36,11),(36,34),(36,32),
(37,1),(37,6),(37,32),(37,34),
(38,2),(38,17),(38,19),(38,11),(38,32),
(39,3),(39,10),(39,12),(39,11),(39,32),
(40,4),(40,29),(40,12),(40,13),(40,17),(40,32),
(41,5),(41,19),(41,15),(41,12),(41,32),
(42,16),(42,28),(42,12),(42,18),(42,32),
(43,1),(43,7),(43,11),(43,12),(43,24),(43,32),
(44,2),(44,10),(44,14),(44,11),(44,32),
(45,3),(45,6),(45,15),(45,11),(45,17),(45,32),
(46,4),(46,29),(46,12),(46,13),(46,32),
(47,5),(47,19),(47,11),(47,12),(47,32),
(48,16),(48,8),(48,12),(48,13),(48,32),
(49,1),(49,22),(49,12),(49,11),(49,32),
(50,2),(50,31),(50,15),(50,6),(50,12),(50,32);

DELETE FROM recipes_ingredient
WHERE ingredient_id = 32
AND recipe_id IN (
    SELECT recipe_id
    FROM (
        SELECT recipe_id
        FROM recipes_ingredient
        WHERE ingredient_id IN (33, 34, 35, 36, 37)
    ) AS bread_recipes
);

ALTER TABLE `recipes_ingredient`
ADD COLUMN `length` INT DEFAULT 0;

UPDATE `recipes_ingredient` ri
JOIN (
    SELECT recipe_id, COUNT(*) AS ingredient_count
    FROM `recipes_ingredient`
    GROUP BY recipe_id
) counts ON ri.recipe_id = counts.recipe_id
SET ri.length = counts.ingredient_count;



-- recepten genereerd door ChatGpt:
UPDATE `recipes` SET `summary` = 'Assemble turkey with cheddar and smoky spices, then toast until warm and melty' WHERE `name` = 'Smoky Turkey Melt';
UPDATE `recipes` SET `summary` = 'Layer crispy chicken with lettuce, cucumber and tangy mayo, then serve on toasted bread' WHERE `name` = 'Crispy Chicken Crunch';
UPDATE `recipes` SET `summary` = 'Mix tuna with olives, tomato and herbs, wrap tightly in a soft tortilla' WHERE `name` = 'Mediterranean Tuna Roll';
UPDATE `recipes` SET `summary` = 'Stack bacon, egg, tomato and cheese, then grill until melted and golden' WHERE `name` = 'Bacon Sunrise Stack';
UPDATE `recipes` SET `summary` = 'Spread avocado with basil and tomato, drizzle olive oil and serve' WHERE `name` = 'Avocado Herb Delight';
UPDATE `recipes` SET `summary` = 'Layer ham, mozzarella, pesto and tomato inside soft bread, toast until warm' WHERE `name` = 'Ham Pesto Ciabatta';
UPDATE `recipes` SET `summary` = 'Pile three cheeses together and grill until melted and golden' WHERE `name` = 'Triple Cheese Grill';
UPDATE `recipes` SET `summary` = 'Combine turkey, pickles, mustard and lettuce, then toast lightly' WHERE `name` = 'Turkey Pickle Cruncher';
UPDATE `recipes` SET `summary` = 'Season chicken with paprika, add tomato and cheese, then toast until melted' WHERE `name` = 'Chicken Paprika Melt';
UPDATE `recipes` SET `summary` = 'Mix tuna with cucumber, tomato and lettuce, lightly dress with mayo' WHERE `name` = 'Tuna Garden Fresh';
UPDATE `recipes` SET `summary` = 'Layer bacon with pepper jack and fresh pepper slices, grill until melty' WHERE `name` = 'Bacon Pepper Jack Bite';
UPDATE `recipes` SET `summary` = 'Top avocado with a cooked egg, tomato and onion, serve warm' WHERE `name` = 'Avocado Egg Supreme';
UPDATE `recipes` SET `summary` = 'Spread garlic butter on ham with tomato and grill lightly' WHERE `name` = 'Ham Garlic Butter Stack';
UPDATE `recipes` SET `summary` = 'Combine chicken with basil, mozzarella and tomato, then toast until warm' WHERE `name` = 'Chicken Basil Fusion';
UPDATE `recipes` SET `summary` = 'Layer turkey with olives, tomato, cucumber and oregano, then serve' WHERE `name` = 'Turkey Olive Medley';
UPDATE `recipes` SET `summary` = 'Mix tuna with honey mustard, onion and pickles, then toast lightly' WHERE `name` = 'Tuna Honey Crunch';
UPDATE `recipes` SET `summary` = 'Layer bacon, cucumber, lettuce and Swiss, then toast until cheese melts' WHERE `name` = 'Bacon Cucumber Slice';
UPDATE `recipes` SET `summary` = 'Spread avocado with ranch dressing, tomato and lettuce for a fresh melt' WHERE `name` = 'Avocado Ranch Melt';
UPDATE `recipes` SET `summary` = 'Top ham with butter and pepper, serve warm on soft bread' WHERE `name` = 'Ham Rustic Roll';
UPDATE `recipes` SET `summary` = 'Layer chicken, mozzarella, lettuce, tomato, egg and mayo, then toast' WHERE `name` = 'Chicken Deluxe Toast';
UPDATE `recipes` SET `summary` = 'Add turkey, bell pepper, cheddar and mustard, then toast until warm' WHERE `name` = 'Turkey Sweet Pepper';
UPDATE `recipes` SET `summary` = 'Mix tuna with basil, olives and tomato, then toast lightly' WHERE `name` = 'Tuna Basil Olive';
UPDATE `recipes` SET `summary` = 'Combine bacon, onion, lettuce and ketchup, then serve warm' WHERE `name` = 'Bacon Onion Crunch';
UPDATE `recipes` SET `summary` = 'Top avocado with pickles, tomato and mayo, serve warm' WHERE `name` = 'Avocado Pickle Snap';
UPDATE `recipes` SET `summary` = 'Stack ham, tomato, lettuce and butter, then toast lightly' WHERE `name` = 'Ham Tomato Classic';
UPDATE `recipes` SET `summary` = 'Layer chicken with pesto, bell pepper and mozzarella, then toast' WHERE `name` = 'Chicken Pesto Pepper';
UPDATE `recipes` SET `summary` = 'Combine turkey with lettuce, cucumber, tomato and mayo, then serve' WHERE `name` = 'Turkey Garden Club';
UPDATE `recipes` SET `summary` = 'Mix tuna with mustard, olives and tomato, toast until warm' WHERE `name` = 'Tuna Zesty Melt';
UPDATE `recipes` SET `summary` = 'Stack bacon, tomato, lettuce, egg and Swiss cheese, then serve warm' WHERE `name` = 'Bacon Triple Stack';
UPDATE `recipes` SET `summary` = 'Top avocado with olives, tomato and herb spread, serve immediately' WHERE `name` = 'Avocado Olive Crunch';
UPDATE `recipes` SET `summary` = 'Press ham, egg, onion and cheese together, toast until warm' WHERE `name` = 'Ham Egg Morning Melt';
UPDATE `recipes` SET `summary` = 'Combine chicken with honey mustard, lettuce and tomato, then serve' WHERE `name` = 'Chicken Honey Dijon';
UPDATE `recipes` SET `summary` = 'Layer turkey with basil, tomato and butter, then serve warm' WHERE `name` = 'Turkey Basil Tomato';
UPDATE `recipes` SET `summary` = 'Mix tuna with pepper, tomato and cheddar, then toast lightly' WHERE `name` = 'Tuna Pepper Jack Twist';
UPDATE `recipes` SET `summary` = 'Roll bacon, avocado, tomato and mayo inside a tortilla' WHERE `name` = 'Bacon Avocado Roll';
UPDATE `recipes` SET `summary` = 'Top with avocado, cucumber, pepper and lettuce, then grill until warm' WHERE `name` = 'Green Garden Veg Melt';
UPDATE `recipes` SET `summary` = 'Layer ham and mozzarella, then toast until cheese melts' WHERE `name` = 'Ham Mozzarella Toast';
UPDATE `recipes` SET `summary` = 'Combine chicken with pickles, mustard, lettuce and tomato, then serve' WHERE `name` = 'Chicken Pickle Cruncher';
UPDATE `recipes` SET `summary` = 'Add turkey with pepper flakes, cheese and onion, then toast until warm' WHERE `name` = 'Turkey Spicy Melt';
UPDATE `recipes` SET `summary` = 'Mix tuna with egg, tomato and olives, then toast lightly' WHERE `name` = 'Tuna Egg Fresh';
UPDATE `recipes` SET `summary` = 'Layer bacon with ranch spread, tomato and bell pepper, then serve warm' WHERE `name` = 'Bacon Ranch Pepper';
UPDATE `recipes` SET `summary` = 'Spread avocado with basil, tomato and creamy dressing, serve fresh' WHERE `name` = 'Avocado Basil Cream';
UPDATE `recipes` SET `summary` = 'Layer ham, Swiss and lettuce, then toast lightly with butter' WHERE `name` = 'Ham Swiss Deluxe';
UPDATE `recipes` SET `summary` = 'Combine chicken with olives, cucumber and tomato, then serve' WHERE `name` = 'Chicken Olive Medallion';
UPDATE `recipes` SET `summary` = 'Roll turkey with mozzarella, pepper and lettuce inside soft bread' WHERE `name` = 'Turkey Mozzarella Roll';
UPDATE `recipes` SET `summary` = 'Mix tuna with garlic spread, tomato and onion, then toast lightly' WHERE `name` = 'Tuna Garlic Crunch';
UPDATE `recipes` SET `summary` = 'Layer bacon with mustard and tomato, serve warm' WHERE `name` = 'Bacon Mustard Clasp';
UPDATE `recipes` SET `summary` = 'Grill avocado with cheddar, tomato and onion until cheese melts' WHERE `name` = 'Avocado Cheddar Grill';
UPDATE `recipes` SET `summary` = 'Layer ham with pesto, tomato and lettuce, then toast lightly' WHERE `name` = 'Ham Pesto Zing';
UPDATE `recipes` SET `summary` = 'Combine chicken with egg, pepper and mozzarella, then toast until warm' WHERE `name` = 'Chicken Pepper Egg Melt';




