CREATE DATABASE Employee;
 
CREATE TABLE Employee.EmployeePivotTest
(
     EmpName VARCHAR(255)
    ,EmpDeptName VARCHAR(255)
    ,EmpAvgWorkingHours INTEGER
);
 
INSERT INTO Employee.EmployeePivotTest VALUES
('Anvesh','Computer-IT',226)
,('Anvesh','Computer-IT',100)
,('Anvesh','Computer-IT',200)
,('Anvesh','Computer-IT',752)
,('Anvesh','Account',142)
,('Anvesh','Marketing',110)
,('Anvesh','Finance',236)
,('Anvesh','Account',120)
,('Neevan','Computer-IT',120)
,('Neevan','Finance',852)
,('Neevan','Account',326)
,('Neevan','Marketing',50)
,('Neevan','Finance',140);

SELECT 
    EP.EmpName
    ,EmpDeptName
    ,EmpAvgWorkingHours
FROM Employee.EmployeePivotTest  AS EP
INNER JOIN
(
   SELECT 
	EmpName
	,GROUP_CONCAT(DISTINCT EmpAvgWorkingHours 
         ORDER BY EmpAvgWorkingHours DESC) 
         AS GroupedWorkingHours
   FROM Employee.EmployeePivotTest 
   GROUP BY EmpName
) AS T
ON EP.EmpName = T.EmpName 
AND FIND_IN_SET(EmpAvgWorkingHours,GroupedWorkingHours) <=2
ORDER BY EmpName,EmpDeptName;