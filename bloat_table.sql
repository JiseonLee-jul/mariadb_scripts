use test

drop table if exists bloat_table;

create table bloat_table as select * from info.COLUMNS;

insert into bloat_table select * from bloat_table;
insert into bloat_table select * from bloat_table;
insert into bloat_table select * from bloat_table;
insert into bloat_table select * from bloat_table;
insert into bloat_table select * from bloat_table;
insert into bloat_table select * from bloat_table;
insert into bloat_table select * from bloat_table;

select count(*) as "count :" from bloat_table;

select table_name, data_length/1024/1024 as mb from info.TABLES where table_name='bloat_table';
