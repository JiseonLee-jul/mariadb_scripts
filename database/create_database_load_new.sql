DROP database IF EXISTS management;

create database management;

use management;

 create table customer
(
        id int not null,
        name varchar(10) not null,
        phone varchar(50) not null,
        address varchar(50) not null,
        age int not null,
        rank varchar(50) not null,
        emp_id int not null
);

create table employee
(
        id int not null,
        code int not null,
        name varchar(10) not null,
        rank varchar(10) not null,
        sex varchar(10) not null,
        s_date varchar(20) not null,
        dept_code int not null
);

create table code
(
        id int not null,
        grp varchar(10) not null,
        class varchar(10) not null,
        name varchar(10) not null
);

create table product
(
        id int not null,
        name varchar(20) not null,
        grp varchar(10) not null,
        price int not null,
        inventory int not null
);

create table purchase
(
        id int not null,
        cst_id int not null,
        prd_id int not null,
        num int not null
);

LOAD DATA LOCAL INFILE '/root/repo/mariadb_scripts/database/csv/customer.csv'
INTO TABLE customer
CHARACTER SET utf8
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/root/repo/mariadb_scripts/database/csv/code.csv'
INTO TABLE code
CHARACTER SET utf8
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/root/repo/mariadb_scripts/database/csv/employee.csv'
INTO TABLE employee
CHARACTER SET utf8
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/root/repo/mariadb_scripts/database/csv/product.csv'
INTO TABLE product
CHARACTER SET utf8
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/root/repo/mariadb_scripts/database/csv/purchase.csv'
INTO TABLE purchase
CHARACTER SET utf8
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;