------------------- 1. JOIN ----------------------
---- 실습데이터 생성
CREATE TABLE t1 ( col1 CHAR(1));
CREATE TABLE t2 ( col1 CHAR(1), col2 INT);
INSERT INTO t1 VALUES ('A'), ('C'), ('D'), ('B'), ('D'), ('A');
INSERT INTO t2 VALUES ('A', 1), ('B', 2), ('C', 3), ('E', 5);
SELECT * FROM t1;
SELECT * FROM t2;


---- a. 종류
--INNER JOIN
SELECT * FROM t1 INNER JOIN t2 ON t1.col1 = t2.col1;
SELECT * FROM t1, t2 WHERE t1.col1 = t2.col1;

-- LEFT JOIN
SELECT * FROM t1 LEFT JOIN t2 ON t1.col1 = t2.col1;

-- RIGHT JOIN
SELECT * FROM t1 RIGHT JOIN t2 ON t1.col1 = t2.col1;
SELECT * FROM t2 LEFT JOIN t1 ON t2.col1 = t1.col1;

-- FULL OUTER JOIN
SELECT * FROM t1 LEFT JOIN t2 ON t1.col1 = t2.col1
UNION
SELECT * FROM t1 RIGHT JOIN t2 ON t1.col1 = t2.col1;

-- CROSS JOIN
SELECT * FROM t1 CROSS JOIN t2;
SELECT * FROM t1, t2;


---- b. 활용
SELECT b.category as beverage_category, count(*) as cnt
    FROM orderdetails o 
    INNER JOIN beverage b ON o.beverage_id = b.id
    GROUP BY b.category
    ORDER BY 2 DESC;

SELECT e.name, e.salary * 12 as salary_year, sum(total_cnt) as sum_cnt, sum(total_price) as sum_price
    FROM emp e
    INNER JOIN orders o ON e.id = o.emp_id
    WHERE o.date_ordered LIKE '2022-12-08%'
    GROUP BY e.name
    ORDER BY 4 DESC, 3 DESC
    LIMIT 5;


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