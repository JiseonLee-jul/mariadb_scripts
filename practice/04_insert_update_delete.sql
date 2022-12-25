---------- 1. INSERT : 데이터 추가하기 -----------
use cafe;
desc beverage;

---- a. INSERT INTO ... {VALUE/VALUES} ... 
-- INSERT INTO에서 칼럼명 지정 안 할거면 값 다 넣어줘야
INSERT INTO beverage VALUE (21, 'StrawberryFrappuccino', 'Frappuccino', 7000); 
INSERT INTO beverage
    VALUE (22, 'AlmondChocolateMilk', 'ColdDrinks', 4000),
          (23, 'AppleJuice', 'ColdDrinks', 5000);

INSERT INTO beverage VALUE ('FlatWhite', 'HotCoffees', 5000); -- 에러
INSERT INTO beverage (name, category, price) VALUE ('FlatWhite', 'HotCoffees', 5000);
INSERT INTO beverage (category, name, price) VALUE ('HotTeas', 'GrapefruitHoneyBlackTea', 5500);


---- b. INSERT INTO ... SELECT ...
CREATE TABLE test (
    beverage_id int,
    beverage_cnt int
);

INSERT INTO test 
    SELECT beverage_id, count(*) 
    FROM orderdetails
    GROUP BY beverage_id;


---- c. INSERT INTO ... SET ...
INSERT INTO beverage SET name = 'SweetPotatoLatte', category = 'HotDrinks', price = 6000;


---- d INSERT 옵션 : RETURNING 
INSERT INTO beverage (name, category, price) VALUE ('Espresso', 'HotCoffees', 3000) 
    RETURNING *;
INSERT INTO beverage (name, category, price) VALUE ('EnglishBreakfastTea', 'HotTeas', 5000) 
    RETURNING concat_ws('_', category, name),  price, price*2;
INSERT INTO beverage (name, category, price) VALUE ('MatchaLatte', 'HotDrinks', 5000) 
    RETURNING count(*); -- 에러


---- e. LOAD DATA



---------- 2. UPDATE : 데이터 수정하기 -----------
---- a. single table syntax
SELECT * FROM beverage WHERE name = 'PinkDrink';
UPDATE beverage SET price = 4000 WHERE name = 'PinkDrink';

SELECT * FROM beverage WHERE price=(SELECT min(price) FROM beverage);
UPDATE beverage SET price = price + 500 WHERE (SELECT min(price) FROM beverage);
SELECT * FROM beverage WHERE name = 'Espresso';

-- where 조건 사용 주의
UPDATE test SET beverage_cnt=20;

---- b. multiple table syntax
CREATE TABLE test2 (
    emp_no int,
    emp_class varchar(5)
);
INSERT INTO test2 
    VALUES (1, 'A'),
           (2, 'B'),
           (3, 'C');

CREATE TABLE test3 (
    emp_no int,
    emp_name varchar(5)
);
INSERT INTO test3 
    VALUES (1, 'aa'),
           (2, 'bb'),
           (4, 'dd');

UPDATE test2, test3 SET test2.emp_class = 'Z', test3.emp_name = 'zz' WHERE test2.emp_no = test3.emp_no;
UPDATE test2, test3 SET test2.emp_class=test3.emp_name WHERE test2.emp_no = test3.emp_no;


---------- 3. DELETE : 데이터 수정하기 -----------
---- a. single table syntax
SELECT * FROM beverage;
DELETE FROM beverage WHERE name = 'EnglishBreakfastTea';

SELECT count(*) FROM beverage;
DELETE FROM beverage WHERE name IN (SELECT name FROM beverage where id > 20);
SELECT count(*) FROM beverage;

---- b. multiple table syntax
DELETE t2, t3 FROM test2 t2, test3 t3 WHERE t2.emp_no=t3.emp_no;

