
-- docker commit mariadb mariadb_img
-- docker run -d -v /home/jslee/mariadb_vol_cnf:/etc/mysql --name mariadb_vol -p 3308:3306 -e MARIADB_ROOT_PASSWORD=mariadb_vol mariadb_img
-- docker run -d --name broken-container --mount type=bind,source=$(pwd)/tmp,target=/usr 
-- docker inspect -f '{{json .Mounts}}' mariadb_vol

------------------ General Query Log --------------------
SHOW VARIABLES LIKE '%datadir'; 
SHOW VARIABLES LIKE '%error%';

SET GLOBAL error_log=1;
SET GLOBAL error_log_file='general.log';


------------------ General Query Log --------------------
SHOW VARIABLES LIKE '%general%';

SET GLOBAL general_log_file='general.log';
SET GLOBAL general_log=1;


------------------ Slow Query Log --------------------
SHOW VARIABLES LIKE '%slow_query%';
SHOW VARIABLES LIKE 'long_query_time';

SET GLOBAL slow_query_log_file='slow.log';
SET GLOBAL slow_query_log=1;
SET GLOBAL long_query_time=5;

