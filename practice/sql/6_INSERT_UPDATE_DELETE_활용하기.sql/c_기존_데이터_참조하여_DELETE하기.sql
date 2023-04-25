CREATE TABLE itemdetails_history1
AS SELECT * FROM itemdetails;

CREATE TABLE itemdetails_history2
AS SELECT * FROM itemdetails
   WHERE item_id >= 7;

SELECT * FROM itemdetails_history1
EXCEPT
SELECT * FROM itemdetails_history2;

DELETE FROM itemdetails_history1
WHERE item_id IN (SELECT item_id
                  FROM itemdetails_history2);

