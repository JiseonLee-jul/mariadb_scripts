DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test

DROP TABLE IF EXISTS mytable;
CREATE TABLE mytable(code int, active int, total int);

DELIMITER $$
CREATE PROCEDURE myproc()
BEGIN
    DECLARE i int DEFAULT 0;
    WHILE i <= 20000 DO
        INSERT INTO mytable (code, active, total) VALUES (i, 1, 1);
        SET i = i + 1;
    END WHILE;
END $$
DELIMITER ;
