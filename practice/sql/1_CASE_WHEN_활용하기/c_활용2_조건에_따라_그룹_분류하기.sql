CREATE TABLE lookup_group
(id INT,
 price INT);

INSERT INTO lookup_group
VALUES(1, 10),(2, 20),(3, 20),(4, 40),(5, 50),(6, 60),(7, 70),(8, 80),(9, 90),(10, 100);


--
SELECT MOD(id, 2), price
FROM lookup_group;

SELECT MOD(id, 2) AS 'Grade', SUM(price)
FROM lookup_group
GROUP BY MOD(id, 2);

SELECT 
    CASE WHEN MOD(id, 2) = 0 THEN 'even' ELSE 'odd' END AS 'Grade', 
    SUM(price)
FROM lookup_group
GROUP BY CASE WHEN MOD(id, 2) = 0 THEN 'even' ELSE 'odd' END;

SELECT 
    CASE WHEN MOD(id, 2) = 0 THEN 'even' ELSE 'odd' END AS 'Grade', 
    SUM(price)
FROM lookup_group
GROUP BY MOD(id, 2); -- 에러

-- 고민해보기
SELECT
    CASE WHEN c.id = 1 THEN l.Grade ELSE 'Total' END AS 'Grade',
    SUM(l.price) AS 'price' 
FROM (
    SELECT 
    CASE WHEN MOD(id, 2) = 0 THEN 'even' ELSE 'odd' END AS 'Grade', 
    SUM(price) AS 'price'
    FROM lookup_group
    GROUP BY CASE WHEN MOD(id, 2) = 0 THEN 'even' ELSE 'odd' END
) l, copy_dual2 c
GROUP BY CASE WHEN c.id = 1 THEN l.Grade ELSE 'Total' END;