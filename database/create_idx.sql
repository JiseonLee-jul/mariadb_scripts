use shoppingmall;

create index product_goods_no_pk on customer(cstmr_no);
create index product_goods_no_pk on employee(EMP_NO);
create index product_goods_no_pk on code(code_no);
create index product_goods_no_pk on product(goods_no);
create index product_goods_no_pk on purchase(prchs_no);

show index from customer\G;
show index from employee\G;
show index from code\G;
show index from product\G;
show index from purchase\G;