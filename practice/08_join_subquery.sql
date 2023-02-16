------------------- 1. JOIN ----------------------
---- 실습데이터 생성
CREATE TABLE t1 (col1 CHAR(1));
CREATE TABLE t2 (col1 CHAR(1), col2 INT);
INSERT INTO t1 VALUES ('A'), ('C'), ('D'), ('B'), ('D'), ('A');
INSERT INTO t2 VALUES ('A', 1), ('B', 2), ('C', 3), ('E', 5);
SELECT * FROM t1;
SELECT * FROM t2;


---- a. 종류
--INNER JOIN
SELECT t2.col1, t2.col2 FROM t1 INNER JOIN t2 ON t1.col1 = t2.col1;
SELECT t2.col1, t2.col2 FROM t1, t2 WHERE t1.col1 = t2.col1;

-- LEFT JOIN
SELECT t1.col1 AS 'tl.col1', t2.col1 AS 't2.col1', t2.col2 FROM t1 LEFT JOIN t2 ON t1.col1 = t2.col1;

-- RIGHT JOIN
SELECT t1.col1 AS 'tl.col1', t2.col1 AS 't2.col1', t2.col2 FROM t1 RIGHT JOIN t2 ON t1.col1 = t2.col1;
SELECT t1.col1 AS 'tl.col1', t2.col1 AS 't2.col1', t2.col2 FROM t2 LEFT JOIN t1 ON t2.col1 = t1.col1;

-- CROSS JOIN
SELECT t1.col1 AS 'tl.col1', t2.col1 AS 't2.col1', t2.col2 FROM t1 CROSS JOIN t2;
SELECT t1.col1 AS 'tl.col1', t2.col1 AS 't2.col1', t2.col2 FROM t1, t2;

-- FULL OUTER JOIN
SELECT t1.col1 AS 'tl.col1', t2.col1 AS 't2.col1', t2.col2 
    FROM t1 
    LEFT JOIN t2 ON t1.col1 = t2.col1
UNION
SELECT t1.col1 AS 'tl.col1', t2.col1 AS 't2.col1', t2.col2 
    FROM t1 
    RIGHT JOIN t2 ON t1.col1 = t2.col1;



---- b. 활용
-- SELECT
SELECT *
    FROM orderdetails o 
    INNER JOIN beverage b ON o.beverage_id = b.id
    ORDER BY 6;

SELECT b.category as beverage_category, sum(beverage_cnt) as beverage_cnt
    FROM orderdetails o 
    INNER JOIN beverage b ON o.beverage_id = b.id
    GROUP BY b.category
    ORDER BY 2 DESC;


SELECT * 
    FROM employee e
    INNER JOIN orders o ON e.id = o.emp_id
    ORDER BY 2;


SELECT e.name, e.salary * 12 as salary_year, sum(total_cnt) as sum_cnt, sum(total_price) as sum_price
    FROM employee e
    INNER JOIN orders o ON e.id = o.emp_id
    WHERE o.date_ordered LIKE '2022-12-08%'
    GROUP BY e.name
    ORDER BY 4 DESC, 3 DESC;


SELECT e.name, e.salary * 12 as salary_year, sum(total_cnt) as sum_cnt, sum(total_price) as sum_price
    FROM employee e
    INNER JOIN (SELECT date_ordered, total_cnt, total_price, emp_id 
                FROM orders 
                WHERE date_ordered like '2022-12-08%') o 
    ON e.id = o.emp_id
    GROUP BY e.name
    ORDER BY 4 DESC, 3 DESC;

-- select count(*) from orders where date_ordered like '2022-12-08%';
-- select emp_id, sum(total_cnt) from orders where date_ordered like '2022-12-08%' group by emp_id;


-- UPDATE
CREATE TABLE salary(emp_id int, salary int, from_date date);
INSERT INTO salary VALUES 
    (1, NULL, NULL),
    (2, NULL, NULL),
    (3, NULL, NULL),
    (4, NULL, NULL),
    (5, NULL, NULL),
    (6, NULL, NULL),
    (7, NULL, NULL),
    (8, NULL, NULL),
    (9, NULL, NULL),
    (10, NULL, NULL),
    (11, NULL, NULL),
    (12, NULL, NULL),
    (13, NULL, NULL),
    (14, NULL, NULL),
    (15, NULL, NULL);
SELECT * FROM salary;


-- UPDATE
UPDATE employee e, salary s SET s.salary = e.salary, s.from_date = e.start_date WHERE e.id = s.emp_id;
UPDATE employee e 
    INNER JOIN salary s ON e.id = s.emp_id
    SET s.salary = e.salary, s.from_date = e.start_date;


-- DELETE
CREATE TABLE employee_copy (SELECT * FROM employee);
SELECT * FROM employee_copy;

DELETE s, e FROM salary s, employee_copy e WHERE s.salary = e.salary AND s.salary >= 4000000;
DELETE s, e FROM salary s 
    INNER JOIN employee_copy e
    WHERE s.salary = e.salary AND s.salary >= 4000000;


------------------- 2. SUBQUERY ----------------------
---- 활용
-- WHERE
SELECT * FROM employee WHERE name = 'Ashli';
SELECT customer_id, date_ordered, total_price, emp_id 
    FROM orders
    WHERE emp_id = (SELECT id FROM employee WHERE name = 'Ashli');
--
SELECT  o.customer_id, o.date_ordered, o.total_price, o.emp_id 
    FROM orders o, employee e
    WHERE o.emp_id=e.id AND e.name='Ashli';
--

SELECT *, salary*12 AS salary_year FROM employee WHERE salary >= 45000000/12;
SELECT customer_id, date_ordered, total_price, emp_id
    FROM orders
    WHERE emp_id IN (SELECT id FROM employee WHERE salary*12 >= 45000000);

SELECT customer_id FROM orders;
SELECT id, name, phone
    FROM customer
    WHERE id NOT IN (SELECT customer_id FROM orders);


-- FROM
SELECT beverage_id, sum(beverage_cnt) AS sumcnt 
    FROM orderdetails 
    GROUP BY beverage_id
    ORDER BY sum(beverage_cnt) DESC;
SELECT *
    FROM beverage A, (
    SELECT beverage_id, sum(beverage_cnt) AS sumcnt 
        FROM orderdetails 
        GROUP BY beverage_id
        ORDER BY sum(beverage_cnt) DESC
    ) B
    WHERE A.id = B.beverage_id;


-- SELECT
SELECT (SELECT name FROM beverage b WHERE b.id = o.beverage_id) AS beverage_name,
        sum(beverage_cnt) AS sumcnt
    FROM orderdetails o
    GROUP BY beverage_id
    ORDER BY SUM(beverage_cnt) DESC;

SELECT b.name AS beverage_name, sum(o.beverage_cnt) AS sumcnt
    FROM beverage b 
    INNER JOIN orderdetails o
    ON b.id = o.beverage_id
    GROUP BY beverage_id
    ORDER BY SUM(beverage_cnt) DESC;
