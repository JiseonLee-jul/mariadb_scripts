root_password=`$1`
database_name=`$2`
restore_file_name=`$3`
mysqldump -u root -p${root_password} ${database_name} < ${restore_file_name}