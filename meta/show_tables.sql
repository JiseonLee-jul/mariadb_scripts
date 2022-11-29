SELECT
  table_schema
  , table_name
  , table_comment
  , table_rows
FROM
  information_schema.`TABLES`
ORDER BY 1 , 2 \G;