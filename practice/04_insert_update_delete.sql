---------- 1. insert : 데이터 추가하기 -----------
use cafe;
desc beverage;

-- a. INSERT INTO ... {VALUE/VALUES} ... 
insert into beverage value (21, 'StrawberryFrappuccino', 'Frappuccino', 7000, 'Y');
insert into beverage values (22, 'MatchaFrappuccino', 'Frappuccino', 6500, 'Y');
insert into beverage (name, category, price, show_flag) value ('FlatWhite', 'HotCoffees', 5000, 'Y');
insert into beverage (category, name, show_flag, price) value ('HotTeas', 'GrapefruitHoneyBlackTea', 'Y', 5500);

-- b. INSERT INTO ... SET ...
insert into customer set name 

-- c.INSERT INTO ... SELECT ...
create table test (
    kcal_mean int,
    fat_max int,
    sugar_min int
)

insert into test 
    select mean(kcal), max(fat), min(sugar) 
    from nutrition_info;

-- d. INSERT 고급 옵션 : IGNORE


-- e. INSERT 고급 옵션 : ON DUPLICATE KEY UPDATE


-- f. LOAD DATA



---------- 2. update : 데이터 수정하기 -----------
