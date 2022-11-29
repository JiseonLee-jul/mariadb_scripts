SELECT
  table_schema
  , COUNT(*) "NUM"
FROM
  information_schema.`COLUMNS`
GROUP BY table_schema;