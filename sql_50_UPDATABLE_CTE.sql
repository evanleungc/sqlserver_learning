--UPDATABLE CTE
--Sometimes we can update sometimes not

With Employee_Name_Gender
AS
(
	SELECT ID, NAME, GENDER FROM tblEmployee
)

UPDATE Employee_Name_Gender Set Gender = 'Female' where id = 1

select * from tblEmployee --The update in CTE will actually update the underlying table

--If join two tables in CTE, if the update only affect ONE table, the update is allowed
--However, it is DANGEROUS, because it will messed up between tables. You can refer back to the update in VIEWs chapter.
With Employee_Name_Gender
AS
(
	SELECT tblEmployee.ID, NAME, GENDER FROM tblEmployee
	join tblDepartment
	on tblDepartment.id = tblEmployee.DepartmentID
)

UPDATE Employee_Name_Gender Set Gender = 'Male' where id = 1

select * from tblEmployee

--If join two tables in CTE, if the update only affect TWO or MORE tables, the update is not allowed
With Employee_Name_Gender
AS
(
	SELECT tblEmployee.ID, NAME, GENDER, tblDepartment.DepartmentName FROM tblEmployee
	join tblDepartment
	on tblDepartment.id = tblEmployee.DepartmentID
)

UPDATE Employee_Name_Gender Set Gender = 'Male', DepartmentName = 'HR' where id = 1

select * from tblEmployee