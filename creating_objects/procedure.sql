DELIMITER //

CREATE PROCEDURE test_proc
(
    OUT param1 char(10) character set 'utf8' collate 'utf8mb4'
)
 BEGIN
  declare declaring varchar(500);
  set declaring=concat('select *');
  set declaring=concat(declaring, 'from', emp_no,'where 1=1');
  SELECT concat('a') INTO param1 FROM t;
 END;
//

DELIMITER ;

CALL simpleproc(@a);

SELECT @a;
--+------+
--| @a   |
--+------+
--|    1 |
--+------+