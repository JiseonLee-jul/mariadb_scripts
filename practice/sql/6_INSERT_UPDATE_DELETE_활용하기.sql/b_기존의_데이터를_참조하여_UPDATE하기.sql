-- 테이블 생성하기
CREATE TABLE itemdetails
(item_id INT,
 item_count INT,
 item_amt INT);
INSERT INTO itemdetails
VALUES(1, 2, NULL),(2, 3, NULL),(3, 4, NULL),(4, 1, NULL),(5, 1, NULL),(6, 3, NULL), 
      (7, 2, NULL),(8, 4, NULL),(9, 4, NULL),(10, 3, NULL),(11, 2, NULL),(12, 1, NULL);

CREATE TABLE items
(item_id INT,
 price INT);

INSERT INTO items
VALUES(1, 1500),(2, 2500),(3, 1000),(4, 2000),(5, 1500),(6, 3000),(7, 2000),(8, 1500),
      (9, 2500),(10, 1500),(11, 3500),(12, 4000);


-- UDPATE
UPDATE itemdetails m
SET item_amt = (SELECT m.item_count * s.price
                FROM items s
                WHERE m.item_id = s.item_id);
SELECT * FROM itemdetails;

