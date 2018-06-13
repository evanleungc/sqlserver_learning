--CTE
--Temporary result set, that can be referenced within as select, insert, update or delete statement that immediately follow the CTE

With EmployeeCount(DepartmentName, DepartmentId, TotalEmployee) --The parameter are optional
AS
(
	SELECT DepartmentName, DepartmentId, Count(*) as TotalEmployee
	from tblEmployee
	join tblDepartment
	on tblEmployee.DepartmentID = tblDepartment.Id
	group by DepartmentName, DepartmentId
)
SELECT DeptName, DepartmentId, TotalEmployee FROM EmployeeCount

With EmployeeCount --The parameter are optional
AS
(
	SELECT DepartmentName, DepartmentId, Count(*) as TotalEmployee
	from tblEmployee
	join tblDepartment
	on tblEmployee.DepartmentID = tblDepartment.Id
	group by DepartmentName, DepartmentId
)
SELECT DepartmentName, DepartmentId, TotalEmployee FROM EmployeeCount

With EmployeeCount(a,b,c) --You can use the parameter to change the name
AS
(
	SELECT DepartmentName, DepartmentId, Count(*) as TotalEmployee
	from tblEmployee
	join tblDepartment
	on tblEmployee.DepartmentID = tblDepartment.Id
	group by DepartmentName, DepartmentId
)
SELECT a, b, c FROM EmployeeCount

GO

With EmployeeCount(a,b,c) --You can use the parameter to change the name
AS
(
	SELECT DepartmentName, DepartmentId, Count(*) as TotalEmployee
	from tblEmployee
	join tblDepartment
	on tblEmployee.DepartmentID = tblDepartment.Id
	group by DepartmentName, DepartmentId
)

SELECT 'HELLO' --If you do this in between ,the CTE will be lost

SELECT a, b, c FROM EmployeeCount

--Multiple CTE
With EmployeeIT
AS
(
	SELECT DepartmentName, DepartmentId, Count(*) as TotalEmployee
	from tblEmployee
	join tblDepartment
	on tblEmployee.DepartmentID = tblDepartment.Id
	where DepartmentName = 'IT'
	group by DepartmentName, DepartmentId
),
EmployeeHR
AS
(
	SELECT DepartmentName, DepartmentId, Count(*) as TotalEmployee
	from tblEmployee
	join tblDepartment
	on tblEmployee.DepartmentID = tblDepartment.Id
	where DepartmentName = 'HR'
	group by DepartmentName, DepartmentId
)
SELECT * FROM EmployeeIT
UNION
SELECT * FROM EmployeeHR

