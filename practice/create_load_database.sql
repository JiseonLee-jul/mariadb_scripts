DROP DATABASE IF EXISTS humansource;

CREATE DATABASE humansource;

USE humansource;

 create table emp
(
        deptname varchar(50) not null,
        empno int not null,
        empname varchar(50) not null,
        position varchar(50) not null,
        manager int not null,
        hiredate date not null,
        salary int not null,
        bonus int not null,
        cellphone varchar(20) not null,
        email varchar(50) not null
);

create table dept
(
        deptno int not null,
        deptname int not null,
        loation varchar(20) not null
);

create table salarygrade
(
        id int not null,
        grp varchar(10) not null,
        class varchar(10) not null,
        name varchar(10) not null
);


LOAD DATA LOCAL INFILE '/root/repo/mariadb_scripts/practice/emp.csv'
INTO TABLE emp
CHARACTER SET utf8
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGONRE 1 LINES

LOAD DATA LOCAL INFILE '/root/repo/mariadb_scripts/practice/dept.csv'
INTO TABLE dept
CHARACTER SET utf8
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGONRE 1 LINES

LOAD DATA LOCAL INFILE '/root/repo/mariadb_scripts/practice/salarygrade.csv'
INTO TABLE salarygrade
CHARACTER SET utf8
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGONRE 1 LINES
