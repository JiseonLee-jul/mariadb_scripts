SELECT
  table_schema
  , table_name
  , index_name
  , seq_in_index
  , column_name
  , cardinality
FROM
  information_schema.`STATISTICS`
ORDER BY 1  , 2  , 3  , 4 \G;