#!/bin/bash

if [ $# -lt 4 ]
then
        echo 'desc: [MariaDB] Create User with grants'
        echo 'usage: create_user.sh [user_name] [user_password] [db_name] [table_name]';
        exit;
fi

host_name='localhost';
db_root_password="ezis";
new_user=$1;
new_user_password=$2;
db_name=$3;
table_name=$4;

mariadb -u root -p"$db_root_password" -e "grant all on '$db_name'.'$table_name' to '$new_user'@'$host_name' identified by '$new_user_password'";
mariadb -u root -p"$db_root_password" -e "flush privileges";


if [ $? -eq 0 ]
then
        echo 'Create user successfully'
        mariadb -u root -p"$db_root_password" -e "show grants for '$new_user'@'$host_name'"
else
        echo 'Cannot create user'
fi

