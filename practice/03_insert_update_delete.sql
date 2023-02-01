---------- 1. INSERT : 데이터 추가하기 -----------
USE cafe;
DESC beverage;
SELECT * FROM beverage;

---- a. INSERT INTO ... {VALUE/VALUES} ... 
-- INSERT INTO에서 칼럼명 지정 안 할거면 값 다 넣어줘야
INSERT INTO beverage VALUE (21, 'StrawberryFrappuccino', 'Frappuccino', 7000); 
INSERT INTO beverage
    VALUE (22, 'AlmondChocolateMilk', 'ColdDrinks', 4000),
          (23, 'AppleJuice', 'ColdDrinks', 5000);

INSERT INTO beverage VALUE ('FlatWhite', 'HotCoffees', 5000); -- 에러
INSERT INTO beverage (name, category, price) VALUE ('FlatWhite', 'HotCoffees', 5000);
INSERT INTO beverage (category, name, price) VALUE ('HotTeas', 'GrapefruitHoneyBlackTea', 5500);

INSERT INTO beverage (name, category, price) VALUE ('YujaTea', 'HotTeas', NULL);
INSERT INTO beverage (name, category) VALUE ('CaffeMocha', 'HotCoffees');

---- b. INSERT INTO ... SELECT ...
CREATE TABLE beverage_count (
    beverage_id int,
    beverage_cnt int
);

INSERT INTO beverage_count 
    SELECT beverage_id, sum(beverage_cnt) 
    FROM orderdetails
    GROUP BY beverage_id;


CREATE TABLE beverage2 LIKE beverage;
INSERT INTO beverage2
    SELECT * FROM beverage;


---- c. INSERT INTO ... SET ...
INSERT INTO beverage SET name = 'SweetPotatoLatte', category = 'HotDrinks', price = 6000;


---- d INSERT 옵션 : RETURNING 
INSERT INTO beverage (name, category, price) VALUE ('Espresso', 'HotCoffees', 3000) 
    RETURNING *;
INSERT INTO beverage (name, category, price) VALUE ('EnglishBreakfastTea', 'HotTeas', 5000) 
    RETURNING concat_ws('_', category, name) AS 'concat_column',  price, price*2;
INSERT INTO beverage (name, category, price) VALUE ('MatchaLatte', 'HotDrinks', 6000) 
    RETURNING count(*); -- 에러


---- d INSERT 옵션 : IGNORE
INSERT INTO beverage 
    VALUE (31, 'MatchaLatte', 'HotDrinks', 6000),
          (31, 'JavaChipFrappuccino', 'Frappuccino', 6500),
          (32, 'DolceLatte', 'HotCoffees', 6500); --에러

INSERT IGNORE INTO beverage 
    VALUE (31, 'MatchaLatte', 'HotDrinks', 6000),
          (31, 'JavaChipFrappuccino', 'Frappuccino', 6500),
          (32, 'DolceLatte', 'HotCoffees', 6500);

SHOW WARNINGS;


INSERT INTO customer(name, phone)
    VALUE ('Ellie', NULL);

INSERT IGNORE INTO customer(name, phone)
    VALUE ('Ellie', NULL);


---------- 2. UPDATE : 데이터 수정하기 -----------
---- a. single table syntax
SELECT * FROM beverage WHERE name = 'PinkDrink';
UPDATE beverage SET price = 6500 WHERE name = 'PinkDrink';

SELECT * FROM beverage WHERE price = 7500;
UPDATE beverage SET price = 8000 WHERE price = 7500;
SELECT * FROM beverage WHERE price = 8000;

SELECT * FROM beverage WHERE price = (SELECT min(price) FROM beverage);
UPDATE beverage SET price = price + 500 WHERE price = (SELECT min(price) FROM beverage);
SELECT * FROM beverage WHERE name = 'Espresso';

-- where 조건 사용 주의
UPDATE beverage_count SET beverage_cnt=43;


---------- 3. DELETE : 데이터 수정하기 -----------
---- a. single table syntax
SELECT * FROM beverage;
DELETE FROM beverage WHERE name = 'JavachipFrappuccino';
DELETE FROM beverage WHERE price = 5000 RETURNING *; 

DELETE FROM beverage WHERE name IN (SELECT name FROM beverage where id > 20);
SELECT count(*) FROM beverage;

-- where 조건 사용 주의
DELETE FROM beverage_count;
