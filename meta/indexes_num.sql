SELECT
  table_schema
  , COUNT(*) "NUM"
FROM
  (SELECT
    table_schema
    , table_name
    , index_name
  FROM
    information_schema.`STATISTICS`
  GROUP BY table_schema
    , table_name
    , index_name) a
GROUP BY table_schema;