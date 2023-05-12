-- 데이터 집합과 함수 처리
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


-- MySQL Server의 SQL문 처리 과정
-- client thread 연결
SELECT * FROM performance_schema.threads;

-- 메타데이터
SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'dacafe'; 

SELECT * FROM information_schema.COLUMNS 
WHERE TABLE_SCHEMA = 'dacafe' AND TABLE_NAME = 'departments'; 

SELECT * FROM information_schema.STATISTICS 
WHERE TABLE_SCHEMA = 'dacafe' AND TABLE_NAME = 'departments'; 