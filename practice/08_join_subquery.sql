------------------- 1. JOIN ----------------------
---- 실습데이터 생성
SELECT * FROM t1;
SELECT * FROM t2;


---- a. 종류
--INNER JOIN
SELECT 
    e.id AS employees_id, 
    e.name AS employees_name, 
    d.id AS departments_id, 
    d.name AS departments_name 
FROM employees e INNER JOIN departments d 
ON e.id = d.employee_id;
SELECT 
    e.id AS employees_id, 
    e.name AS employees_name, 
    d.id AS departments_id, 
    d.name AS departments_name 
FROM employees e, departments d 
WHERE e.id = d.employee_id;

-- LEFT JOIN
SELECT 
    e.id AS employees_id, 
    e.name AS employees_name, 
    d.id AS departments_id, 
    d.name AS departments_name 
FROM employees e LEFT JOIN departments d 
ON e.id = d.employee_id;

-- RIGHT JOIN
SELECT 
    e.id AS employees_id, 
    e.name AS employees_name, 
    d.id AS departments_id, 
    d.name AS departments_name 
FROM employees e RIGHT JOIN departments d 
ON e.id = d.employee_id;
SELECT 
    e.id AS employees_id, 
    e.name AS employees_name, 
    d.id AS departments_id, 
    d.name AS departments_name 
FROM departments d LEFT JOIN employees e
ON d.employee_id = e.id;

-- CROSS JOIN
SELECT 
    e.id AS employees_id, 
    e.name AS employees_name, 
    d.id AS departments_id, 
    d.name AS departments_name 
FROM employees e CROSS JOIN departments d;

-- FULL OUTER JOIN
SELECT 
    e.id AS employees_id, 
    e.name AS employees_name, 
    d.id AS departments_id, 
    d.name AS departments_name 
FROM employees e LEFT JOIN departments d 
ON e.id = d.employee_id
UNION
SELECT 
    e.id AS employees_id, 
    e.name AS employees_name, 
    d.id AS departments_id, 
    d.name AS departments_name 
FROM employees e RIGHT JOIN departments d 
ON e.id = d.employee_id;


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

SELECT o.date_ordered, b.category, od.beverage_cnt
FROM orders o INNER JOIN orderdetails od
ON o.id = od.orders_id
INNER JOIN beverage b 
ON od.beverage_id = b.id
ORDER BY o.id
LIMIT 10;
SELECT 
    DAY(o.date_ordered) AS date_ordered, 
    b.category,
    SUM(od.beverage_cnt) AS cnt
FROM orders o INNER JOIN orderdetails od
ON o.id = od.orders_id
INNER JOIN beverage b 
ON od.beverage_id = b.id
GROUP BY DATE(o.date_ordered), b.category
ORDER BY 1, 3 DESC;


-- select count(*) from orders where date_ordered like '2022-12-08%';
-- select emp_id, sum(total_cnt) from orders where date_ordered like '2022-12-08%' group by emp_id;

-- UPDATE
SELECT * FROM salary;
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
SELECT * FROM customer WHERE phone = '020-4067-1802';
SELECT customer_id, date_ordered, total_price, emp_id 
    FROM orders
    WHERE emp_id = (SELECT id FROM employee WHERE name = 'Ashli');
SELECT customer_id, date_ordered, total_price, emp_id 
    FROM orders
    WHERE customer_id = (SELECT id FROM customer WHERE phone = '020-4067-1802');
--
SELECT o.customer_id, o.date_ordered, o.total_price, o.emp_id 
    FROM orders o, customer c
    WHERE o.customer_id=c.id AND c.phone='020-4067-1802';
--

SELECT *, salary*12 AS salary_year 
    FROM employee 
    WHERE salary >= 45000000/12;
SELECT customer_id, date_ordered, total_price, emp_id
    FROM orders
    WHERE emp_id IN (SELECT id FROM employee WHERE salary >= 45000000/12)
    ORDER BY 1;
SELECT customer_id, date_ordered, total_price, emp_id
    FROM orders
    WHERE emp_id =ANY(SELECT id FROM employee WHERE salary >= 45000000/12)
    ORDER BY 1;


SELECT customer_id FROM orders;
SELECT id, name, phone
    FROM customer
    WHERE id NOT IN (SELECT customer_id FROM orders);
SELECT id, name, phone
    FROM customer
    WHERE id != ALL(SELECT customer_id FROM orders);
SELECT id, name, phone
    FROM customer c
    WHERE NOT EXISTS (SELECT * FROM orders o WHERE o.customer_id = c.id);


-- FROM
SELECT beverage_id, sum(beverage_cnt) AS sumcnt 
    FROM orderdetails 
    GROUP BY beverage_id;
SELECT A.name, B.sumcnt
    FROM beverage A, (
    SELECT beverage_id, sum(beverage_cnt) AS sumcnt 
        FROM orderdetails 
        GROUP BY beverage_id
    ) B
    WHERE A.id = B.beverage_id
    ORDER BY B.sumcnt DESC;


-- SELECT
SELECT name FROM beverage b, orderdetails o WHERE b.id = o.beverage_id;
SELECT (SELECT name FROM beverage b WHERE b.id = o.beverage_id) AS beverage_name,
        beverage_cnt
    FROM orderdetails o;
SELECT (SELECT name FROM beverage b WHERE b.id = o.beverage_id) AS beverage_name,
        SUM(beverage_cnt) AS sumcnt
    FROM orderdetails o
    GROUP BY beverage_id
    ORDER BY SUM(beverage_cnt) DESC;
SELECT (SELECT name FROM beverage b WHERE b.id = o.beverage_id) AS beverage_name,
        sum(beverage_cnt) AS sumcnt
    FROM orderdetails o
    GROUP BY beverage_name
    ORDER BY SUM(beverage_cnt) DESC;


SELECT b.name AS beverage_name, sum(o.beverage_cnt) AS sumcnt
    FROM beverage b 
    INNER JOIN orderdetails o
    ON b.id = o.beverage_id
    GROUP BY beverage_id
    ORDER BY SUM(beverage_cnt) DESC;
