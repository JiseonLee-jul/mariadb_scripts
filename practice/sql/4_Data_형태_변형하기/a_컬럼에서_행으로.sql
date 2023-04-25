
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

SELECT 
      MAX(CASE WHEN name = 'A' THEN name END) 'name A',
      MAX(CASE WHEN name = 'B' THEN name END) 'name B',
      MAX(CASE WHEN name = 'C' THEN name END) 'name C',
      MAX(CASE WHEN name = 'D' THEN name END) 'name D'
FROM crtrans;