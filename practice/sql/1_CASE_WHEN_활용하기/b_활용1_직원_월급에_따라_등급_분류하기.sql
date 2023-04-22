-- FLOOR /TRUNCATE
SELECT FLOOR(1.23), FLOOR(1.5);
SELECT TRUNCATE(10.23, 1), TRUNCATE(10.23, -1);

-- CASE WHEN 문장으로 분류
SELECT emp_name, salary
FROM employees;

SELECT emp_name, salary/1000000
FROM employees;

SELECT emp_name, FLOOR(salary/1000000)
FROM employees;

SELECT emp_name, TRUNCATE(salary/1000000, 0)
FROM employees;

SELECT 
    emp_name, 
    CASE 
        WHEN FLOOR(salary/1000000) >= 4 THEN 'Grade A'
        WHEN FLOOR(salary/1000000) = 3 THEN 'Grade B'
        WHEN FLOOR(salary/1000000) = 2 THEN 'Grade C'
        ELSE 'Grade D' 
    END 'Salary Grade'
FROM employees;

SELECT 
    emp_name, 
    CASE 
        WHEN FLOOR(salary/1000000) >= 4 THEN 'Grade A'
        WHEN FLOOR(salary/1000000) = 3 THEN 'Grade B'
        WHEN FLOOR(salary/1000000) = 2 THEN 'Grade C'
        WHEN FLOOR(salary/1000000) < 2 THEN 'Grade D' 
    END 'Salary Grade'
FROM employees;

-- salgrade 테이블 생성 후 JOIN
CREATE TABLE salgrade
(grade  CHAR(2),
 lowsalary INT,
 highsalary INT);

INSERT INTO salgrade
VALUES('A', 4000000, 9999999), ('B', 3000000, 3999999),('C', 2000000, 2999999),('D', 0, 1999999);

SELECT e.emp_name, e.salary, s.grade
FROM salgrade s, employees e
WHERE e.salary = s.lowsalary;

SELECT e.emp_name, e.salary, s.grade
FROM salgrade s, employees e
WHERE e.salary BETWEEN s.lowsalary AND s.highsalary;
