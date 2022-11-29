use test

drop table if exists bloat_table_comp;

create table bloat_table_comp ROW_FORMAT=COMPRESSED as select * from info.COLUMNS;

insert into bloat_table_comp select * from bloat_table_comp;
insert into bloat_table_comp select * from bloat_table_comp;
insert into bloat_table_comp select * from bloat_table_comp;
insert into bloat_table_comp select * from bloat_table_comp;
insert into bloat_table_comp select * from bloat_table_comp;
insert into bloat_table_comp select * from bloat_table_comp;
insert into bloat_table_comp select * from bloat_table_comp;

select count(*) as "count :" from bloat_table_comp;

select table_name, data_length/1024/1024 as mb from info.TABLES where table_name='bloat_table_comp';
