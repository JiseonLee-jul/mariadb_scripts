SELECT
        character_set_name
FROM information_schema.COLUMNS
WHERE table_schema = 'Database_Name'
        AND table_name = 'Table_Name'
        AND column_name = 'Column_Name';