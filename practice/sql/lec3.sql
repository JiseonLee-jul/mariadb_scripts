-- 규칙에 따라 GROUP 분류하기
CREATE TABLE lookup_group
(id INT,
 price INT);

INSERT INTO lookup_group
VALUES(1, 10),(2, 20),(3, 20),(4, 40),(5, 50),(6, 60),(7, 70),(8, 80),(9, 90),(10, 100);

SELECT MOD(id, 2), price
FROM lookup_group;

SELECT MOD(id, 2), SUM(price)
FROM lookup_group
GROUP BY MOD(id, 2);

SELECT CASE WHEN MOD(id, 2) = 0 THEN 'even' ELSE 'odd' END AS 'Grade', SUM(price)
FROM lookup_group
GROUP BY MOD(id, 2);

SELECT CASE WHEN MOD(id, 2) = 0 THEN 'even' ELSE 'odd' END AS 'Grade', SUM(price)
FROM lookup_group
GROUP BY CASE WHEN MOD(id, 2) = 0 THEN 'even' ELSE 'odd' END;

SELECT CASE WHEN c.id = 1 THEN p.oddeven ELSE 'Total' END AS 'Grade', SUM(p.sprice)
FROM (SELECT CASE WHEN MOD(id, 2) = 0 THEN 'even' ELSE 'odd' END AS 'oddeven', SUM(price) AS 'sprice'
FROM lookup_group
GROUP BY CASE WHEN MOD(id, 2) = 0 THEN 'even' ELSE 'odd' END) p, copy_dual2 c
GROUP BY CASE WHEN c.id = 1 THEN p.oddeven ELSE 'Total' END;

-- GROUP BY와 JOIN 적용 순서
SELECT COUNT(*) FROM departments;

SELECT COUNT(*) FROM employees;

SELECT dept_name, emp_id
FROM departments d INNER JOIN employees e
ON d.dept_id = e.dept_id

SELECT dept_id, COUNT(*) FROM employees
GROUP BY dept_id;

SELECT dept_name '부서명', COUNT(*) '부서별 인원'
FROM (SELECT dept_name, emp_id
           FROM departments d INNER JOIN employees e
           ON d.dept_id = e.dept_id) m
GROUP BY dept_name;

SELECT d.dept_name '부서명', e.COUNT '부서별 인원'
FROM departments d INNER JOIN (SELECT dept_id, COUNT(*) 'COUNT'
                                FROM employees GROUP BY dept_id) e
ON d.dept_id = e.dept_id;


-- FULL OUTER JOIN 활용
CREATE TABLE sales_exam
(fy_date    CHAR(6),
 sales_result   INT);
CREATE TABLE cost_exam
(fy_date    CHAR(6),
 cost_result   INT);
INSERT INTO sales_exam 
VALUES ('202202', 5000000), ('202203', 6500000), ('202205', 7000000), ('202206', 2500000), 
       ('202208', 9000000), ('202209', 2000000), ('202211', 4500000), ('202212', 6700000);
INSERT INTO cost_exam
VALUES('202201', 3000000), ('202202', 2700000), ('202204', 4700000), ('202206', 1500000), 
      ('202207', 1000000), ('202208', 3000000), ('202210', 2500000), ('202212', 5000000);



SELECT 
    m.fy_date, 
    IFNULL(SUM(m.sales_result), 0) '매출 실적', 
    IFNULL(SUM(m.cost_result), 0) '비용 실적'
FROM (SELECT s.fy_date, s.sales_result, c.cost_result
      FROM (SELECT fy_date, sales_result FROM sales_exam) s
      LEFT JOIN (SELECT fy_date, cost_result FROM cost_exam) c
      ON s.fy_date = c.fy_date
      UNION 
      SELECT c.fy_date, s.sales_result, c.cost_result
      FROM (SELECT fy_date, sales_result FROM sales_exam) s
      RIGHT JOIN (SELECT fy_date, cost_result FROM cost_exam) c
      ON s.fy_date = c.fy_date) m
GROUP BY m.fy_date;

-- 왜 SUM??
SELECT 
    m.fy_date, 
    IFNULL(m.sales_result, 0) '매출 실적', 
    IFNULL(m.cost_result, 0) '비용 실적'
FROM (SELECT s.fy_date, s.sales_result, c.cost_result
      FROM (SELECT fy_date, sales_result FROM sales_exam) s
      LEFT JOIN (SELECT fy_date, cost_result FROM cost_exam) c
      ON s.fy_date = c.fy_date
      UNION 
      SELECT c.fy_date, s.sales_result, c.cost_result
      FROM (SELECT fy_date, sales_result FROM sales_exam) s
      RIGHT JOIN (SELECT fy_date, cost_result FROM cost_exam) c
      ON s.fy_date = c.fy_date) m
ORDER BY 1;
