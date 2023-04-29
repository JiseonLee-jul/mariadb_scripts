CREATE TABLE departments2
AS SELECT * FROM departments;

INSERT INTO departments2
SELECT * FROM departments;

CREATE TABLE departments2 LIKE departments;


-- DISTINCT
SELECT DISTINCT dept_id, dept_name, loc_id 
FROM departments2;

-- UNION 
SELECT 1, 'A', 1 FROM dual WHERE false;

SELECT 1, 'A', 1 WHERE false;

SELECT dept_id, dept_name, loc_id FROM departments2
UNION
SELECT 1, 'A', 1 FROM dual WHERE false;

EXPLAIN SELECT DISTINCT dept_id, dept_name, loc_id 
FROM departments2;

EXPLAIN SELECT dept_id, dept_name, loc_id FROM departments2
UNION
SELECT 1, 'A', 1 FROM dual WHERE false;
