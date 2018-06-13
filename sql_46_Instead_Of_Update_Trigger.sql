--Instead of Update Trigger
ALTER TRIGGER tr_vwEmployeesByDepartment_InsteadOfUpdate
ON vwEmployeesByDepartment
INSTEAD OF UPDATE
AS
BEGIN
	IF (UPDATE(ID)) --Whether the user is updateing a param column
	BEGIN
		RAISERROR('ID cannot be change', 16, 1)
	END
	IF (UPDATE(DepartmentName))
	BEGIN
		DECLARE @Id int
		SELECT @Id = a.Id from tblDepartment a
		JOIN inserted b
		ON a.DepartmentName = b.DepartmentName
		IF (@Id IS NULL)
		BEGIN
			RAISERROR('Invalid Department Name', 16, 1)
		END

		Update tblEmployee set DepartmentId = @Id Where Id = (Select Top 1 Id from inserted)
	END

	IF (UPDATE(NAME))
	BEGIN
		DECLARE @name nvarchar(20)
		select @name = name from inserted
		Update tblEmployee set Name = @name Where Id = (Select Top 1 Id from inserted)
	END

	IF (UPDATE(GENDER))
	BEGIN
		DECLARE @gender nvarchar(20)
		select @gender = gender from inserted
		Update tblEmployee set Gender = @gender Where Id = (Select Top 1 Id from inserted)
	END
END

select * from vwEmployeesByDepartment
select * from tblDepartment
select * from vwEmployeesByDepartment
UPDATE vwEmployeesByDepartment SET Name = 'John', DepartmentName = 'HR' WHERE ID = 2
select * from vwEmployeesByDepartment