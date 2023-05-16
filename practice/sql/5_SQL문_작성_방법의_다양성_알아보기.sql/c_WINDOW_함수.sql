CREATE TABLE salesamount(yearmonth CHAR(7), amount INT);
INSERT INTO salesamount VALUES 
('202201', 5500000), ('202202', 6000000), ('202203', 7000000), ('202204', 4700000), 
('202205', 9000000), ('202206', 7800000), ('202207', 8800000), ('202208', 12000000),
('202209', 6700000), ('202210', 7200000), ('202211', 7100000), ('202212', 9000000);

-- LAG 함수 사용하기
SELECT 
    yearmonth AS '2022년 1월~12월', 
    amount AS '이번달 실적', 
    LAG(amount,1) OVER (ORDER BY yearmonth) AS '지난달 실적',
    amount - LAG(amount,1) OVER (ORDER BY yearmonth) AS '지난달대비 증감'
FROM salesamount;


-- WINDOW 함수
SELECT dept_id, SUM(salary) 
FROM employees 
GROUP BY dept_id;

SELECT dept_id, 
SUM(salary) OVER(PARTITION BY dept_id) 
FROM employees;

SELECT dept_id, emp_name,
SUM(salary) OVER() AS 'total_salary',
SUM(salary) OVER(PARTITION BY dept_id) AS 'dept_salary'
FROM employees;

SELECT dept_id,
    LAG(dept_id, 0) OVER (ORDER BY dept_id) AS '0',
    LAG(dept_id) OVER (ORDER BY dept_id) AS '',
    LAG(dept_id, 1) OVER (ORDER BY dept_id) AS '1',
    LAG(dept_id, 2) OVER (ORDER BY dept_id) AS '2'
FROM departments;

SELECT dept_id,
    LEAD(dept_id, 0) OVER (ORDER BY dept_id) AS '0',
    LEAD(dept_id) OVER (ORDER BY dept_id) AS '',
    LEAD(dept_id, 1) OVER (ORDER BY dept_id) AS '1',
    LEAD(dept_id, 2) OVER (ORDER BY dept_id) AS '2'
FROM departments;


-- LAG 함수 사용 안 하기
SELECT 
    CAST(yearmonth AS SIGNED), 
    amount AS '이번달 실적', 
    0 AS '지난달 실적'
FROM salesamount;

SELECT 
    CAST(yearmonth AS SIGNED) + 1, 
    0 AS '이번달 실적', 
    amount AS '지난달 실적' 
FROM salesamount;

SELECT 
    CAST(yearmonth AS SIGNED), amount AS '이번달 실적', 0 AS '지난달 실적'
FROM salesamount
UNION ALL
SELECT 
    CAST(yearmonth AS SIGNED) + 1, 0 AS '이번달 실적', amount AS '지난달 실적' 
FROM salesamount;

SELECT m.yearmonth, MAX(m.thismonth_amount), MAX(nextmonth_amount)
FROM (SELECT CAST(yearmonth AS SIGNED)  AS 'yearmonth', amount AS 'thismonth_amount', 0 AS 'nextmonth_amount' 
      FROM salesamount
      UNION ALL
      SELECT CAST(yearmonth AS SIGNED) + 1 AS  'yearmonth_before', 0 AS 'thismonth_amount', amount AS 'nextmonth_amount' 
    FROM salesamount) m
GROUP BY m.yearmonth;

SELECT m.yearmonth, MAX(m.thismonth_amount), MAX(nextmonth_amount)
FROM (SELECT CAST(yearmonth AS SIGNED)  AS 'yearmonth', amount AS 'thismonth_amount', 0 AS 'nextmonth_amount' 
      FROM salesamount
      UNION ALL
      SELECT CAST(yearmonth AS SIGNED) + 1 AS  'yearmonth_before', 0 AS 'thismonth_amount', amount AS 'nextmonth_amount' 
    FROM salesamount) m
GROUP BY m.yearmonth
HAVING yearmonth NOT IN (202201, 202213);

SELECT 
    m.yearmonth, 
    MAX(m.thismonth_amount) "이번달 실적", 
    MAX(nextmonth_amount) "지난달 실적", 
    MAX(m.thismonth_amount)-MAX(nextmonth_amount) "이번달 실적 - 지난달 실적"
FROM (SELECT CAST(yearmonth AS SIGNED)  AS 'yearmonth', amount AS 'thismonth_amount', 0 AS 'nextmonth_amount' 
      FROM salesamount
      UNION ALL
      SELECT CAST(yearmonth AS SIGNED) + 1 AS  'yearmonth_before', 0 AS 'thismonth_amount', amount AS 'nextmonth_amount' 
    FROM salesamount) m
GROUP BY m.yearmonth
HAVING yearmonth NOT IN (202201, 202213);


