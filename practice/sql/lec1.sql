-- 집합과 함수처리
SELECT * FROM employees;

SELECT * FROM employees
WHERE dept_id = 10;

SELECT sum(salary)
FROM employees;

SELECT dept_id, sum(salary)
FROM employees
GROUP BY dept_id;

SELECT substr(hire_date, 1, 4), count(*)
FROM employees
GROUP BY substr(hire_date, 1, 4);

--===== 예제 1) 분류에 따른 Grade 출력 =====
SELECT emp_name, salary FROM employees;
SELECT 
    emp_name,
    salary/1000000
FROM employees;
SELECT 
    emp_name,
    floor(salary/1000000)
FROM employees;
SELECT 
    emp_name,
    ceil(salary/1000000)
FROM employees;

SELECT 
    emp_name,
    CASE 
        WHEN floor(salary/1000000) >= 4 THEN 'Grade A'
        WHEN floor(salary/1000000) = 3 THEN 'Grade B'
        WHEN floor(salary/1000000) = 2 THEN 'Grade C'
        ELSE 'Grade D' 
    END AS 'Salary Grade'
FROM employees;

--- 추가 예제
SELECT s.Salary_Grade, COUNT(*)
FROM (SELECT emp_name, 
CASE WHEN floor(salary/1000000) >= 4 THEN 'Grade A'
WHEN floor(salary/1000000) = 3 THEN 'Grade B'
WHEN floor(salary/1000000) = 2 THEN 'Grade C'
ELSE 'Grade D' 
END AS 'Salary_Grade'
FROM employees
) s
GROUP BY s.Salary_Grade;
---
SELECT s.Salary_Grade, count(*)
FROM (select emp_name, case when floor(SALARY/1000000) >= 4 then 'Grade A'
when floor(SALARY/1000000) = 3 then 'Grade B'
when floor(SALARY/1000000) = 2 then 'Grade C'
else 'Grade D' end 'Salary_Grade' 
from employees) s
GROUP BY s.Salary_Grade
UNION ALL
SELECT 'Total', sum(m.count)
FROM (SELECT s.Salary_Grade, count(*) AS 'count'
FROM (select emp_name, case when floor(SALARY/1000000) >= 4 then 'Grade A'
when floor(SALARY/1000000) = 3 then 'Grade B'
when floor(SALARY/1000000) = 2 then 'Grade C'
else 'Grade D' end 'Salary_Grade' 
from employees) s
GROUP BY s.Salary_Grade) m;
---
SELECT c.*, m.* 
FROM (
    SELECT s.Salary_Grade, COUNT(*)
FROM (SELECT emp_name, 
CASE WHEN floor(salary/1000000) >= 4 THEN 'Grade A'
WHEN floor(salary/1000000) = 3 THEN 'Grade B'
WHEN floor(salary/1000000) = 2 THEN 'Grade C'
ELSE 'Grade D' 
END AS 'Salary_Grade'
FROM employees
) s
GROUP BY s.Salary_Grade
) m, copy_dual2 c;
---
SELECT 
    CASE 
        WHEN c.id = 1 THEN m.Salary_Grade 
        WHEN c.id = 2 THEN 'Total'
    END AS 'Salary Grade',
    CASE 
        WHEN c.id = 1 THEN m.count
        WHEN c.id = 2 THEN SUM(m.count)
    END AS 'COUNT'
FROM (
    SELECT s.Salary_Grade, COUNT(*) AS count
FROM (SELECT emp_name, 
CASE WHEN floor(salary/1000000) >= 4 THEN 'Grade A'
WHEN floor(salary/1000000) = 3 THEN 'Grade B'
WHEN floor(salary/1000000) = 2 THEN 'Grade C'
ELSE 'Grade D' 
END AS 'Salary_Grade'
FROM employees
) s
GROUP BY s.Salary_Grade
) m, copy_dual2 c
GROUP BY CASE WHEN c.id = 1 THEN m.Salary_Grade ELSE 'Total' END;


CREATE TABLE salgrade(grade CHAR(2), lowsalary INT, highsalary INT);
INSERT INTO salgrade VALUES 
    ('A', 4000000, 9999999),
    ('B', 3000000, 3999999),
    ('C', 2000000, 2999999),
    ('D', 0, 199999); 
SELECT e.emp_name, e.salary, s.grade
FROM salgrade s, employees e
WHERE e.salary = s.lowsalary;
SELECT e.emp_name, e.salary, s.grade
FROM salgrade s, employees e
WHERE e.salary = s.highsalary;
SELECT e.emp_name, e.salary, s.grade
FROM salgrade s, employees e
WHERE e.salary BETWEEN s.lowsalary AND s.highsalary;

-- CASE 문 예제
CREATE TABLE case_example (name CHAR(2));
INSERT INTO case_example VALUES ('A'),('B'),('C'),('D');
SELECT 
    CASE 
        WHEN name = 'A' THEN 'Grade A'
        ELSE 'Grade BCD' 
    END
FROM case_example;