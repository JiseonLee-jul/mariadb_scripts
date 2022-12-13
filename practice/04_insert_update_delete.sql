---------- 1. insert : 데이터 추가하기 -----------
desc beverage;

-- a. insert into ... {value/values} ... 
insert into beverage value (21, 'StrawberryFrappuccino', 'Frappuccino', 7000, 'Y');
insert into beverage values (22, 'MatchaFrappuccino', 'Frappuccino', 6500, 'Y');
insert into beverage (name, category, price, show_flag) value ('FlatWhite', 'HotCoffees', 5000, 'Y');
insert into beverage (category, name, show_flag, price) value ('HotTeas', 'GrapefruitHoneyBlackTea', 'Y', 5500);

-- b. insert into ... set ...
insert into 