-------------------- CREATE / ALTER / DROP -------------------

-- database 목록 보기
show databases;
-- +--------------------+
-- | Database           |
-- +--------------------+
-- | information_schema | 메타데이터 : object, 유저, 엔진 정보 등
-- | mysql              | 
-- | performance_schema | 메타데이터 : 성능 관련 정보
-- | sys                |
-- +--------------------+


------------ CREATE ---------------
create database management;
use management;
create table customer(
    id int,
    name varchar(10)
);
desc customer;

-- 제약 조건 : unique
-- drop table customer;
create table customer(
    id int not null,
    name varchar(10) not null,
    address varchar(20),
    phone varchar(20) unique,
    age int
);

-- 제약 조건 : primary key
create table customer(
    id int not null,
    name varchar(10) not null,
    address varchar(20),
    phone varchar(20) unique,
    age int,
    primary key(id)
);

-- 제약 조건 : default
create table customer(
    id int primary key,
    name varchar(10) not null,
    address varchar(20) default 'seoul',
    phone varchar(20) unique,
    age int, 
);

-- 제약 조건 : auto_increment
create table customer(
    id int auto_increment,
    name varchar(10) not null,
    address varchar(20),
    phone varchar(20) unique,
    age int,
    primary key(id)
);

show full tables;
show full columns from customer;
 
------------ ALTER ---------------
---- table 
-- table 이름 변경
alter table customer rename cstm;
alter table cstm rename customer;

---- column 
-- column 추가
alter table customer add rank varchar(10) not null;
-- column 삭제
alter table customer drop column rank;
-- column 타입 변경
alter table customer modify phone char(13) not null;
alter table customer 
modify phone varchar(20) null,
modify name varchar(20) not null;
-- column 이름 변경
alter table customer change phone tel varchar(20);
-- column 순서 변경
alter table customer modify tel varchar(20) after name;

---- 제약조건 추가/제거
alter table customer drop primary key; -- 에러 -> 이유 : auto_increment 먼저 제거 (auto_increment는 primary key 설정해야함)
alter table customer drop primary key, modify id int(11);


-------------- DROP ---------------
truncate table customer;
drop table customer;
drop database management;