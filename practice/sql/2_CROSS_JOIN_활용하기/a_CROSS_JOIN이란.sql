CREATE TABLE alphatext (name CHAR(2));
CREATE TABLE copy_dual4 (id INT);
INSERT INTO alphatext VALUES ('A'), ('B');
INSERT INTO copy_dual4 VALUES (1), (2), (3), (4);

SELECT * FROM alphatext;
SELECT * FROM copy_dual4;

SELECT * FROM alphatext CROSS JOIN copy_dual4;
SELECT * FROM alphatext, copy_dual4;
