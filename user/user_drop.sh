#!/bin/bash

if [ $# -lt 1 ]
then
        echo 'desc: [MariaDB] Drop User'
        echo 'usage: drop_user.sh [user_name]';
        exit;
fi

host_name='localhost';
db_root_password="ezis";
user_name=$1;

mariadb -u root -p"$db_root_password" -e "drop user if exists '$user_name'@'$host_name'";

if [ $? -eq 0 ]
then
        echo 'Drop user successfully'
else
        echo 'Cannot drop user'