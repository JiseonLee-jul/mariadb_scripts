SELECT
        UPDATE_TIME
FROM information_schema.tables
WHERE TABLE_SCHEMA = 'Database_Name'
   AND TABLE_NAME = 'Table_Name';