------------------ General Query Log --------------------
SHOW VARIABLES LIKE '%datadir'; 
SHOW VARIABLES LIKE '%general%';

SET GLOBAL general_log=1;
SET GLOBAL general_log_file='general.log';



------------------ Slow Query Log --------------------
SHOW VARIABLES LIKE '%slow_query%';
SHOW VARIABLES LIKE 'long_query_time';

SET GLOBAL slow_query_log=1;
SET GLOBAL slow_query_log_file='slow.log';
SET GLOBAL long_query_time=5;