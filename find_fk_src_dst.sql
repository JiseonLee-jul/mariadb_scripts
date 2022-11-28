SELECT
  referenced_table_name AS ParentTable
  ,table_name AS ChildTable
  ,constraint_name AS ConstraintName
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE referenced_table_name IS NOT NULL
ORDER BY referenced_table_name;