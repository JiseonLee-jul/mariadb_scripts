SELECT
        table_schema, table_name
FROM information_schema.columns
WHERE table_schema = 'SCHEMA_NAME'
GROUP BY
        table_schema, table_name
                having sum(if (column_key in ('PRI', 'UNI'), 1, 0)) = 0