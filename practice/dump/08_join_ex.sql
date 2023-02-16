---- JOIN 실습데이터 생성
CREATE TABLE t1 (col1 CHAR(1));
CREATE TABLE t2 (col1 CHAR(1), col2 INT);
INSERT INTO t1 VALUES ('A'), ('C'), ('D'), ('B'), ('D'), ('A');
INSERT INTO t2 VALUES ('A', 1), ('B', 2), ('C', 3), ('E', 5);
SELECT * FROM t1;
SELECT * FROM t2;
