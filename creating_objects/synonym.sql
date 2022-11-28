--SHOW DATABASES;
--+--------------------+
--| Database           |
--+--------------------+
--| information_schema |
--| mysql              |
--| performance_schema |
--| sys                |
--| test               |
--+--------------------+

CALL sys.create_synonym_db('performance_schema', 'perf');
CALL sys.create_synonym_db('information_schema', 'info');
--+-----------------------------------------+
--| summary                                 |
--+-----------------------------------------+
--| Created 81 views in the `perf` database |
--+-----------------------------------------+

SHOW DATABASES;
--+--------------------+
--| Database           |
--+--------------------+
--| information_schema |
--| mysql              |
--| perf               |
--| performance_schema |
--| sys                |
--| test               |
--+--------------------+

SHOW FULL TABLES FROM perf;
show full tables from info;
--+------------------------------------------------------+------------+
--| Tables_in_perf                                       | Table_type |
--+------------------------------------------------------+------------+
--| accounts                                             | VIEW       |
--| cond_instances                                       | VIEW       |
--| events_stages_current                                | VIEW       |
--| events_stages_history                                | VIEW       |
--| events_stages_history_long                           | VIEW       |
-- ...