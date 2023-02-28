------------------ General Log --------------------
SHOW VARIABLES LIKE '%datadir'; 
SHOW VARIABLES LIKE '%general%';

SET GLOBAL general_log=1;
SET GLOBAL general_log_file='general.log';