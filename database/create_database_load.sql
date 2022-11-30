DROP database IF EXISTS shoppingmall;

create database shoppingmall;

use shoppingmall;

 create table customer
(
        cstmr_no int not null,
        cstmr_nm varchar(10) not null,
        telno varchar(50) not null,
        adres varchar(50) not null,
        age int not null,
        cstmrgrad varchar(50) not null,
        chrg_emp_code int not null
);

create table employee
(
        EMP_NO int not null,
        EMP_CODE int not null,
        EMP_NM varchar(10) not null,
        CLSF varchar(10) not null,
        SEXDSTN varchar(10) not null,
        ECNY_YY_MT_DE varchar(20) not null,
        DEPT_CODE int not null
);

create table code
(
        code_no int not null,
        code_group varchar(10) not null,
        code_cl varchar(10) not null,
        code_nm varchar(10) not null
);

create table product
(
        goods_no int not null,
        goods_nm varchar(20) not null,
        goods_se varchar(10) not null,
        pc int not null,
        invntry int not null
);

create table purchase
(
        prchs_no int not null,
        cstmr_no int not null,
        goods_no int not null,
        purchs_no int not null
);

LOAD DATA LOCAL INFILE '/root/mariadb_scripts/csv/customer.csv'
INTO TABLE customer
CHARACTER SET utf8
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/root/mariadb_scripts/csv/code.csv'
INTO TABLE code
CHARACTER SET utf8
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/root/mariadb_scripts/csv/employee.csv'
INTO TABLE employee
CHARACTER SET utf8
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/root/mariadb_scripts/csv/product.csv'
INTO TABLE product
CHARACTER SET utf8
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/root/mariadb_scripts/csv/purchase.csv'
INTO TABLE purchase
CHARACTER SET utf8
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;