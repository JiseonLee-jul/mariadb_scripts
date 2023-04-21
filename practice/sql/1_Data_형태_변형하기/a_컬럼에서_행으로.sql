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