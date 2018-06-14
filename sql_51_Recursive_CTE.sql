--Recursive CTE

--Self Join
SELECT * FROM tblEmployee2

SELECT a.EmployeeId, a.Name, COALESCE(b.Name, 'SuperBoss') as ManagerName
FROM tblEmployee2 a
LEFT JOIN tblEmployee2 b
ON a.ManagerId = b.EmployeeId

--Add level to table
With EmployeeCTE (EmployeeId, Name, ManagerId, [Level])
AS
(
	SELECT a.EmployeeId, a.Name, a.ManagerId, 1 as [Level]
	FROM tblEmployee2 a
	WHERE a.ManagerId IS NULL

	UNION ALL

	SELECT a.EmployeeId, a.Name, ISNULL(a.ManagerId, 'SuperBoss'), b.[Level] + 1
	FROM tblEmployee2 a
	JOIN EmployeeCTE b
	ON a.ManagerId = b.EmployeeId
)
SELECT * FROM EmployeeCTE