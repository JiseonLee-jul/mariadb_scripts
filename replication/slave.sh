runma
host=`ifconfig | tr " " "\n" | sed '/^$/d' | sed -n '/172/p' | grep -m 1 172`
file=`exma "show master status\G" | grep File | tr " " "\n" | sed '/^$/d' | grep bin`
pos=`exma "show master status\G" | grep Pos | tr " " "\n" | sed '/^$/d' | tr -d "Position:"`
exma "change master to master_host=$host, master_user='repluser', master_password='ezis', master_log_file=$file, master_log_pos=$pos"
exma "start slave;"