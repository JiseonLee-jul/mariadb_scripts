SELECT * FROM employees;

SELECT * FROM employees WHERE dept_id = 10;

SELECT SUM(salary) FROM employees;

SELECT dept_id, SUM(salary)
FROM employees
GROUP BY dept_id;

SELECT SUBSTR(hire_date, 1, 4), COUNT(*)
FROM employees
GROUP BY SUBSTR(hire_date, 1, 4);

SELECT manager_id, COUNT(*)
FROM employees
WHERE COUNT(*) > 1
GROUP BY MANAGER_ID;

SELECT manager_id, COUNT(*)
FROM employees
GROUP BY MANAGER_ID
HAVING COUNT(*) > 1;

