---- 조건에 따른 일괄 UPDATE
-- departments -> departments3 테이블 복제
CREATE TABLE departments3
AS SELECT * FROM departments;

-- 4번 업데이트
UPDATE departments3 SET loc_id = 101 WHERE dept_id = 10;
UPDATE departments3 SET loc_id = 102 WHERE dept_id = 20;
UPDATE departments3 SET loc_id = 203 WHERE dept_id = 30;
UPDATE departments3 SET loc_id = 505 WHERE dept_id = 50;

-- UPDATE 전 확인
SELECT 
    dept_id,
    CASE 
        WHEN dept_id = 10 THEN 101
        WHEN dept_id = 20 THEN 102
        WHEN dept_id = 30 THEN 203
        ELSE loc_id + 5
    END AS 'UPDATE 전 확인'
FROM departments;

-- 1번에 업데이트
UPDATE departments3 
SET loc_id = (
    CASE 
        WHEN dept_id = 10 THEN 101
        WHEN dept_id = 20 THEN 102
        WHEN dept_id = 30 THEN 203
        ELSE loc_id + 5
    END
);


---- 숫자를 한글로
-- lookup 테이블 만들기
CREATE TABLE lookup
(valnum INT,
valtext VARCHAR(10)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO lookup
VALUES (0, ''),(1, '일'),(2, '이'),(3, '삼'),(4, '사'),(5, '오'),(6, '육'),(7, '칠'),(8, '팔'),(9, '구'),(10, '십'),
(11, '십일'),(12, '십이'),(13, '십삼'),(14, '십사'),(15, '십오'),(16, '십육'),(17, '십칠'),(18, '십팔'),(19, '십구'),(20, '이십'),
(21, '이십일'),(22, '이십이'),(23, '이십삼'),(24, '이십사'),(25, '이십오'),(26, '이십육'),(27, '이십칠'),(28, '이십팔'),(29, '이십구'),(30, '삼십'),
(31, '삼십일'),(32, '삼십이'),(33, '삼십삼'),(34, '삼십사'),(35, '삼십오'),(36, '삼십육'),(37, '삼십칠'),(38, '삼십팔'),(39, '삼십구'),(40, '사십'),
(41, '사십일'),(42, '사십이'),(43, '사십삼'),(44, '사십사'),(45, '사십오'),(46, '사십육'),(47, '사십칠'),(48, '사십팔'),(49, '사십구'),(50, '오십'),
(51, '오십일'),(52, '오십이'),(53, '오십삼'),(54, '오십사'),(55, '오십오'),(56, '오십육'),(57, '오십칠'),(58, '오십팔'),(59, '오십구'),(60, '오십'),
(61, '육십일'),(62, '육십이'),(63, '육십삼'),(64, '육십사'),(65, '육십오'),(66, '육십육'),(67, '육십칠'),(68, '육십팔'),(69, '육십구'),(70, '칠십'),
(71, '칠십일'),(72, '칠십이'),(73, '칠십삼'),(74, '칠십사'),(75, '칠십오'),(76, '칠십육'),(77, '칠십칠'),(78, '칠십팔'),(79, '칠십구'),(80, '팔십'),
(81, '팔십일'),(82, '팔십이'),(83, '팔십삼'),(84, '팔십사'),(85, '팔십오'),(86, '팔십육'),(87, '팔십칠'),(88, '팔십팔'),(89, '팔십구'),(90, '구십'),
(91, '구십일'),(92, '구십이'),(93, '구십삼'),(94, '구십사'),(95, '구십오'),(96, '구십육'),(97, '구십칠'),(98, '구십팔'),(99, '구십구'),(100, '백'),
(1000, '천'),(10000, '만');
 
SELECT 
    d.dept_id AS '부서코드',
    l.valtext AS '부서코드 한글화'
FROM departments3 d, lookup l
WHERE d.dept_id = l.valnum;

-- 백의 자리 숫자 찾기
SELECT 
    d.loc_id AS '지역코드',
    l.valtext AS '지역코드 한글화'
FROM departments3 d, lookup l
WHERE l.valnum = FLOOR(d.loc_id/100);

SELECT 
    d.loc_id AS '지역코드',
    l.valtext AS '지역코드 한글화'
FROM departments3 d, lookup l
WHERE l.valnum = FLOOR(d.loc_id/100);



SELECT 
    dept_id AS '부서코드',
    CONCAT(

    ) AS '지역코드 한글화'
FROM departments3 d, lookup l;


-- 월별실적 증감 출력 (특정 년도 기준)
SELECT 
FROM salesamount;

---- Grand Total 구하기
SELECT
    dept_id AS 'Department',
    SUM(salary) AS 'Sub Total'
FROM employees
GROUP BY dept_id;
SELECT 
    c.id, 
    e.dept_id AS 'Department', 
    SUM(e.salary) AS 'Sub Total'
FROM employees e, copy_dual2 c
GROUP BY c.id, e.dept_id;
SELECT
    c.id,
    CASE 
        WHEN c.id = 1 THEN e.dept_id
        ELSE 'Total'
    END AS 'Department',
    SUM(e.salary) AS 'Sub Total'
FROM employees e, copy_dual2 c
GROUP BY CASE WHEN c.id = 1 THEN e.dept_id ELSE 'Total' END;
SELECT
    CASE 
        WHEN c.id = 1 AND e.dept_id = 10 THEN 'SALES_PARTNER'
        WHEN c.id = 1 AND e.dept_id = 20 THEN 'MANAGEMENT'
        WHEN c.id = 1 AND e.dept_id = 30 THEN 'ACCOUNTING'
        WHEN c.id = 1 AND e.dept_id = 40 THEN 'RESEARCH'
        ELSE 'Grand Total'
    END AS 'Department',
    SUM(e.salary) AS 'Sub Total'
FROM employees e, copy_dual2 c
GROUP BY CASE WHEN c.id = 1 THEN e.dept_id ELSE 'Total' END;


---- 1행에 데이터를 1행에 2개 데이터 출력
CREATE TABLE solarsystem
(id INT,
name VARCHAR(20));
INSERT INTO solarsystem
VALUES(1, 'sun'),(2,'mercury'),(3,'venus'),(4,'earth'),(5,'mars'),
(6,'jupiter'),(7,'saturn'),(8,'uranus'),(9,'neptune'),(10, NULL);

SELECT
    CASE WHEN MOD(id, 2) = 1 THEN name END AS 'name(first column)',
    CASE WHEN MOD(id, 2) = 0 THEN name END AS 'name(second column)'
FROM solarsystem;


-- Source Table과 집계 Table 비교
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
FROM dept_salary d JOIN (
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


-- 출력결과 순서 임의로 지정하기
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
GROUP BY m.deptname
ORDER BY (CASE 
        WHEN m.deptname = 'MANAGEMENT' THEN 1
        WHEN m.deptname = 'RESEARCH' THEN 2
        WHEN m.deptname = 'SALES_PARTNER' THEN 3
        WHEN m.deptname = 'ACCOUTING' THEN 4
        END
);


-- 수입, 지출 구분하여 SUM하고 흑자, 적자 출력
CREATE TABLE expenseincome
(class CHAR(2),
costs INT);
INSERT INTO expenseincome
VALUES('A',9000),('A',2500),('A',1500),
('B',4000),('B',6700),('B',5600),('B',4700),('B',1000),
('C',3200),('C',3500),('C',8000),('C',5000),('C',7000),
('D',5500),('D',3200),('D',3800),('D',2600),('D',4900),('D',6600);

SELECT 
    class,
    CASE
        WHEN class = 'D' THEN SUM((-1)*costs)
        ELSE SUM(costs)
    END AS 'sub total',
    CASE
        WHEN class = 'D' THEN '지출'
        ELSE '수입'
    END AS 'notes'
FROM expenseincome
GROUP BY class;

SELECT
    c.id,
    e.class,
    CASE
        WHEN e.class = 'D' THEN SUM((-1)*e.costs)
        ELSE SUM(e.costs)
    END AS 'sub total',
    CASE
        WHEN class = 'D' THEN '지출'
        ELSE '수입'
    END AS 'notes'
FROM expenseincome e, copy_dual2 c
GROUP BY c.id, e.class;

SELECT
    c.id,
    e.class,
    CASE
        WHEN c.id = 1 THEN IF(e.class = 'D', SUM((-1)*e.costs), SUM(e.costs))
        WHEN c.id = 2 THEN SUM(e.costs)
    END AS 'sub total',
    CASE
        WHEN class = 'D' THEN '지출'
        ELSE '수입'
    END AS 'notes'
FROM expenseincome e, copy_dual2 c
GROUP BY c.id, e.class;

SELECT
    CASE 
        WHEN c.id = 1 THEN e.class
        ELSE 'Total'
    END AS 'class', 
    CASE
        WHEN c.id = 1 THEN (
            CASE
                WHEN e.class = 'D' THEN SUM((-1)*e.costs)
                ELSE SUM(e.costs) 
            END)
        WHEN c.id = 2 THEN SUM(
            CASE 
                WHEN e.class = 'D' THEN (-1)*e.costs
                ELSE e.costs  
            END)
    END AS 'sub total',
    CASE
        WHEN c.id = 1 THEN (
            CASE
                WHEN class = 'D' THEN '지출'
                ELSE '수입' 
            END)
        WHEN c.id = 2 THEN IF(SUM(
            CASE 
                WHEN e.class = 'D' THEN (-1)*e.costs
                ELSE e.costs  
            END) >= 0, '흑자', '적자')
    END AS 'notes'
FROM expenseincome e, copy_dual2 c
GROUP BY CASE WHEN c.id = 1 THEN e.class ELSE 'Total' END;

