#!/bin/bash

if [ $# -lt 2 ]
then
        echo 'desc: [MariaDB] Show table size'
        echo 'usage: show_table_size.sh [db_name] [table_name]';
        exit;
fi

host_name='localhost';
db_root_password="ezis";
db_name=$1;
table_name=$2;

mariadb -u root -p"$db_root_password" -e \
"SELECT table_name AS TableName,\
ROUND(((data_length + index_length) / 1024 / 1024) , 2) AS MB\
FROM information_schema.tables\
WHERE table_schema = '$db_name'\
AND table_name = '$table_name'";
