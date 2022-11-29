SELECT
  table_schema
  , ROUND(
    SUM(data_length + index_length) / 1024 / 1024 , 2) "Mb"
FROM
  information_schema.tables
GROUP BY table_schema;