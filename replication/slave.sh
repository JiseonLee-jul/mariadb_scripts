host=`ifconfig | tr " " "\n" | sed '/^$/d' | sed -n '/172/p' | grep -m 1 '172'`;

file=`mariadb -u root -p"ezis" -e "show master status\G" | grep File | tr " " "\n" | sed '/^$/d' | grep bin`;

pos=`mariadb -u root -p"ezis" -e "show master status\G" | grep Pos | tr " " "\n" | sed '/^$/d' | tr -d "Position:"`;

mariadb -u root -p"ezis" -e "change master to MASTER_HOST='$host', MASTER_USER='repluser', MASTER_PASSWORD='ezis', MASTER_LOG_FILE='$file', MASTER_LOG_POS=$pos";
\
mariadb -u root -p"ezis" -e "start slave;"