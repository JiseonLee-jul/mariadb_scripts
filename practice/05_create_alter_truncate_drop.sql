CREATE DATABASE test;

USE test

CREATE TABLE people
(
   name varchar(10),
   age int
);

DESC people;

-- DDL -> vol 1 372p부터
-- 제약조건 --


-- NOT NULL | NULL
-- https://reddb.tistory.com/120

-- DEFAULT default_value
-- https://reddb.tistory.com/120

-- CHECK
-- https://reddb.tistory.com/120

-- PRIMARY KEY
-- https://reddb.tistory.com/118
-- https://mariadb.com/kb/en/getting-started-with-indexes/#primary-key

-- UNIQUE KEY
-- https://reddb.tistory.com/120

-- FORIEGN KEY
-- https://reddb.tistory.com/119
-- https://mariadb.com/kb/en/alter-table/


-- 테이블 명 수정
ALTER TABLE customer RENAME client;

ALTER TABLE client RENAME customer; -- 되돌리기



-- 테이블에 컬럼 추가
ALTER TABLE customer ADD address varchar(50);

-- 테이블에 컬럼 제거
ALTER TABLE customer DROP COLUMN address;



-- 테이블 안의 컬럼 속성 (제약조건/데이터 타입) 바꾸기

ALTER TABLE customer MODIFY age char(10) NOT NULL

alter table people modify tel char(13) NOT NULL;


-- 테이블 안의 컬럼 명 & 타입 바꾸기

ALTER TABLE customer CHANGE phone tel char(13);


-- 컬럼 순서 변경
    
ALTER TABLE customer MODIFY id AFTER email; -- id 컬럼을 마지막 위치로 바꾸기
    
ALTER TABLE customer MODIFY id int FIRST; -- 마지막 위치로 바뀐 id 컬럼을 첫번째로 옮기기

-- 제약조건 추가

ALTER TABLE customer ADD PRIMARY KEY(id); -- primary key 추가

ALTER TABLE customer MODIFY id int auto_increment PRIMARY KEY; -- primary key & auto_increment 추가 : 1개 이상의 제약조건 추가

-- 제약조건 제거

ALTER TABLE customer DROP PRIMARY KEY, MODIFY id int(11);

ALTER TABLE people DROP PRIMARY KEY;

----------------------------
ALTER TABLE people
    ADD constraint chk_tel
    check (tel LIKE('020%'));

-- check 제약조건에 위배되는 값은 insert할 수 없다.
insert into people value(1, 'ezis', '020-0000-0000');
insert into people value(1, 'ezis', '010-0000-0000');
SET check_constraint_checks=0; -- check 제약조건 비활성화
insert into people value(1, 'ezis', '010-0000-0000');

insert into people values(1, 'ezis', '020-0000-0000');
insert into people values(2, 'ezis', '020-0000-0000');
insert into people values(3, 'ezis', '020-0000-0000');
insert into people values(4, 'ezis', '020-0000-0000');
insert into people values(5, 'ezis', '020-0000-0000');
insert into people values(6, 'ezis', '020-0000-0000');
