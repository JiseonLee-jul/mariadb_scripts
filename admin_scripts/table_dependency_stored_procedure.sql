SELECT 
    Table_Schema
    ,Table_Name
    ,Table_Type
    ,Engine
    ,Routine_Name
    ,Routine_Schema
    ,Routine_Type
FROM information_schema.tables
 INNER JOIN information_schema.routines
    ON routines.routine_definition 
    LIKE  Concat('%', tables.table_name, '%')
WHERE Table_Schema ='db_name'