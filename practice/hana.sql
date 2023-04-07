-- 집합과 함수처리
SELECT * FROM employees;

SELECT * FROM employees
where dept_id = 10;

SELECT sum(salary)
FROM employees;

SELECT dept_id, sum(salary)
FROM employees
group by dept_id;

SELECT substr(hire_date, 1, 4), count(*)
FROM employees
group by substr(hire_date, 1, 4);

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


CREATE TABLE case_example (name CHAR(2));
INSERT INTO case_example VALUES ('A'),('B'),('C'),('D');
SELECT 
    CASE 
        WHEN name = 'A' THEN 'Grade A'
        ELSE 'Grade BCD' 
    END
FROM case_example;



--===== 예제 2) Data 변경 : 컬럼에서 행으로 =====
CREATE TABLE crtrans (name CHAR(2));
INSERT INTO crtrans VALUES ('A'),('B'),('C'),('D');

SELECT
    CASE WHEN name = 'A' THEN name END AS 'name A',
    CASE WHEN name = 'B' THEN name END AS 'name B',
    CASE WHEN name = 'C' THEN name END AS 'name C',
    CASE WHEN name = 'D' THEN name END AS 'name D'
FROM crtrans;
SELECT
    '1' AS 'id',
    CASE WHEN name = 'A' THEN name END AS 'name A',
    CASE WHEN name = 'B' THEN name END AS 'name B',
    CASE WHEN name = 'C' THEN name END AS 'name C',
    CASE WHEN name = 'D' THEN name END AS 'name D'
FROM crtrans;
SELECT
    '1' AS 'id',
    MIN(CASE WHEN name = 'A' THEN name END) AS 'name A',
    MIN(CASE WHEN name = 'B' THEN name END) AS 'name B',
    MIN(CASE WHEN name = 'C' THEN name END) AS 'name C',
    MIN(CASE WHEN name = 'D' THEN name END) AS 'name D'
FROM crtrans;
SELECT
    '1' AS 'id',
    MAX(CASE WHEN name = 'A' THEN name END) AS 'name A',
    MAX(CASE WHEN name = 'B' THEN name END) AS 'name B',
    MAX(CASE WHEN name = 'C' THEN name END) AS 'name C',
    MAX(CASE WHEN name = 'D' THEN name END) AS 'name D'
FROM crtrans;

-- 활용
SELECT dept_id FROM employees;
SELECT dept_id, dept_name FROM departments;

SELECT 
    CASE WHEN dept_id = 10 THEN dept_id END AS 'SALES_PARTNER',
    CASE WHEN dept_id = 20 THEN dept_id END AS 'MANAGEMENT',
    CASE WHEN dept_id = 30 THEN dept_id END AS 'ACCOUNTING',
    CASE WHEN dept_id = 40 THEN dept_id END AS 'RESEARCH'
FROM employees;

SELECT 
    COUNT(CASE WHEN dept_id = 10 THEN dept_id END) AS 'SALES_PARTNER',
    COUNT(CASE WHEN dept_id = 20 THEN dept_id END) AS 'MANAGEMENT',
    COUNT(CASE WHEN dept_id = 30 THEN dept_id END) AS 'ACCOUNTING',
    COUNT(CASE WHEN dept_id = 40 THEN dept_id END) AS 'RESEARCH'
FROM employees;

SELECT d.dept_name
FROM departments d INNER JOIN employees e
ON d.dept_id = e.dept_id;

SELECT 
    CASE WHEN d.dept_name = 'MANAGEMENT' THEN '1' END AS 'MANAGEMENT',
    CASE WHEN d.dept_name = 'ACCOUTING' THEN '1' END AS 'ACCOUNTING',
    CASE WHEN d.dept_name = 'RESEARCH' THEN '1' END AS 'RESEARCH',
    CASE WHEN d.dept_name = 'SALES_PARTNER' THEN '1' END AS 'SALES_PARTNER'
FROM departments d INNER JOIN employees e
ON d.dept_id = e.dept_id;

SELECT 
    SUM(CASE WHEN d.dept_name = 'MANAGEMENT' THEN '1' END) AS 'MANAGEMENT',
    SUM(CASE WHEN d.dept_name = 'ACCOUTING' THEN '1' END) AS 'ACCOUNTING',
    SUM(CASE WHEN d.dept_name = 'RESEARCH' THEN '1' END) AS 'RESEARCH',
    SUM(CASE WHEN d.dept_name = 'SALES_PARTNER' THEN '1' END) AS 'SALES_PARTNER'
FROM departments d INNER JOIN employees e
ON d.dept_id = e.dept_id;

