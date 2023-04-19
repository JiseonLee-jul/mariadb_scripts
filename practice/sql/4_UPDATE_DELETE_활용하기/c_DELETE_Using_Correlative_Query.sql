-- 테이블 생성하기 / itemdetails_history1, itemdetails_history2
CREATE TABLE itemdetails_history1 
AS SELECT * FROM itemdetails;
CREATE TABLE itemdetails_history2
AS SELECT * FROM itemdetails
   WHERE item_id >= 7;
INSERT INTO itemdetails_history2 
VALUES (21, 2, 3000),
       (22, 3, 7500),
       (23, 4, 4000),
       (24, 1, 2000),
       (25, 1, 1500),
       (26, 3, 9000);

SELECT * FROM itemdetails_history1;
SELECT * FROM itemdetails_history2;


-- itemdetails_history1 테이블에서 중복 데이터 제외하고 출력하기
SELECT * FROM itemdetails_history1
EXCEPT
SELECT * FROM itemdetails_history2;


-- itemdetails_history1 테이블에서 중복 데이터 제거하기
DELETE FROM itemdetails_history1
WHERE item_id IN (SELECT item_id
                  FROM itemdetails_history2);
SELECT * FROM itemdetails_history1;