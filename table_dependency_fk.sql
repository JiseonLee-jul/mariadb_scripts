SELECT 
     Constraint_Type
    ,Constraint_Name
    ,Table_Schema
    ,Table_Name
FROM information_schema.table_constraints
WHERE Constraint_Type = 'FOREIGN KEY'
    AND Table_Name = 'Any_Table'
    AND Table_Schema ='db_Name';