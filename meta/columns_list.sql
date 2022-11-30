SELECT
  table_schema
  , table_name
  , column_name
  , ordinal_position
  , column_type
  , is_nullable
  , column_key
  , column_comment
FROM
  information_schema.`COLUMNS`
ORDER BY 1  , 2  , 4 \G;