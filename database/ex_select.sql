------------------ SELECT ------------------
-- create_database_load_new.sql 사용하여 테이블 생성

-- management db의 table 보기
use management;
show tables;

select * from customer;
select id, name from customer;

-- alias
select id, name, phone as tel from customer;
select id, name, phone 'tel' from customer;
select count(*) 'cnt' from customer;

-- distinct/unique
select prd_id from purchase; -- 55 rows
select distinct prd_id from purchase; -- 34 rows
select unique prd_id from purchase;

-- 연산자
select * from customer where age >= 30;
select distinct name from product where inventory < 100 AND group ='E';

select name from customer where age between 20 and 30;
select name from customer where age >= 20 and age <= 30;

select name from customer where rank in ('MS001', 'MS003', 'MS004');
select name from customer where rank = 'MS001' OR rank = 'MS003' OR rank = 'MS004';

