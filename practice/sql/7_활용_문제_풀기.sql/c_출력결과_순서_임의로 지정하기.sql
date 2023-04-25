SELECT
    m.deptname,
    SUM(m.source_table) AS 'source_table',
    SUM(m.agg_table) AS 'agg_table',
    CASE 
        WHEN SUM(m.source_table) = SUM(m.agg_table) THEN 'Match'
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
GROUP BY m.deptname
ORDER BY m.deptname;


SELECT 
    CASE 
        WHEN deptname = 'MANAGEMENT' THEN 1
        WHEN deptname = 'RESEARCH' THEN 2 
        WHEN deptname = 'SALES_PARTNER' THEN 3 ELSE 4 
    END AS NO,
    m.deptname, 
    SUM(m.source_table) AS 'source_table', 
    SUM(m.agg_table) AS 'agg_table',
    CASE 
        WHEN (SUM(m.source_table)-SUM(m.agg_table)) = 0 THEN 'Match' 
        ELSE 'Not Match' 
    END AS 'Match or Not Match'
FROM (SELECT d.dept_name AS 'deptname', e.s_salary AS 'source_table', 0 AS 'agg_table'
FROM departments d INNER JOIN
(SELECT dept_id, SUM(salary) s_salary
FROM employees
GROUP BY dept_id) e
ON d.dept_id = e.dept_id
UNION ALL
SELECT deptname, 0 AS 'source_table', salary AS 'agg_table'
FROM dept_salary) m
GROUP BY m.deptname
ORDER BY NO;


SELECT 
    CASE 
        WHEN deptname = 'MANAGEMENT' THEN 1
        WHEN deptname = 'RESEARCH' THEN 2 
        WHEN deptname = 'SALES_PARTNER' THEN 3 ELSE 4 
    END AS NO,
    m.deptname, 
    SUM(m.source_table) AS 'source_table', 
    SUM(m.agg_table) AS 'agg_table',
    CASE 
        WHEN (SUM(m.source_table)-SUM(m.agg_table)) = 0 THEN 'Match' 
        ELSE 'Not Match' 
    END AS 'Match or Not Match'
FROM (SELECT d.dept_name AS 'deptname', e.s_salary AS 'source_table', 0 AS 'agg_table'
FROM departments d INNER JOIN
(SELECT dept_id, SUM(salary) s_salary
FROM employees
GROUP BY dept_id) e
ON d.dept_id = e.dept_id
UNION ALL
SELECT deptname, 0 AS 'source_table', salary AS 'agg_table'
FROM dept_salary) m
GROUP BY m.deptname
ORDER BY 1;



SELECT
    m.deptname,
    SUM(m.source_table) AS 'source_table',
    SUM(m.agg_table) AS 'agg_table',
    CASE 
        WHEN SUM(m.source_table) = SUM(m.agg_table) THEN 'Match'
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
GROUP BY m.deptname
ORDER BY (CASE 
        WHEN m.deptname = 'MANAGEMENT' THEN 1
        WHEN m.deptname = 'RESEARCH' THEN 2
        WHEN m.deptname = 'SALES_PARTNER' THEN 3
        WHEN m.deptname = 'ACCOUTING' THEN 4
        END
);