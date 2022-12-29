---- b. multiple table syntax
CREATE TABLE test2 (
    emp_no int,
    emp_class varchar(5)
);
INSERT INTO test2 
    VALUES (1, 'A'),
           (2, 'B'),
           (3, 'C');

CREATE TABLE test3 (
    emp_no int,
    emp_name varchar(5)
);
INSERT INTO test3 
    VALUES (1, 'aa'),
           (2, 'bb'),
           (4, 'dd');

UPDATE test2, test3 SET test2.emp_class = 'Z', test3.emp_name = 'zz' WHERE test2.emp_no = test3.emp_no;
UPDATE test2, test3 SET test2.emp_class=test3.emp_name WHERE test2.emp_no = test3.emp_no;