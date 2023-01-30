-- vol 2 부터

-- index --



--  view --

-- view 생성
create view M_customer as select id, name, phone from customer where gender='M';

-- view 변경
ALTER VIEW M_customer AS SELECT id '번호', name '이름', phone '전화번호' FROM customer WHERE gender='M';

-- with read only
CREATE 
    DEFINER = CURRENT_USER 
    SQL SECURITY DEFINER 
    VIEW F_customer AS SELECT id '번호', name '이름', phone '전화번호' FROM customer WHERE gender = 'F';