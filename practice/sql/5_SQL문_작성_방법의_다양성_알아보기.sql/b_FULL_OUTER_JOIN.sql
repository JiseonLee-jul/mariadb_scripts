-- 데이터 생성
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


-- FULL OUTER JOIN
SELECT s.fy_date, s.sales_result, c.cost_result
      FROM (SELECT fy_date, sales_result FROM sales_exam) s
      LEFT JOIN (SELECT fy_date, cost_result FROM cost_exam) c
      ON s.fy_date = c.fy_date;

SELECT c.fy_date, s.sales_result, c.cost_result
      FROM (SELECT fy_date, sales_result FROM sales_exam) s
      RIGHT JOIN (SELECT fy_date, cost_result FROM cost_exam) c
      ON s.fy_date = c.fy_date;

SELECT s.fy_date, s.sales_result, c.cost_result
      FROM (SELECT fy_date, sales_result FROM sales_exam) s
      RIGHT JOIN (SELECT fy_date, cost_result FROM cost_exam) c
      ON s.fy_date = c.fy_date;

SELECT s.fy_date, s.sales_result, c.cost_result
      FROM (SELECT fy_date, sales_result FROM sales_exam) s
      LEFT JOIN (SELECT fy_date, cost_result FROM cost_exam) c
      ON s.fy_date = c.fy_date
      UNION 
      SELECT c.fy_date, s.sales_result, c.cost_result
      FROM (SELECT fy_date, sales_result FROM sales_exam) s
      RIGHT JOIN (SELECT fy_date, cost_result FROM cost_exam) c
      ON s.fy_date = c.fy_date;

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
GROUP BY m.fy_date
ORDER BY 1; -- SUM 안 할 수도 있다!

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


-- UNION ALL 활용
SELECT fy_date, sales_result, 0 'cost_result' FROM sales_exam;

SELECT fy_date, 0 'sales_result', cost_result FROM cost_exam;

SELECT fy_date, sales_result, 0 'cost_result' FROM sales_exam
UNION ALL
SELECT fy_date, 0 'sales_result', cost_result FROM cost_exam;

SELECT fy_date, sales_result, 0 'cost_result' FROM sales_exam
UNION
SELECT fy_date, 0 'sales_result', cost_result FROM cost_exam;

SELECT m.fy_date, SUM(m.sales_result) '매출 실적', SUM(m.cost_result) '비용 실적'
FROM (SELECT fy_date, sales_result, 0 'cost_result' FROM sales_exam
UNION ALL
SELECT fy_date, 0 'sales_result', cost_result FROM cost_exam) m
GROUP BY m.fy_date
ORDER BY 1;
