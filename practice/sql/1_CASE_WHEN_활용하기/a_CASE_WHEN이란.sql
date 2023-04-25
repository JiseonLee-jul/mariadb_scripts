CREATE TABLE CASE_example
(name CHAR(2));

INSERT INTO CASE_example
VALUES('A'),('B'),('C'),('D');

SELECT * FROM CASE_example;

SELECT CASE WHEN name = 'A' THEN 'Grade A' ELSE 'Grade BCD' END
FROM CASE_example;
