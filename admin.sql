mysqladmin -u root -p ping --check ping
	
mysqladmin -u root -p version --check curr version

mysqladmin -u root -p status --check curr status

mysqladmin -u root -p variables --check server variables

mysqladmin -u root -p extended-status --check server variable's value

mysqladmin -u root -p processlist --check running mysql processes

mysqladmin -u root -p shutdown --shutdown