-- 집합과 함수처리
select * from employees;

select * from employees
where dept_id = 10;

select sum(salary)
from employees;

select dept_id, sum(salary)
from employees
group by dept_id;

select substr(hire_date, 1, 4), count(*)
from employees
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


CREATE TABLE salgrade(grade CHAR(2), lowsalary INT, highsalary INT);
INSERT INTO salgrade VALUES 
    ('A', 4000000, 9999999),
    ('B', 3000000, 3999999),
    ('C', 2000000, 2999999),
    ('D', 0, 199999); 
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
