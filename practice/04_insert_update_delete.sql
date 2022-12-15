---------- 1. insert : 데이터 추가하기 -----------
use cafe;
desc beverage;

-- a. INSERT INTO ... {VALUE/VALUES} ... 
-- insert into에서 칼럼명 지정 안 할거면 값 다 넣어줘야
insert into beverage value (21, 'StrawberryFrappuccino', 'Frappuccino', 7000); -- 모든 칼럼 다 선택
insert into beverage values (22, 'MatchaFrappuccino', 'Frappuccino', 6500);
insert into beverage (name, category, price, show_flag) value ('FlatWhite', 'HotCoffees', 5000);
insert into beverage (category, name, price) value ('HotTeas', 'GrapefruitHoneyBlackTea', 5500);


-- b. INSERT INTO ... SET ...
insert into customer set name = 

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
insert 

-- e. INSERT 고급 옵션 : ON DUPLICATE KEY UPDATE


-- f. LOAD DATA



---------- 2. update : 데이터 수정하기 -----------
