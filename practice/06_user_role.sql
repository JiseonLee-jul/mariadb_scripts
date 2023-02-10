------------- 1. USER  --------------
-- a. USER 확인하기
\s
status

SELECT USER(); -- SELECT SYSTEM_USER(); / SELECT SESSION_USER(); 
SELECT * FROM mysql.user WHERE user = 'root' AND host = 'localhost'\G
SELECT user, host FROM mysql.user;

-- b. USER 생성하기
CREATE USER 'user1'@'localhost' IDENTIFIED BY '1111';
CREATE USER 'user1'@'%' IDENTIFIED BY '1111';
SELECT user, host FROM mysql.user WHERE user = 'user1';
CREATE USER 'user1'@'%' IDENTIFIED BY '1111'; --에러

-- c. USER 변경하기
SELECT user, host, password FROM mysql.user WHERE user = 'user1' AND host = '%'; 
ALTER USER 'user1'@'%' IDENTIFIED BY '2222';

-- [user1 user로 접속] : mariadb -u user1 -h localhost -p"1111"
SELECT USER();
ALTER USER 'user1'@'localhost' ACCOUNT LOCK; --에러
-- [root user로 접속] : mariadb -u root -h localhost -p"mariadb"
ALTER USER 'user1'@'localhost' ACCOUNT LOCK;
ALTER USER 'user1'@'localhost' ACCOUNT UNLOCK;


-- c. USER 삭제하기
DROP USER 'user1'@'%';
SELECT user, host FROM mysql.user;
DROP USER 'user2'@'localhost'; -- 에러



------------- 2. PRIVILEGE -------------
-- a. 권한 확인하기
SHOW GRANTS FOR 'user1'@'localhost';
SHOW GRANTS;
SELECT * FROM mysql.user WHERE user = 'user1'\G
SELECT * FROM information_schema.user_privileges WHERE GRANTEE = "'user1'@'localhost'"\G


-- b. 권한 부여하기
-- [user1 user로 접속] : mariadb -u user1 -h localhost -p"1111"
SHOW DATABASES; 
CREATE DATABASE user_db; --에러

-- [root user로 접속] : mariadb -u root -h localhost -p"mariadb"
GRANT show databases, create ON *.* TO 'user1'@'localhost';
SHOW GRANTS FOR 'user1'@'localhost';
-- [user1 user로 접속] : mariadb -u user1 -h localhost -p"1111"
SHOW DATABASES; 
CREATE DATABASE user_db;
USE user_db;
CREATE TABLE user_table(col1 int, col2 int);
SHOW TABLES;

DESC user_table; -- 에러
INSERT INTO user_table VALUE (1, 2); -- 에러
SHOW GRANTS FOR 'user2'@'localhost'; -- 에러
CREATE USER 'user2'@'localhost' IDENTIFIED BY '2222'; -- 에러
GRANT CREATE ON *.* TO 'user2'@'localhost' IDENTIFIED BY '2222'; -- 에러

-- [root user로 접속] : mariadb -u root -h localhost -p"mariadb"
GRANT create user, reload ON *.* TO 'user1'@'localhost' with grant option;
GRANT select ON mysql.* TO 'user1'@'localhost';
GRANT select, insert, update, delete ON user_db.* TO 'user1'@'localhost';
SHOW GRANTS FOR 'user1'@'localhost';

-- [user1 user로 접속] : mariadb -u user1 -h localhost -p"1111"
USE user_db;
INSERT INTO user_table VALUE (1, 2);
SELECT * FROM user_table;

USE cafe;
SELECT * FROM beverage; --에러
INSERT INTO employee(name, start_date, salary) VALUE ('Jason', '2022-12-25', 350); -- 에러

-- user2 생성
GRANT select, insert, update, delete ON user_db.* TO 'user2'@'localhost' IDENTIFIED BY '2222';
-- SELECT user, host from mysql.user WHERE user='user2';
SHOW GRANTS FOR 'user2'@'localhost';
GRANT SUPER ON *.* TO 'user2'@'localhost'; --에러

