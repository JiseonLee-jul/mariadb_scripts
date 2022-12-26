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
SHOW GRANTS;
SELECT * FROM mysql.user WHERE user = 'user1'\G;
SELECT * FROM information_schema.user_privileges WHERE GRANTEE = "'user1'@'localhost'"\G -- USAGE


-- b. 권한 부여하기
-- [user1 user로 접속] : mariadb -u user1 -h localhost -p
SHOW DATBASES; 
CREATE DATABASE user_db; --에러
CREATE USER 'user2'@'localhost' IDENTIFIED BY '2222'; --에러

-- [root user로 접속] : mariadb -u root -h localhost -p
GRANT show databases, create ON *.* TO 'user1'@'localhost';
GRANT create user, reload ON *.* TO 'user1'@'localhost' with grant option;
GRANT select, insert, update, delete ON user_db.* TO 'user1'@'localhost';
GRANT select ON mysql.* TO 'user1'@'localhost';
SHOW GRANTS FOR 'user1'@'localhost';
-- [user1 user로 접속] : mariadb -u user1 -h localhost -p
SHOW DATABASES; 
CREATE DATABASE user_db;
USE user_db;
CREATE TABLE user_table(col1 int, col2 int);
SHOW TABLES;

DESC user_table;
INSERT INTO user_table VALUE (1, 2);
SELECT * FROM user_table;

USE cafe;
SELECT * FROM beverage; --에러
INSERT INTO employee(name, start_date, salary) VALUE ('Jason', '2022-12-25', 350);

-- user2 생성
GRANT select, insert, update, delete ON user_db.* TO 'user2'@'localhost' IDENTIFIED BY '2222';
-- SELECT user, host from mysql.user WHERE user='user2';
SHOW GRANTS FOR 'user2'@'localhost';
GRANT SUPER ON *.* TO 'user2'@'localhost'; --에러

-- c. 권한 회수하기
REVOKE SELECT ON user_db.* FROM 'user2'@'localhost';
SHOW GRANTS FOR 'user2'@'localhost';
-- [user2 user로 접속] : mariadb -u user2 -h localhost -p
USE user_db;
SELECT * FROM user_table;

REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'user1'@'localhost', 'user2'@'localhost';
SHOW GRANTS FOR 'user1'@'localhost';
SHOW GRANTS FOR 'user2'@'localhost';


------------- 3. ROLE -------------
-- a. 롤 생성하기
CREATE ROLE dev_select;
GRANT SELECT ON *.* TO dev_select;
SELECT user, host, is_role from mysql.user WHERE is_role = 'Y';

--b. 롤 부여하기
GRANT dev_select TO 'user1'@'localhost';
SHOW GRANTS FOR 'user1'@'localhost';

SELECT CURRENT_ROLE();
SET ROLE dev_select;
SET ROLE none;
SELECT CURRENT_ROLE();

--c. 롤 제거하기
DROP ROLE dev_select;
SELECT user, host, is_role from mysql.user WHERE is_role = 'Y';