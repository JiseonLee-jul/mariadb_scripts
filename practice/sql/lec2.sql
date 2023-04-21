-- a. 컬럼에서 행으로 
CREATE CASE_example (name CHAR(2));
INSERT INTO CASE_example VALUES ('A'), ('B'), ('C'), ('D');
SELECT * FROM CASE_example;
SELECT 
      CASE WHEN name = 'A' THEN 'Grade A' ELSE 'Grade BCD' END
FROM CASE_example; 


CREATE TABLE crtrans (name CHAR(2));
INSERT INTO crtrans VALUES('A'),('B'),('C'),('D');
SELECT * FROM crtrans;

SELECT CASE WHEN name = 'A' THEN name END 'name A',
      CASE WHEN name = 'B' THEN name END 'name B',
      CASE WHEN name = 'C' THEN name END 'name C',
      CASE WHEN name = 'D' THEN name END 'name D'
FROM crtrans;

SELECT '1' AS 'id', CASE WHEN name = 'A' THEN name END 'name A',
      CASE WHEN name = 'B' THEN name END 'name B',
      CASE WHEN name = 'C' THEN name END 'name C',
      CASE WHEN name = 'D' THEN name END 'name D'
FROM crtrans;

SELECT '1' AS 'id', 
      MIN(CASE WHEN name = 'A' THEN name END) 'name A',
      MIN(CASE WHEN name = 'B' THEN name END) 'name B',
      MIN(CASE WHEN name = 'C' THEN name END) 'name C',
      MIN(CASE WHEN name = 'D' THEN name END) 'name D'
FROM crtrans
GROUP BY id;

SELECT 
      MIN(CASE WHEN name = 'A' THEN name END) 'name A',
      MIN(CASE WHEN name = 'B' THEN name END) 'name B',
      MIN(CASE WHEN name = 'C' THEN name END) 'name C',
      MIN(CASE WHEN name = 'D' THEN name END) 'name D'
FROM crtrans;



-- b. 컬럼에서 행으로 활용 : 부서별 직원 수 출력하기
SELECT 
	CASE WHEN dept_id = 10 THEN dept_id END 'SALES_PARTNER', 
	CASE WHEN dept_id = 20 THEN dept_id END 'MANAGEMENT', 
	CASE WHEN dept_id = 30 THEN dept_id END 'ACCOUTING', 
	CASE WHEN dept_id = 40 THEN dept_id END 'RESEARCH'
FROM employees;

SELECT 
	COUNT(CASE WHEN dept_id = 10 THEN dept_id END) 'SALES_PARTNER', 
	COUNT(CASE WHEN dept_id = 20 THEN dept_id END) 'MANAGEMENT', 
	COUNT(CASE WHEN dept_id = 30 THEN dept_id END) 'ACCOUTING', 
	COUNT(CASE WHEN dept_id = 40 THEN dept_id END) 'RESEARCH'
FROM employees;


SELECT d.*, e.*
FROM departments d INNER JOIN employees e
ON d.dept_id = e.dept_id;

SELECT 
       CASE WHEN d.dept_name = 'MANAGEMENT' THEN 1 END AS 'MANAGEMENT',
       CASE WHEN d.dept_name = 'ACCOUTING' THEN 1 END AS 'ACCOUTING',
       CASE WHEN d.dept_name = 'RESEARCH' THEN 1 END AS 'RESEARCH',
       CASE WHEN d.dept_name = 'SALES_PARTNER' THEN 1 END AS 'SALES_PARTNER'
FROM departments d INNER JOIN employees e
ON d.dept_id = e.dept_id;

SELECT 
       SUM(CASE WHEN d.dept_name = 'MANAGEMENT' THEN 1 END) AS 'MANAGEMENT',
       SUM(CASE WHEN d.dept_name = 'ACCOUTING' THEN 1 END) AS 'ACCOUTING',
       SUM(CASE WHEN d.dept_name = 'RESEARCH' THEN 1 END) AS 'RESEARCH',
       SUM(CASE WHEN d.dept_name = 'SALES_PARTNER' THEN 1 END) AS 'SALES_PARTNER'
