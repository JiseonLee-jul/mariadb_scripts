--------------------- 1. synonym ----------------------
SHOW DATABASES;
CALL sys.create_synonym_db('information_schema', 'info');
CALL sys.create_synonym_db('performance_schema', 'perf');

SHOW FULL TABLES FROM info;
SHOW FULL TABLES FROM perf;

DROP DATABASE info, perf;

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