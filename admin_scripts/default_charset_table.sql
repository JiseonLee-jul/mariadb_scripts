SELECT
        CCSA.character_set_name
FROM information_schema.TABLES AS T
INNER JOIN information_schema.COLLATION_CHARACTER_SET_APPLICABILITY AS CCSA
        ON CCSA.collation_name = T.table_collation
WHERE T.table_schema = 'Database_Name'
        AND T.table_name = 'Table_Name';