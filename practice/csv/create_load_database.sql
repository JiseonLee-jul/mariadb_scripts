﻿DROP DATABASE IF EXISTS cafe;

CREATE DATABASE cafe;

USE cafe;

CREATE TABLE `customer` (
	`id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`name` varchar(20) NOT NULL,
	`gender` char(1) NULL,
	`age` int NULL,
	`nickname` int NULL,
	`phone` char(13) NOT NULL,
	`email` varchar(50) NULL
);

CREATE TABLE `orders` (
	`id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`customer_id` int NOT NULL,
	`date_ordered` datetime NULL,
	`total_cnt` int NULL,
	`total_price` int NULL,
	`emp_id` int NOT NULL,
	CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES customer(id),
	CONSTRAINT fk_emp_id FOREIGN KEY (emp_id) REFERENCES emp(id)
);

CREATE TABLE `emp` (
	`id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`name` varchar(20) NULL,
	`start_date` date NULL,
	`salary` int NULL
);

CREATE TABLE `beverage` (
	`id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`name` varchar(30) NULL,
	`category` varchar(20) NULL,
	`price` int NULL
);

CREATE TABLE `orderdetails` (
	`order_id` int NOT NULL,
	`beverage_id` int NOT NULL,
	`beverage_cnt` int NULL,
	CONSTRAINT fk_orders_id FOREIGN KEY (orders_id) REFERENCES orders(id),
	CONSTRAINT fk_beverage_id FOREIGN KEY (beverage_id) REFERENCES beverage(id)	
);



LOAD DATA LOCAL INFILE '/root/repo/mariadb_scripts/practice/csv/customer.csv'
INTO TABLE customer
CHARACTER SET utf8
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/root/repo/mariadb_scripts/practice/csv/emp.csv'
INTO TABLE emp
CHARACTER SET utf8
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/root/repo/mariadb_scripts/practice/csv/beverage.csv'
INTO TABLE beverage
CHARACTER SET utf8
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/root/repo/mariadb_scripts/practice/csv/orders.csv'
INTO TABLE ord
CHARACTER SET utf8
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/root/repo/mariadb_scripts/practice/csv/orderdetails.csv'
INTO TABLE cart
CHARACTER SET utf8
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;