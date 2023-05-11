SELECT * FROM setup_actors;
SELECT * FROM setup_objects;
SELECT * FROM setup_timers;


-- Performance Schema 메모리 사용량 설정하기
SELECT VARIABLE_NAME, VARIABLE_VALUE
FROM information_schema.global_variables
WHERE VARIABLE_NAME LIKE '%performance_schema%'
AND VARIABLE_NAME NOT IN ('performance_schema', 
                          'perfroamnce_schema_show_processlist');

SHOW VARIABLES LIKE '%performance_schema%';

SHOW GLOBAL STATUS LIKE 'perf%_lost';

-- Performance Schema setup 테이블을 활용하여 동적으로 설정 변경하기
UPDATE performance_schema.setup_instruments
SET 

-- setup_actors
SELECT 
    THREAD_ID, NAME, TYPE, PROCESSLIST_USER, PROCESSLIST_HOST, INSTRUMENTED, HISTORY
FROM performance_schema.threads; 

CREATE USER user1@localhost IDENTIFIED BY '1111';

UPDATE performance_schema.threads
SET INSTRUMENTED = 'NO', HISTORY = 'NO'
WHERE PROCESSLIST_USER = 'user1' AND PROCESSLIST_HOST = 'localhost';