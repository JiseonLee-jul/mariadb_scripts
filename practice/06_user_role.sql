------------- 1. USER  --------------
-- a. USER 확인하기
\s
status

SELECT USER();
SELECT * FROM mysql.user WHERE user = 'root' AND host = 'localhost'\G
SELECT user, host FROM mysql.user;

-- b. USER 생성하기
CREATE USER 'user1'@'localhost' IDENTIFIED BY '1111';
CREATE USER 'user1'@'%' IDENTIFIED BY '1111';
SELECT user, host FROM mysql.user WHERE user = 'user1';
CREATE USER 'user1'@'%' IDENTIFIED BY '1111'; --에러

-- c. USER 변경하기
SELECT user, host, password FROM mysql.user WHERE user = 'user1' AND host = 'localhost'; 
ALTER USER 'user1'@'%' IDENTIFIED BY '2222';

-- [user1 user로 접속] : mariadb -u user1 -h localhost -p
SELECT USER();
ALTER USER 'user1'@'localhost' ACCOUNT LOCK; --에러
-- [root user로 접속] : mariadb -u root -h localhost -p
ALTER USER 'user1'@'localhost' ACCOUNT LOCK;
ALTER USER 'user1'@'localhost' ACCOUNT UNLOCK;


-- c. USER 삭제하기
DROP USER 'user1'@'%';
SELECT user, host FROM mysql.user;
DROP USER 'user2'@'localhost'; -- 에러



------------- 2. Privilege -------------
-- a. 권한 확인하기
SHOW GRANTS FOR 'user1'@'localhost';
SELECT * FROM mysql.user WHERE user = 'user1'\G;
SELECT * FROM information_schema.user_privileges WHERE GRANTEE = "'user1'@'localhost'"\G -- USAGE
SELECT * FROM information_schema.schema_privileges WHERE GRANTEE = "'user1'@'localhost'"\G
SELECT * FROM information_schema.table_privileges WHERE GRANTEE = "'user1'@'localhost'"\G
SELECT * FROM information_schema.column_privileges WHERE GRANTEE = "'user1'@'localhost'"\G


-- b. 권한 부여하기
GRANT ALL PRIVILEGES ON *.* TO 'user2'@'localhost' IDENTIFIED BY '2222';
-- [user1 user로 접속] : mariadb -u user1 -h localhost -p
SHOW DATBASES; 
CREATE DATABASE user_test; --에러
-- [root user로 접속] : mariadb -u root -h localhost -p
GRANT show databases ON *.* TO 'user1'@'localhost';
GRANT create ON *.* TO 'user1'@'localhost';
SHOW GRANTS FOR 'user1'@'localhost';
-- [user1 user로 접속] : mariadb -u user1 -h localhost -p
SHOW DATBASES; 
CREATE DATABASE user_db;
USE user_db;
CREATE TABLE user_table(col1 int, col2 int);

SELECT * FROM user_table; -- 에러
INSERT INTO user_table VALUE (1, 2); -- 에러

-- [root user로 접속] : mariadb -u root -h localhost -p
GRANT create user, select, insert ON *.* TO 'user1'@'localhost';
GRANT select, insert ON user_db.* TO 'user1'@'localhost';
-- [user1 user로 접속] : mariadb -u user1 -h localhost -p


FLUSH PRIVILEGES;
SELECT * FROM information_schema.user_privileges WHERE GRANTEE = "'user1'@'localhost'"\G -- USAGE



