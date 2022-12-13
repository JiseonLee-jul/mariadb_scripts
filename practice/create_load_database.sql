DROP DATABASE IF EXISTS cafe;

CREATE DATABASE cafe;

USE cafe;

CREATE TABLE `customer` (
	`id`	int	NOT NULL	COMMENT 'auto_increment',
	`name`	varchar(20)	NULL,
	`gender`	char(1)	NULL,
	`age`	int	NULL,
	`nickname`	varchar(20)	NULL,
	`phone`	char(13)	NULL,
	`email`	varchar(30)	NULL
);

CREATE TABLE `ord` (
	`id`	int	NOT NULL,
	`customer_id`	int	NOT NULL	COMMENT 'auto_increment',
	`date_ordered`	date	NULL,
	`sales_rep_id`	varchar(10)	NULL,
	`total`	int	NULL,
	`product_id`	int	NOT NULL,
	`Key`	int	NOT NULL
);

CREATE TABLE `emp` (
	`Key`	int	NOT NULL,
	`name`	varchar(20)	NULL,
	`start_date`	date	NULL,
	`salary`	int	NULL
);

CREATE TABLE `beverage` (
	`product_id`	int	NOT NULL,
	`product_name`	varchar(30)	NULL,
	`category`	varchar(10)	NULL,
	`price`	int	NULL,
	`show_flag`	char(1)	NULL
);

CREATE TABLE `nutrition_info` (
	`product_id`	int	NOT NULL,
	`kcal`	int	NULL,
	`fat`	int	NULL,
	`natrium`	int	NULL,
	`sugar`	int	NULL,
	`protein`	int	NULL,
	`caffein`	int	NULL
);


LOAD DATA LOCAL INFILE '/root/repo/mariadb_scripts/practice/csv/customer.csv'
INTO TABLE customer
CHARACTER SET utf8
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/root/repo/mariadb_scripts/practice/csv/ord.csv'
INTO TABLE ord
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

LOAD DATA LOCAL INFILE '/root/repo/mariadb_scripts/practice/csv/nutrition_info.csv'
INTO TABLE nutrition_info
CHARACTER SET utf8
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;