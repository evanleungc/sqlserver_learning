--This part aims to use different way to create temporary tables for short usage
--Derived Table and CTE
--To generate temporary tables for short usage

--1. View
CREATE VIEW vWEmployeeCount
as
SELECT DepartmentName, DepartmentId, Count(*) as TotalEmployee
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentID = tblDepartment.Id
group by DepartmentName, DepartmentId

SELECT * FROM vWEmployeeCount WHERE TotalEmployee>=2

--2. Temp table
SELECT DepartmentName, DepartmentId, Count(*) as TotalEmployee 
into #temptable
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentID = tblDepartment.Id
group by DepartmentName, DepartmentId

select * from #temptable WHERE TotalEmployee>=2
drop #temptable

--3. Table Variable: Also created into tempdb, but it can pass as parameter
DECLARE @tblEmployeeCount table(DepartmentName nvarchar(20), DepartmentId int, TotalEmployee int)

Insert into @tblEmployeeCount
SELECT DepartmentName, DepartmentId, Count(*) as TotalEmployee
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentID = tblDepartment.Id
group by DepartmentName, DepartmentId

SELECT * FROM @tblEmployeeCount WHERE TotalEmployee>=2

--4. Derived Table
SELECT DepartmentName, DepartmentId from 
(
	SELECT DepartmentName, DepartmentId, Count(*) as TotalEmployee
	from tblEmployee
	join tblDepartment
	on tblEmployee.DepartmentID = tblDepartment.Id
	group by DepartmentName, DepartmentId
)
AS EmployeeCount --This is the derived table
WHERE TotalEmployee >= 2

--5. CTE:Common Table Expression
With EmployeeCount(DeptName, DepartmentId, TotalEmployee) --The parameter are optional
AS
(
	SELECT DepartmentName, DepartmentId, Count(*) as TotalEmployee
	from tblEmployee
	join tblDepartment
	on tblEmployee.DepartmentID = tblDepartment.Id
	group by DepartmentName, DepartmentId
)

SELECT * FROM EmployeeCount WHERE TotalEmployee >= 2