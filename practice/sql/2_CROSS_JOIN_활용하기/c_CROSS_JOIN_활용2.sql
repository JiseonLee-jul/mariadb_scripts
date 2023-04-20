-- 테이블 생성하기
CREATE TABLE expenseincome (class CHAR(2), 
                            costs INT);

INSERT INTO expenseincome
VALUES ('A',9000),('A',2500),('A',1500),
       ('B',4000),('B',6700),('B',5600),('B',4700),('B',1000),
       ('C',3200),('C',3500),('C',8000),('C',5000),('C',7000),
       ('D',5500),('D',3200),('D',3800),('D',2600),('D',4900),('D',6600);

-- 클래스별로 수입 및 지출 내역 구분하여 집계하기
SELECT 
    class, 
    SUM(costs) END AS tcosts
FROM expenseincome
GROUP BY class;

SELECT 
    class, 
    CASE WHEN class='D' THEN SUM(costs) * -1 ELSE SUM(costs) END AS tcosts
FROM expenseincome
GROUP BY class;

-- 순이익 계산하여 출력하기
SELECT 
    c.*, m.*
FROM (SELECT 
        class, 
        CASE WHEN class='D' THEN SUM(costs) * -1 ELSE SUM(costs) END AS tcosts
      FROM expenseincome
      GROUP BY class) m, copy_dual2 c
ORDER BY 1, 2;

SELECT 
    CASE WHEN c.id=1 THEN class ELSE 'Total' END AS 'Class', 
    SUM(m.tcosts)
FROM (SELECT 
        class, 
        CASE WHEN class='D' THEN SUM(costs) * -1 ELSE SUM(costs) END AS tcosts
      FROM expenseincome
      GROUP BY class) m, copy_dual2 c
GROUP BY CASE WHEN c.id=1 THEN class ELSE 'Total' END;

-- notes 칼럼 출력하기
SELECT 
    CASE WHEN c.id=1 THEN class ELSE 'Total' END AS 'Class', 
    SUM(m.tcosts),
    CASE
        WHEN c.id = 1 THEN (CASE WHEN class = 'D' THEN '지출' ELSE '수입' END)
        WHEN c.id = 2 THEN 
            IF(SUM(m.tcosts) >= 0, '흑자', '적자')
    END AS 'notes'
FROM (SELECT 
        class, 
        CASE WHEN class='D' THEN SUM(costs) * -1 ELSE SUM(costs) END AS tcosts
      FROM expenseincome
      GROUP BY class) m, copy_dual2 c
GROUP BY CASE WHEN c.id=1 THEN class ELSE 'Total' END;

SELECT 
    CASE WHEN c.id=1 THEN class ELSE 'Total' END AS 'Class', 
    SUM(m.tcosts),
    CASE WHEN (CASE WHEN c.id=1 THEN class ELSE 'Total' END) = 'D' THEN '지출' 
                ELSE CASE WHEN (CASE WHEN c.id=1 THEN class ELSE 'Total' END) in ('A', 'B', 'C')  THEN '수입'
                ELSE CASE WHEN ((CASE WHEN c.id=1 THEN class ELSE 'Total' END)='Total' and SUM(m.tcosts) > 0) THEN '흑자' ELSE '적자'END END END 'notes'
FROM (SELECT 
        class, 
        CASE WHEN class='D' THEN SUM(costs) * -1 ELSE SUM(costs) END AS tcosts
      FROM expenseincome
      GROUP BY class) m, copy_dual2 c
GROUP BY CASE WHEN c.id=1 THEN class ELSE 'Total' END;


-- notes 칼럼 정상 작동 확인하기
CREATE TABLE expenseincome2
AS SELECT * FROM expenseincome;

UPDATE expenseincome2
SET costs = costs * 3
WHERE class = 'D';


SELECT 
    CASE WHEN c.id=1 THEN class ELSE 'Total' END AS 'Class', 
    SUM(m.tcosts),
    CASE
        WHEN c.id = 1 THEN (CASE WHEN class = 'D' THEN '지출' ELSE '수입' END)
        WHEN c.id = 2 THEN 
            IF(SUM(m.tcosts) >= 0, '흑자', '적자')
    END AS 'notes'
FROM (SELECT 
        class, 
        CASE WHEN class='D' THEN SUM(costs) * -1 ELSE SUM(costs) END AS tcosts
      FROM expenseincome2
      GROUP BY class) m, copy_dual2 c
GROUP BY CASE WHEN c.id=1 THEN class ELSE 'Total' END;


