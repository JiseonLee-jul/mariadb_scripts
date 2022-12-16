---------- 1. insert : 데이터 추가하기 -----------
use cafe;
desc beverage;

---- a. INSERT INTO ... {VALUE/VALUES} ... 
-- INSERT INTO에서 칼럼명 지정 안 할거면 값 다 넣어줘야
INSERT INTO beverage VALUE (21, 'StrawberryFrappuccino', 'Frappuccino', 7000); 
INSERT INTO beverage VALUES (22, 'MatchaFrappuccino', 'Frappuccino', 6500);
INSERT INTO beverage (name, category, price) VALUE ('FlatWhite', 'HotCoffees', 5000);
INSERT INTO beverage (category, name, price) VALUE ('HotTeas', 'GrapefruitHoneyBlackTea', 5500);

INSERT INTO beverage (name, category, price)
    VALUE ('AlmondChocolateMilk', 'ColdDrinks', 4000),
          ('AppleJuice', 'ColdDrinks', 5000);

-- 특정 값 삽입
INSERT INTO emp(name, start_date, salary) VALUE ('Rebecca', sys_date)


---- b. INSERT INTO ... SELECT ...
CREATE TABLE test (
    kcal_mean int,
    fat_max int,
    sugar_min int
)

INSERT INTO test 
    SELECT mean(kcal), max(fat), min(sugar) 
    FROM nutrition_info
    WHERE ;


---- c. INSERT INTO ... SET ...
INSERT INTO beverage SET name = 'SweetPotatoLatte', category = 'HotDrinks', price = 6000
    RETURNING * ;


---- d INSERT 옵션 : RETURNING 
INSERT INTO beverage (name, category, price) VALUE ('Espresso', 'HotCoffees', 3000) 
    RETURNING *;
INSERT INTO beverage (name, category, price) VALUE ('EnglishBreakfastTea', 'HotTeas', 5000) 
    RETURNING id, name;


---- e. INSERT 옵션 : IGNORE
insert 


---- f. INSERT 옵션 : ON DUPLICATE KEY UPDATE



---- g. LOAD DATA



---------- 2. update : 데이터 수정하기 -----------

