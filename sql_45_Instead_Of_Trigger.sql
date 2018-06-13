--Instead of Trigger
--Solve conflict when inserting values into views from multiple tables
CREATE VIEW		vwEmployeesByDepartment
AS
SELECT			a.Id, a.Name, a.Gender, b.DepartmentName
FROM			tblEmployee a
JOIN			tblDepartment b
ON				a.DepartmentID = b.Id

ALTER TABLE tblEmployee
ADD CONSTRAINT DF_tblEmployee_Salary
DEFAULT 1000 FOR Salary

SELECT * FROM vwEmployeesByDepartment

INSERT INTO vwEmployeesByDepartment Values('Valarie', 'Female', 'IT')

CREATE trigger tr_vwEmployeesByDepartment_InsteadOfInsert
on vwEmployeesByDepartment
Instead Of Insert
as
Begin
	Select * from inserted
	Select * from deleted
End

INSERT INTO vwEmployeesByDepartment Values(9, 'Valarie', 'Female', 'IT')

--Create the trigger that fix the problem
ALTER trigger tr_vwEmployeesByDepartment_InsteadOfInsert
on vwEmployeesByDepartment
Instead Of Insert
as
Begin
	DECLARE @DeptId int
	SELECT @DeptId = tblDepartment.Id FROM tblDepartment
	JOIN inserted
	ON inserted.DepartmentName = tblDepartment.DepartmentName
	IF(@DeptId is NULL)
	BEGIN
		Raiserror('Invalid Department Name, Statement terminated', 16, 1)
		RETURN
	END

	INSERT INTO tblEmployee(Id, Name, Gender, DepartmentId)
	SELECT Id, Name, Gender, @DeptId
	FROM inserted
End

INSERT INTO vwEmployeesByDepartment Values(100, 'Evan', 'Male', 'IT')
DELETE FROM tblEmployee where id = 100