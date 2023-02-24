--------------------- 1. Trigger ----------------------- 
---- a. Trigger 생성
-- ex1 새로운 주문이 들어오면 음료별 총 주문 개수 테이블 업데이트하는 트리거 만들기
CREATE TABLE beverage_count (
    SELECT beverage_id, sum(beverage_cnt) AS sumcnt 
    FROM orderdetails 
    GROUP BY beverage_id
);
SELECT * FROM beverage_count;

DELIMITER //
CREATE TRIGGER orderdetails_beverage_count
    AFTER INSERT ON orderdetails
    FOR EACH ROW
    BEGIN
        UPDATE beverage_count 
            SET sumcnt = sumcnt + NEW.beverage_cnt 
            WHERE beverage_id = NEW.beverage_id;
    END;
//
DELIMITER ;

ALTER TABLE orderdetails DROP CONSTRAINT fk_orders_id;
INSERT INTO orderdetails VALUE (179, 1, 5);
SELECT * FROM orderdetails;
SELECT * FROM beverage_count;

---- b. Trigger 메타데이터
SHOW CREATE TRIGGER orderdetails_beverage_count\G
SHOW TRIGGERS\G
SELECT * FROM information_schema.triggers\G


---- c. Trigger 제거
DROP TRIGGER orderdetails_beverage_count;
SHOW TRIGGERS\G

---- d. Trigger와 Transaction
SHOW CREATE TABLE beverage_count;

DELIMITER //
CREATE TRIGGER orderdetails_beverage_count_err
    AFTER INSERT ON orderdetails
    FOR EACH ROW
    BEGIN
        UPDATE beverage_count 
            SET cnt = cnt + NEW.beverage_cnt 
            WHERE beverage_id = NEW.beverage_id;
    END;
//
DELIMITER ;

INSERT INTO orderdetails VALUE (180, 1, 3);
SELECT * FROM orderdetails;
SELECT * FROM beverage_count;


ALTER TABLE orderdetails DROP CONSTRAINT fk_beverage_id;
ALTER TABLE orderdetails ENGINE=MyISAM;

ALTER TABLE beverage_count ENGINE=MyISAM;
SHOW CREATE TABLE beverage_count;



INSERT INTO orderdetails VALUE (180, 1, 3);
SELECT * FROM orderdetails;
SELECT * FROM beverage_count;



-- ex2) 
DELIMITER //
CREATE TRIGGER orderdetails_to_orders
    AFTER INSERT ON orderdetails
    FOR EACH ROW
    BEGIN
        INSERT INTO 
    END;
//
DELIMITER ;

--------------------- 2. Sequence ----------------------
---- a. Seqeunce 생성
CREATE SEQUENCE emp_seq
    START WITH 14
    INCREMENT BY 1
    MAXVALUE 999999;

SHOW FULL TABLES;
SELECT * FROM emp_seq;
SHOW CREATE SEQUENCE emp_seq;

SELECT LASTVAL(emp_seq);
SELECT PREVIOUS VALUE FOR emp_seq;

SELECT NEXTVAL(emp_seq);
SELECT NEXT VALUE FOR emp_seq;

SELECT * FROM employee;
INSERT INTO employee VALUES (nextval(emp_seq), 'Jess', '2022-11-08', 3300000);
SELECT * FROM employee;

---- b. Sequence 변경
SELECT LASTVAL(emp_seq);
SELECT * FROM emp_seq;

ALTER SEQUENCE emp_seq RESTART = 21;
SELECT * FROM emp_seq;

SELECT LASTVAL(emp_seq);
SELECT NEXTVAL(emp_seq);

SELECT SETVAL(emp_seq, 100);
SELECT * FROM emp_seq;
SELECT NEXTVAL(emp_seq);
SELECT * FROM emp_seq;

---- c. Sequence 제거
DROP SEQUENCE emp_seq;
SHOW FULL TABLES WHERE Table_type ='SEQUENCE';
SELECT * FROM employee;

--------------------- 3. Synonym -----------------------
SHOW DATABASES;
CALL sys.create_synonym_db('information_schema', 'info');
CALL sys.create_synonym_db('performance_schema', 'perf');

SHOW FULL TABLES FROM info;
SHOW FULL TABLES FROM perf;

DROP DATABASE info, perf;
