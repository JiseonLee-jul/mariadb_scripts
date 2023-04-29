CREATE TABLE itemdetails_history1
AS SELECT * FROM itemdetails;

CREATE TABLE itemdetails_history2
AS SELECT * FROM itemdetails
   WHERE item_id >= 7;

INSERT INTO itemdetails_history2 
VALUES (21, 2, NULL),(22, 3, NULL),(23, 4, NULL),(24, 1, NULL),(25, 1, NULL),(26, 3, NULL);


SELECT * FROM itemdetails_history1
EXCEPT
SELECT * FROM itemdetails_history2;

DELETE FROM itemdetails_history1
WHERE item_id IN (SELECT item_id
                  FROM itemdetails_history2);

