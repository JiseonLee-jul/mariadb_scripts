DROP DATABASE IF EXISTS cafe;

CREATE DATABASE cafe;

USE cafe;


CREATE TABLE customer (
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name varchar(20) NOT NULL,
	gender char(1),
	age int,
	nickname varchar(20),
	phone varchar(20) NOT NULL,
	email varchar(30)
);

CREATE TABLE emp (
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name varchar(20) NOT NULL,
	start_date date NOT NULL,
	salary varchar(20) NOT NULL
);

CREATE TABLE beverage (
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name varchar(30) NOT NULL UNIQUE,
	category varchar(20) NOT NULL,
	price int NOT NULL	
);

CREATE TABLE nutrition_info (
	beverage_id int NOT NULL,
	kcal int,
	fat int,
	natrium int,
	sugar	int,
	protein int,
	caffein int,
	CONSTRAINT fk_beverage_id2 FOREIGN KEY (beverage_id) REFERENCES beverage(id)
);

CREATE TABLE ord (
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	customer_id int NOT NULL,
	date_ordered datetime,
	total_cnt int NOT NULL,
	total_price int NOT NULL, 
	emp_id int NOT NULL,
	CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES customer(id),
	CONSTRAINT fk_emp_id FOREIGN KEY (emp_id) REFERENCES emp(id)	
);

CREATE TABLE cart (
	ord_id int NOT NULL,
	beverage_id int NOT NULL,
	beverage_cnt int NOT NULL, 
	beverage_price int NOT NULL,
	CONSTRAINT fk_ord_id FOREIGN KEY (ord_id) REFERENCES ord(id),
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

LOAD DATA LOCAL INFILE '/root/repo/mariadb_scripts/practice/csv/nutrition_info.csv'
INTO TABLE nutrition_info
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

LOAD DATA LOCAL INFILE '/root/repo/mariadb_scripts/practice/csv/cart.csv'
INTO TABLE cart
CHARACTER SET utf8
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;