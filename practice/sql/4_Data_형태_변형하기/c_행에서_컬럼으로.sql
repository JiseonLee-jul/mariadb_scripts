CREATE TABLE rctrans
(name1 CHAR(2),
 name2 CHAR(2),
 name3 CHAR(3),
 name4 CHAR(4));

INSERT INTO rctrans
VALUES('A','B','C','D');

SELECT name1 'name'
FROM rctrans
UNION ALL
SELECT name2
FROM rctrans
UNION ALL
SELECT name3
FROM rctrans
UNION ALL
SELECT name4
FROM rctrans;

CREATE TABLE copy_dual4 (id INT);
INSERT VALUES copy_dual4 INTO (1), (2), (3), (4);

SELECT c.*, r.*
FROM rctrans r, copy_dual4 c;

SELECT 
    CASE m.id
        WHEN 1 THEN m.name1
        WHEN 2 THEN m.name2
        WHEN 3 THEN m.name3
        WHEN 4 THEN m.name4 END 'name'
FROM (SELECT c.*, r.*
      FROM rctrans r, copy_dual4 c) m;

