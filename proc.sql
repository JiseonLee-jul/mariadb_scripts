drop database if exists test;

create database test;

use test

drop table if exists mytable;

create table mytable(code int, active int, total int);

delimiter $$
CREATE PROCEDURE myproc()
BEGIN
    DECLARE i int DEFAULT 0;
    WHILE i <= 100000 DO
        INSERT INTO mytable (code, active, total) VALUES (i, 1, 1);
        SET i = i + 1;
    END WHILE;
END $$
delimiter ;