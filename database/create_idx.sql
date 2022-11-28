use test2;

create index product_goods_no_pk on product(goods_no);
show index from product\G;