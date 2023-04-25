
-- 테이블 생성
CREATE TABLE departments3
AS SELECT * FROM departments;

-- 그냥 UPDATE
UPDATE departments3
SET loc_id = 101
WHERE dept_id = 10;

UPDATE departments3
SET loc_id = 102
WHERE dept_id = 20;

UPDATE departments3
SET loc_id = 203
WHERE dept_id = 30;

UPDATE departments3
SET loc_id = 505
WHERE dept_id = 40;


-- 한번에 업데이트
DELETE FROM departments3;
INSERT INTO departments3 SELECT * FROM departments;

SELECT dept_id, 
    CASE 
        WHEN dept_id=10 THEN 101  
        WHEN dept_id=20 THEN 102  
        WHEN dept_id=30 THEN 203 
        ELSE loc_id + 5 
    END 'UPDATE전 확인'
FROM departments3;

UPDATE departments3 
SET loc_id = (
    CASE 
        WHEN dept_id = 10 THEN 101
        WHEN dept_id = 20 THEN 102
        WHEN dept_id = 30 THEN 203
        ELSE loc_id + 5
    END
);

SELECT * FROM departments3;