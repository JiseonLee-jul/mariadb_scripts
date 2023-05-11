SELECT d.dept_name, e.salary
FROM departments d INNER JOIN 
(SELECT dept_id, SUM(salary) AS salary
FROM employees
GROUP BY dept_id) e
ON d.dept_id = e.dept_id;

CREATE TABLE dept_salary
AS (SELECT 
        d.dept_name AS 'deptname', 
        e.salary
    FROM departments d INNER JOIN 
    (SELECT dept_id, SUM(salary) AS salary
    FROM employees
    GROUP BY dept_id) e
    ON d.dept_id = e.dept_id);


-- JOIN 두 번
SELECT 
    d.deptname,
    v.salary AS 'source_table',
    d.salary AS 'agg_table',
    CASE 
        WHEN v.salary = d.salary THEN 'Match'
        ELSE 'Unmatch'
    END AS 'Match or Not Match'
FROM dept_salary d INNER JOIN (
SELECT 
d.dept_name AS 'deptname', 
e.salary
FROM departments d INNER JOIN 
(SELECT dept_id, SUM(salary) AS salary
FROM employees
GROUP BY dept_id) e
ON d.dept_id = e.dept_id
) v 
ON d.deptname = v.deptname;


-- 답!
SELECT 
    d.dept_name AS 'deptname',  
    e.salary AS 'source_table',
    0 AS 'agg_table'
FROM departments d INNER JOIN 
(SELECT dept_id, SUM(salary) AS salary
FROM employees
GROUP BY dept_id) e
ON d.dept_id = e.dept_id
UNION ALL
SELECT 
    deptname,
    0 AS 'source_table',
    salary AS 'agg_table'
FROM dept_salary;


SELECT m.deptname, SUM(m.source_table) AS 'source_table', SUM(m.agg_table) AS 'agg_table'
FROM (SELECT d.dept_name AS 'deptname', e.s_salary AS 'source_table', 0 AS 'agg_table'
FROM departments d INNER JOIN
(SELECT dept_id, SUM(salary) s_salary
FROM employees
GROUP BY dept_id) e
ON d.dept_id = e.dept_id
UNION ALL
SELECT deptname, 0 AS 'source_table', salary AS 'agg_table'
FROM dept_salary) m
GROUP BY m.deptname;


SELECT
    m.deptname,
    MAX(m.source_table) AS 'source_table',
    MAX(m.agg_table) AS 'agg_table',
    CASE 
        WHEN MAX(m.source_table) = MAX(m.agg_table) THEN 'Match'
        ELSE 'Not Match'
    END AS 'Match or Not Match'
FROM (SELECT 
    d.dept_name AS 'deptname',  
    e.salary AS 'source_table',
    0 AS 'agg_table'
FROM departments d INNER JOIN 
(SELECT dept_id, SUM(salary) AS salary
FROM employees
GROUP BY dept_id) e
ON d.dept_id = e.dept_id
UNION ALL
SELECT 
    deptname,
    0 AS 'source_table',
    salary AS 'agg_table'
FROM dept_salary) m
GROUP BY m.deptname;

--- dept_salary 값 바꿔서 비교
UPDATE dept_salary
SET salary = salary * 1.1
WHERE deptname = 'ACCOUNTING';

UPDATE dept_salary
SET salary = salary / 1.1
WHERE deptname = 'ACCOUNTING';
