-- 테이블 생성
CREATE TABLE instsense
(inst1    INT,  inst2   INT,
 inst3    INT,  inst4   INT,
 inst5    INT,  inst6   INT,
 inst7    INT,  inst8   INT);
INSERT INTO instsense VALUES
(7, 3, 5, 2, 4, 1, 5, 9), 
(5, 1, 8, 7, 3, 6, 2, 0), 
(9, 4, 3, 7, 2, 4, 3, 9),
(3, 7, 6, 5, 4, 8, 2, 6); 


-- UNION ALL 활용
SELECT inst1 inst FROM instsense
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
SELECT inst8 inst FROM instsense;

SELECT t.inst, COUNT(*) AS 'count'
FROM (SELECT inst1 inst FROM instsense
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


-- CROSS JOIN 활용 방법
CREATE TABLE copy_dual8
(id INT);
INSERT INTO copy_dual8
VALUES(1),(2),(3),(4),(5),(6),(7),(8);


SELECT c.*, i.* FROM copy_dual8 c, instsense i;

SELECT 
    CASE ci.id 
        WHEN 1 THEN ci.inst1
        WHEN 2 THEN ci.inst2
        WHEN 3 THEN ci.inst3
        WHEN 4 THEN ci.inst4
        WHEN 5 THEN ci.inst5
        WHEN 6 THEN ci.inst6
        WHEN 7 THEN ci.inst7
        WHEN 8 THEN ci.inst8 END 'inst'
FROM (SELECT c.*, i.* FROM copy_dual8 c, instsense i) ci;

SELECT t.inst, COUNT(*) AS count
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


