SELECT 
     Routine_Schema
    ,Routine_Name
    ,Routine_Type
FROM information_schema.routines
WHERE routines.routine_definition LIKE '%Any_Text%'
	AND Routine_Schema = 'db_Name'