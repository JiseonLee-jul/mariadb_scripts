------------------- 1. JOIN ----------------------
---- 실습데이터 생성
CREATE TABLE t1 ( col1 CHAR(1));
CREATE TABLE t2 ( col1 CHAR(1), col2 INT);
INSERT INTO t1 VALUES ('A'), ('C'), ('D'), ('B'), ('D'), ('A');
INSERT INTO t2 VALUES ('A', 1), ('B', 2), ('C', 3), ('E', 5);
SELECT * FROM t1;
SELECT * FROM t2;


-- a. INNER JOIN
SELECT * FROM t1 INNER JOIN t2 ON t1.col1 = t2.col1;
SELECT * FROM t1, t2 WHERE t1.col1 = t2.col1;
SELECT * FROM t1 CROSS JOIN t2;
SELECT * FROM t1 LEFT JOIN t2 ON t1.a = t2.b;
SELECT * FROM t2 LEFT JOIN t1 ON t1.a = t2.b;



--SELECT * FROM orders;
--SELECT * FROM customer;
SELECT c.id, o.customer_id, c.name, c.age 
    FROM customer c INNER JOIN orders o ON c.id=o.customer_id;

SELECT c.id, o.customer_id, c.name, c.age 
    FROM customer c, orders o WHERE c.id=o.customer_id;

---- b. LEFT JOIN
SELECT c.id, o.customer_id, c.name, c.age
    FROM customer c LEFT JOIN orders o ON c.id=o.customer_id;

---- c. RIGHT JOIN 
SELECT c.id, o.customer_id, c.name, c.age 
    FROM customer c RIGHT JOIN orders o ON c.id=o.customer_id;

---- d. FULL OUTER JOIN
SELECT c.id, o.customer_id, c.name, c.age
    FROM customer c LEFT JOIN orders o ON c.id=o.customer_id
    UNION 
    SELECT c.id, o.customer_id, c.name, c.age
    FROM customer c RIGHT JOIN orders o ON c.id=o.customer_id;

---- e. CROSS JOIN
SELECT * FROM emp;
CREATE TABLE copy_dual2(
    col1 INT,
    col2 INT
)
SELECT * FROM emp, copy_dual2;



------------------- 2. SUBQUERY ----------------------
--


---- b. multiple table syntax
CREATE TABLE test2 (
    emp_no int,
    emp_class varchar(5)
);
INSERT INTO test2 
    VALUES (1, 'A'),
           (2, 'B'),
           (3, 'C');

CREATE TABLE test3 (
    emp_no int,
    emp_name varchar(5)
);
INSERT INTO test3 
    VALUES (1, 'aa'),
           (2, 'bb'),
           (4, 'dd');

UPDATE test2, test3 SET test2.emp_class = 'Z', test3.emp_name = 'zz' WHERE test2.emp_no = test3.emp_no;
UPDATE test2, test3 SET test2.emp_class=test3.emp_name WHERE test2.emp_no = test3.emp_no;