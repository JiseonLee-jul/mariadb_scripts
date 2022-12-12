drop database if exists test;

create database test;

use test;

create table daily_statistic 
(
        target_date date not null,
        stat_name varchar(10) not null,
        stat_value bigint not null default 0,
        primary key(target_date, stat_name)
);

insert into daily_statistic (target_date, stat_name, stat_value)
    values (date(now()), 'visit', 1)
    on duplicate key update stat_value=stat_value+1;
