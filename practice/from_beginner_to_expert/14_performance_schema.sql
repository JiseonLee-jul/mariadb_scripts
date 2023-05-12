-- setup_actors : 
SELECT * FROM setup_actors;
SELECT 
    THREAD_ID, NAME, TYPE, PROCESSLIST_USER, PROCESSLIST_HOST, INSTRUMENTED, HISTORY
FROM performance_schema.threads; 

CREATE USER user1@localhost IDENTIFIED BY '1111';

UPDATE performance_schema.threads
SET INSTRUMENTED = 'NO', HISTORY = 'NO'
WHERE PROCESSLIST_USER = 'user1' AND PROCESSLIST_HOST = 'localhost';

-- setup_objects : 
SELECT * FROM setup_objects;

-- setup_timers : 
SELECT * FROM setup_timers;

-- setup_instruments : 
SELECT 

-- setup_consumers : 


-- 
SELECT * FROM performance_timers;


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



-- setup_consumers : 
CALL sys.ps_setup_show_disabled_consumers();
CALL sys.ps_setup_show_enabled_consumers();

-- setup_instruments :
CALL sys.ps_setup_show_disabled_instruments();




---- 3. 활용
-- 호스트 접속 이력 확인
SELECT * FROM performance_schema.hosts;
SELECT
FROM performance_schema.hosts
WHERE CURRENT_CONNECTIONS > 0 AND HOST NOT IN ('NULL', 'localhost');

-- 총 메모리 사용량 확인
SELECT * FROM sys.memory_global_total;

SELECT thread_id, user, current_allocated 
FROM sys.memory_by_thread_by_current_bytes
LIMIT 10;