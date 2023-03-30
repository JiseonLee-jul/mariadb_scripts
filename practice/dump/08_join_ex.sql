-- [DATABASE : join_ex / TABLE : employees, departments]
DROP DATABASE IF EXISTS join_ex;
CREATE DATABASE join_ex;
USE join_ex;

CREATE OR REPLACE TABLE employees (id INT, department_id INT, name VARCHAR(20));
CREATE OR REPLACE TABLE departments (id INT, name VARCHAR(20));
INSERT INTO employees VALUES (1, 2, 'Amily'), (2, 3, 'Ash'), (3, 4, 'Maia'), (4, 1, 'Kai'), (5, 3, 'Ean');
INSERT INTO departments VALUES (1, 'A'), (2, 'B'), (3, 'C'), (5, 'E');

-- [DATABASE : cafe / TABLE : salary]
USE cafe;

CREATE OR REPLACE TABLE salary(emp_id INT, salary INT, from_date DATE);
INSERT INTO salary VALUES
	(1, NULL, NULL),
	(2, NULL, NULL),
	(3, NULL, NULL),
	(4, NULL, NULL),
	(5, NULL, NULL),
	(6, NULL, NULL),
	(7, NULL, NULL),
	(8, NULL, NULL),
	(9, NULL, NULL),
	(10, NULL, NULL),
	(11, NULL, NULL),
	(12, NULL, NULL),
	(13, NULL, NULL),
	(14, NULL, NULL),
	(15, NULL, NULL);
23232



