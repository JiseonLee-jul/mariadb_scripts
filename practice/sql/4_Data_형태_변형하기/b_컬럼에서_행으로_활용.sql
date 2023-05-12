SELECT 
    CASE WHEN dept_id = 10 THEN dept_id END 'SALES_PARTNER', 
    CASE WHEN dept_id = 20 THEN dept_id END 'MANAGEMENT', 
    CASE WHEN dept_id = 30 THEN dept_id END 'ACCOUNTING', 
    CASE WHEN dept_id = 40 THEN dept_id END 'RESEARCH'
FROM employees;

SELECT 
    COUNT(CASE WHEN dept_id = 10 THEN dept_id END) 'SALES_PARTNER', 
    COUNT(CASE WHEN dept_id = 20 THEN dept_id END) 'MANAGEMENT', 
    COUNT(CASE WHEN dept_id = 30 THEN dept_id END) 'ACCOUNTING', 
    COUNT(CASE WHEN dept_id = 40 THEN dept_id END) 'RESEARCH'
FROM employees;

-- JOIN
SELECT
    CASE WHEN d.dept_name = 'SALES_PARTNER' THEN 1 END AS 'SALES_PARTNER',
    CASE WHEN d.dept_name = 'MANAGEMENT' THEN 1 END AS 'MANAGEMENT',
    CASE WHEN d.dept_name = 'ACCOUNTING' THEN 1 END AS 'ACCOUNTING',
    CASE WHEN d.dept_name = 'RESEARCH' THEN 1 END AS 'RESEARCH'
FROM departments d INNER JOIN employees e
ON d.dept_id = e.dept_id;

SELECT
    COUNT(CASE WHEN d.dept_name = 'SALES_PARTNER' THEN 1 END) AS 'SALES_PARTNER', 
    COUNT(CASE WHEN d.dept_name = 'MANAGEMENT' THEN 1 END) AS 'MANAGEMENT',
    COUNT(CASE WHEN d.dept_name = 'ACCOUNTING' THEN 1 END) AS 'ACCOUNTING',
    COUNT(CASE WHEN d.dept_name = 'RESEARCH' THEN 1 END) AS 'RESEARCH'
FROM departments d INNER JOIN employees e
ON d.dept_id = e.dept_id;

SELECT 
    SUM(CASE WHEN d.dept_name = 'SALES_PARTNER' THEN 1 END) AS 'SALES_PARTNER',
    SUM(CASE WHEN d.dept_name = 'MANAGEMENT' THEN 1 END) AS 'MANAGEMENT',
    SUM(CASE WHEN d.dept_name = 'ACCOUNTING' THEN 1 END) AS 'ACCOUNTING',
    SUM(CASE WHEN d.dept_name = 'RESEARCH' THEN 1 END) AS 'RESEARCH'
FROM departments d INNER JOIN employees e
ON d.dept_id = e.dept_id;


-- JOIN문장 개선
SELECT dept_id, COUNT(*) AS 'count'
FROM employees
GROUP BY dept_id;

SELECT 
    d.dept_name, e.count
FROM departments d INNER JOIN (
    SELECT dept_id, COUNT(*) AS 'COUNT'
    FROM employees
    GROUP BY dept_id
) e
ON d.dept_id = e.dept_id;

SELECT 
    CASE WHEN d.dept_name = 'SALES_PARTNER' THEN count END AS 'SALES_PARTNER',
    CASE WHEN d.dept_name = 'MANAGEMENT' THEN count END AS 'MANAGEMENT',
    CASE WHEN d.dept_name = 'ACCOUNTING' THEN count END AS 'ACCOUNTING',
    CASE WHEN d.dept_name = 'RESEARCH' THEN count END AS 'RESEARCH'
FROM departments d INNER JOIN (
    SELECT dept_id, COUNT(*) AS 'count'
    FROM employees
    GROUP BY dept_id
) e
ON d.dept_id = e.dept_id;

SELECT 
    SUM(CASE WHEN d.dept_name = 'SALES_PARTNER' THEN count END) AS 'SALES_PARTNER',
    SUM(CASE WHEN d.dept_name = 'MANAGEMENT' THEN count END) AS 'MANAGEMENT',
    SUM(CASE WHEN d.dept_name = 'ACCOUNTING' THEN count END) AS 'ACCOUNTING',
    SUM(CASE WHEN d.dept_name = 'RESEARCH' THEN count END) AS 'RESEARCH'
FROM departments d INNER JOIN (
    SELECT dept_id, COUNT(*) AS 'count'
    FROM employees
    GROUP BY dept_id
) e
ON d.dept_id = e.dept_id;
