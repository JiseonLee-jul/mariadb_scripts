create view seoul_customer(cstmr_nm, telno);
as select cstmr_nm, telno
from customer
where adres='서울특별시';