FROM departments d INNER JOIN employees e
ON d.dept_id = e.dept_id;


-- c. 행에서 컬럼으로 
CREATE TABLE rctrans
(name1 CHAR(2),
 name2 CHAR(2),
 name3 CHAR(3),
 name4 CHAR(4));

INSERT INTO rctrans
VALUES('A','B','C','D');

SELECT name1 'name' FROM rctrans
UNION ALL
SELECT name2 FROM rctrans
UNION ALL
SELECT name3 FROM rctrans
UNION ALL
SELECT name4 FROM rctrans;

SELECT name1 'name' FROM rctrans
UNION 
SELECT name1 FROM rctrans
UNION 
SELECT name3 FROM rctrans;


CREATE TABLE copy_dual4
(id INT);

INSERT INTO copy_dual4
VALUES(1),(2),(3),(4);



SELECT CASE m.id 
       WHEN 1 THEN m.name1
       WHEN 2 THEN m.name2
       WHEN 3 THEN m.name3
       WHEN 4 THEN m.name4 END 'name'
FROM (SELECT c.*, r.*
      FROM rctrans r, copy_dual4 c) m;


-- d. 행에서 컬럼으로 활용 : 미세먼지 등급별 횟수 조회하기
CREATE TABLE instsense
(inst1    INT,  inst2   INT,
 inst3    INT,  inst4   INT,
 inst5    INT,  inst6   INT,
 inst7    INT,  inst8   INT);

INSERT INTO instsense
VALUES(7, 3, 5, 2, 4, 1, 5, 9), (5, 1, 8, 7, 3, 6, 2, 0), (9, 4, 3, 7, 2, 4, 3, 9),(3, 7, 6, 5, 4, 8, 2, 6); 

SELECT t.inst, COUNT(*)
FROM(SELECT inst1 inst FROM instsense
UNION ALL
SELECT inst2 inst FROM instsense
UNION ALL
SELECT inst3 inst FROM instsense
UNION ALL
SELECT inst4 inst FROM instsense
UNION ALL
SELECT inst5 inst FROM instsense
UNION ALL
SELECT inst6 inst FROM instsense
UNION ALL
SELECT inst7 inst FROM instsense
UNION ALL
SELECT inst8 inst FROM instsense) t
GROUP BY t.inst
ORDER BY t.inst;


CREATE TABLE copy_dual8
(id INT);

INSERT INTO copy_dual8
VALUES(1),(2),(3),(4),(5),(6),(7),(8);

SELECT c.*, i.* FROM copy_dual8 c, instsense i;

SELECT CASE ci.id 
           WHEN 1 THEN ci.inst1
           WHEN 2 THEN ci.inst2
           WHEN 3 THEN ci.inst3
           WHEN 4 THEN ci.inst4
           WHEN 5 THEN ci.inst5
           WHEN 6 THEN ci.inst6
           WHEN 7 THEN ci.inst7
           WHEN 8 THEN ci.inst8  END 'inst'
FROM (SELECT c.*, i.* FROM copy_dual8 c, instsense i)

SELECT t.inst, COUNT(*)
FROM (SELECT CASE ci.id 
           WHEN 1 THEN ci.inst1
           WHEN 2 THEN ci.inst2
           WHEN 3 THEN ci.inst3
           WHEN 4 THEN ci.inst4
           WHEN 5 THEN ci.inst5
           WHEN 6 THEN ci.inst6
           WHEN 7 THEN ci.inst7
           WHEN 8 THEN ci.inst8  END 'inst'
FROM (SELECT c.*, i.* FROM copy_dual8 c, instsense i) ci) t
GROUP BY t.inst
ORDER BY t.inst;
