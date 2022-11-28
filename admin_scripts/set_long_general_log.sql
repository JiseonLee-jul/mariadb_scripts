SET GLOBAL log_output = 'TABLE';
SET GLOBAL general_log = 'ON';
SELECT * FROM mysql.general_log;

SET GLOBAL slow_query_log = 1;
SET GLOBAL long_query_time= 1;
SET GLOBAL log_queries_not_using_indexes= ON;

FLUSH LOGS;