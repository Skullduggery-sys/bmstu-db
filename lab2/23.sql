WITH RECURSIVE DirectReports(ManagerID, EmployeeID, Title, DeptID, Level) AS
(
 -- Определение закрепленного элемента
 SELECT e.ManagerID, e.EmployeeID, e.Title, e.DeptID, 0 AS Level
 FROM MyEmployees AS e
 WHERE ManagerID IS NULL
 UNION ALL
 -- Определение рекурсивного элемента
 SELECT e.ManagerID, e.EmployeeID, e.Title, e.DeptID, Level + 1
 FROM MyEmployees AS e INNER JOIN DirectReports AS d
 ON e.ManagerID = d.EmployeeID
)

-- Инструкция, использующая ОТВ
SELECT ManagerID, EmployeeID, Title, DeptID, Level
FROM DirectReports;

--DROP TABLE myemployees;