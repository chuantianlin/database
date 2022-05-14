CREATE DATABASE IF NOT EXISTS `games_store`;

USE `games_store`;

CREATE TABLE `products` (
	`product_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50),
    `desc` VARCHAR(100) NOT NULL,
    `price` DECIMAL(5,2)
);

CREATE TABLE `consoles` (
	`console_id` INT PRIMARY KEY,
    `name` VARCHAR (50) NOT NULL,
    `capacity` VARCHAR (50),
    FOREIGN KEY (`console_id`) REFERENCES `products`(`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `games` (
	`game_id` INT PRIMARY KEY,
    `name` VARCHAR (50),
    `publisher` VARCHAR (50),
    `genre` VARCHAR (50),
    `console` INT,
    FOREIGN KEY (`game_id`) REFERENCES `products`(`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (`console`) REFERENCES `consoles`(`console_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE  `customers` (
	`customer_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50),
    `email` varchar (50)
);

CREATE TABLE `purchases` (
	`purchase_id` INT PRIMARY KEY AUTO_INCREMENT,
    `purchase_date` DATE,
    `product` INT,
    `customer` INT,
    `order_status` VARCHAR (50),
    FOREIGN KEY (`product`) REFERENCES `products`(`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`customer`) REFERENCES `customers`(`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `inventory` (
	`product_id` INT PRIMARY KEY,
    `count` INT,
	FOREIGN KEY (`product_id`) REFERENCES `products`(`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT CHECK(count>0)
);