SELECT 
    COUNT(CASE WHEN d.dept_name = 'MANAGEMENT' THEN '1' END) AS 'MANAGEMENT',
    COUNT(CASE WHEN d.dept_name = 'ACCOUTING' THEN '1' END) AS 'ACCOUNTING',
    COUNT(CASE WHEN d.dept_name = 'RESEARCH' THEN '1' END) AS 'RESEARCH',
    COUNT(CASE WHEN d.dept_name = 'SALES_PARTNER' THEN '1' END) AS 'SALES_PARTNER'
FROM departments d INNER JOIN employees e
ON d.dept_id = e.dept_id;

-- Group By -> Join
SELECT 
    dept_name, count
FROM departments d INNER JOIN 
    (SELECT dept_id, COUNT(*) AS 'count' 
     FROM employees 
     GROUP BY dept_id) e
ON d.dept_id = e.dept_id;

SELECT 
    SUM(CASE WHEN dept_name = 'SALES_PARTNER' THEN count END) AS 'SALES_PARTNER',
    SUM(CASE WHEN dept_name = 'MANAGEMENT' THEN count END) AS 'MANAGEMENT',
    SUM(CASE WHEN dept_name = 'ACCOUTING' THEN count END) AS 'ACCOUNTING',
    SUM(CASE WHEN dept_name = 'RESEARCH' THEN count END) AS 'RESEARCH'
FROM departments d INNER JOIN 
    (SELECT dept_id, COUNT(*) AS 'count' 
     FROM employees 
     GROUP BY dept_id) e
ON d.dept_id = e.dept_id;



--===== 예제 2) Data 변경 : 행에서 컬럼으로 =====
CREATE TABLE rctrans
(name1 CHAR(2),
 name2 CHAR(2),
 name3 CHAR(3),
 name4 CHAR(4));
INSERT INTO rctrans VALUES('A','B','C','D');

SELECT name1 AS 'name' FROM rctrans
UNION ALL
SELECT name2 AS 'name' FROM rctrans
UNION ALL
SELECT name3 AS 'name' FROM rctrans
UNION ALL
SELECT name4 AS 'name' FROM rctrans;


CREATE TABLE copy_dual4 (id INT);
INSERT INTO copy_dual4 VALUES (1),(2),(3),(4);
SELECT c.*, r.* FROM rctrans r, copy_dual4 c; 
SELECT 
    CASE m.id
        WHEN 1 THEN m.name1
        WHEN 2 THEN m.name2
        WHEN 3 THEN m.name3
        WHEN 4 THEN m.name4
    END AS 'name'
FROM (SELECT c.*, r.* 
      FROM rctrans r, copy_dual4 c) m;

-- 활용
CREATE TABLE instsense
(inst1    INT,  inst2    INT,
 inst3    INT,  inst4    INT,
 inst5    INT,  inst6   INT,
 inst7    INT,  inst8   INT);
INSERT INTO instsense VALUES
    (7, 3, 5, 2, 4, 1, 5, 9), 
    (5, 1, 8, 7, 3, 6, 2, 0),
    (9, 4, 3, 7, 2, 4, 3, 9),
    (3, 7, 6, 5, 4, 8, 2, 6); 
SELECT t.inst, COUNT(*)
FROM(SELECT inst1 inst
FROM instsense
UNION ALL
SELECT inst2 inst
FROM instsense
UNION ALL
SELECT inst3 inst
FROM instsense
UNION ALL
SELECT inst4 inst
FROM instsense
UNION ALL
SELECT inst5 inst
FROM instsense
UNION ALL
SELECT inst6 inst
FROM instsense
UNION ALL
SELECT inst7 inst
FROM instsense
UNION ALL
SELECT inst8 inst  
FROM instsense) t
GROUP BY t.inst;

CREATE TABLE copy_dual8 (id INT);
INSERT INTO copy_dual8 VALUES (1),(2),(3),(4),(5),(6),(7),(8);
SELECT c.*, i.* FROM instsense i, copy_dual8 c;
SELECT 
    CASE ci.id
        WHEN 1 THEN ci.inst1
        WHEN 2 THEN ci.inst2
        WHEN 3 THEN ci.inst3
        WHEN 4 THEN ci.inst4
        WHEN 5 THEN ci.inst5
        WHEN 6 THEN ci.inst6
        WHEN 7 THEN ci.inst7
        WHEN 8 THEN ci.inst8
    END AS 'INST'
FROM (SELECT c.*, i.* 
      FROM instsense i, copy_dual8 c) ci;
SELECT t.INST, COUNT(*)
FROM (
    SELECT 
    CASE ci.id
        WHEN 1 THEN ci.inst1
        WHEN 2 THEN ci.inst2
        WHEN 3 THEN ci.inst3
        WHEN 4 THEN ci.inst4
        WHEN 5 THEN ci.inst5
        WHEN 6 THEN ci.inst6
        WHEN 7 THEN ci.inst7
        WHEN 8 THEN ci.inst8
    END AS 'INST'
    FROM (SELECT c.*, i.* 
          FROM instsense i, copy_dual8 c) ci
) t
GROUP BY t.INST;