-- c. 권한 회수하기
REVOKE SELECT ON user_db.* FROM 'user2'@'localhost';
SHOW GRANTS FOR 'user2'@'localhost';
-- [user2 user로 접속] : mariadb -u user2 -h localhost -p"2222"
USE user_db;
SELECT * FROM user_table; -- 에러

-- [user1 user로 접속] : mariadb -u user1 -h localhost -p"1111"
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'user1'@'localhost', 'user2'@'localhost';
-- [root user로 접속] : mariadb -u root -h localhost -p"mariadb"
SHOW GRANTS FOR 'user1'@'localhost';
SHOW GRANTS FOR 'user2'@'localhost';

------------- 3. ROLE -------------
-- 롤 정보 확인하기
SELECT * FROM mysql.user\G
SELECT user, host, is_role FROM mysql.user WHERE is_role = 'Y';
SELECT CURRENT_ROLE();

-- a. 롤 생성하기
CREATE ROLE dev_select;
GRANT SELECT ON *.* TO dev_select;
SELECT user, host, is_role FROM mysql.user WHERE is_role = 'Y';
SHOW GRANTS FOR dev_select;

SHOW GRANTS;
SELECT * FROM information_schema_applicable_roles;
SELECT * FROM mysql.roles_mapping;

--b. 롤 부여/활성화
GRANT dev_select TO 'user1'@'localhost';
SHOW GRANTS FOR 'user1'@'localhost';

SELECT * FROM mysql.roles_mapping;
-- [user1 user로 접속] : mariadb -u user1 -h localhost -p"1111"
GRANT dev_select TO 'user2'@'localhost'; --에러

SELECT CURRENT_ROLE();
SHOW GRANTS;
SET ROLE dev_select;
SET ROLE none;
-- [root user로 접속] : mariadb -u root -h localhost -p"mariadb"
SET DEFAULT ROLE dev_select FOR 'user1'@'localhost'; 
SELECT user, host, is_role, default_role FROM mysql.user;
-- [user1 user로 접속] : mariadb -u user1 -h localhost -p"1111"
SELECT CURRENT_ROLE();

SET DEFAULT ROLE NONE;


--c. 롤 제거하기
-- [root user로 접속] : mariadb -u root -h localhost -p"mariadb"
DROP ROLE dev_select;
SELECT user, host, is_role from mysql.user WHERE is_role = 'Y';



------------- 4. 활용 -------------
-- [root user로 접속] : mariadb -u root -h localhost -p"mariadb"
CREATE USER 'mgt'@'localhost' IDENTIFIED BY 'mgt';
CREATE USER 'sales'@'localhost' IDENTIFIED BY 'sales';

GRANT ALL PRIVILEGES ON cafe.* TO 'mgt'@'localhost';
GRANT ALL PRIVILEGES ON cafe.orders TO 'sales'@'localhost';
GRANT ALL PRIVILEGES ON cafe.orderdetails TO 'sales'@'localhost';

-- [mgt user로 접속] : mariadb -u mgt -p"mgt";
SHOW DATABASES;
USE cafe;
CREATE TABLE dept (id int, name varchar(20));
INSERT INTO dept value (1, 'Management');
SELECT * FROM dept;

-- [sales user로 접속] : mariadb -u sales -p"sales";
SHOW DATABASES;
USE cafe;
SHOW TABLES;
SELECT * FROM dept; --에러 

-- [root user로 접속] : mariadb -u root -h localhost -p"mariadb"
CREATE ROLE developer;
GRANT SELECT, INSERT, UPDATE, DELETE ON cafe.* TO developer;

CREATE USER 'dev1'@'localhost' IDENTIFIED BY 'dev1';
CREATE USER 'dev2'@'localhost' IDENTIFIED BY 'dev2';
GRANT developer TO 'dev1'@'localhost';
GRANT developer TO 'dev2'@'localhost';

-- [dev1 user로 접속] : mariadb -u dev1 -p"dev1";
SHOW DATABASES;
SELECT CURRENT_ROLE;

SET ROLE developer;
SELECT CURRENT_ROLE;
SHOW DATABASES;

USE cafe;
SHOW TABLES;
SELECT * FROM dept;

SELECT * FROM information_schema.applicable_roles;
SELECT * FROM mysql.roles_mapping;