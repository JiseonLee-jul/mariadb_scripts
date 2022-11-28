root_password=`$1`
database_name=`$2`
backup_file_name=`$3`
mysqldump -u root -p ${root_password} ${database_name} > backup_file_name.sql