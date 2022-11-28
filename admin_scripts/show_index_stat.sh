database_name=`$1`

SHOW INDEX FROM TableName FROM ${database_name}
SELECT 
    TABLE_NAME
    ,INDEX_NAME
    ,SEQ_IN_INDEX
    ,COLUMN_NAME
    ,CARDINALITY
    ,INDEX_TYPE    
FROM INFORMATION_SCHEMA.STATISTICS 
WHERE table_schema = ${database_name}