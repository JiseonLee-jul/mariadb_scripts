-- employees와 departments 테이블 JOIN하여 부서별 총 급여 조회하기
SELECT *
FROM departments d INNER JOIN employees e
ON d.dept_id = e.dept_id;

SELECT 
    d.dept_name AS 'deptname', 
    SUM(e.salary) AS 'salary'
FROM departments d INNER JOIN employees e
ON d.dept_id = e.dept_id
GROUP BY e.dept_id;

SELECT 
    d.dept_name AS 'deptname', 
    e.s_salary AS 'salary'
FROM departments d INNER JOIN
    (SELECT dept_id, SUM(salary) s_salary
     FROM employees
     GROUP BY dept_id) e
ON d.dept_id = e.dept_id;


-- CROSS JOIN을 활용한 Grand Total 출력
CREATE TABLE copy_dual2 (id INT);
INSERT INTO copy_dual2 VALUES (1), (2);
SELECT * FROM copy_dual2;

SELECT 
    c.*, m.*
FROM (SELECT 
        d.dept_name AS 'deptname', 
        e.s_salary AS 'salary'
      FROM departments d INNER JOIN
        (SELECT dept_id, SUM(salary) s_salary
         FROM employees
         GROUP BY dept_id) e
      ON d.dept_id = e.dept_id) m, copy_dual2 c
ORDER BY c.id;

SELECT 
    c.*, m.*
FROM (SELECT 
        d.dept_name AS 'deptname', 
        e.s_salary AS 'salary'
      FROM departments d INNER JOIN
        (SELECT dept_id, SUM(salary) s_salary
         FROM employees
         GROUP BY dept_id) e
      ON d.dept_id = e.dept_id) m, copy_dual2 c
GROUP BY CASE WHEN c.id = 1 THEN m.deptname ELSE 'Grand Total' END; --에러

SELECT 
    CASE WHEN c.id = 1 THEN m.deptname ELSE 'Grand Total' END AS 'Department', 
    SUM(m.salary) AS 'Sub Total'
FROM (SELECT 
        d.dept_name AS 'deptname', 
        e.s_salary AS 'salary'
      FROM departments d INNER JOIN
        (SELECT dept_id, SUM(salary) s_salary
         FROM employees
         GROUP BY dept_id) e
      ON d.dept_id = e.dept_id) m, copy_dual2 c
GROUP BY CASE WHEN c.id = 1 THEN m.deptname ELSE 'Grand Total' END;

-- ROLLUP을 활용한 Grand Total 출력
SELECT dept_id, SUM(salary) s_salary
FROM employees
GROUP BY dept_id WITH ROLLUP;

SELECT d.dept_name AS 'deptname', e.s_salary AS 'salary'
FROM departments d RIGHT JOIN
    (SELECT dept_id, SUM(salary) s_salary
     FROM employees
     GROUP BY dept_id WITH ROLLUP) e
ON d.dept_id = e.dept_id;

SELECT d.dept_name AS 'deptname', e.s_salary AS 'salary'
FROM departments d INNER JOIN
    (SELECT dept_id, SUM(salary) s_salary
     FROM employees
     GROUP BY dept_id WITH ROLLUP) e
ON d.dept_id = e.dept_id;

SELECT 
    IFNULL(d.dept_name, 'Grand Total') AS 'deptname', 
    e.s_salary AS 'salary'
FROM departments d RIGHT JOIN
    (SELECT dept_id, SUM(salary) s_salary
     FROM employees
     GROUP BY dept_id WITH ROLLUP) e
ON d.dept_id = e.dept_id;

-- IFNULL / NVL
SELECT IFNULL(NULL, 0), IFNULL(1, 0);
