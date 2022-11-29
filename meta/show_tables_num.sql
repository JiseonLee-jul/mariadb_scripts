SELECT
  table_schema
  , COUNT(*) "NUM"
FROM
  information_schema.`TABLES`
GROUP BY table_schema;