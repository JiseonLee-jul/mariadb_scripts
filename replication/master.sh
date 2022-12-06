exma 
"create user 'repluser'@'%' identified by 'ezis';
grant replication slave on *.* to 'repluser'@'%';
create database repldb;
use repldb;
create table repltable (no int(8), primary key (no));"

mysqldump -u root -p"ezis" repldb > dump.sql
exma "show master status\G;"
