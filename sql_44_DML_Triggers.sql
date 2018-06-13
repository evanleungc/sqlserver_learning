--DML Triggers
CREATE TRIGGER tr_tblEmployee_ForUpdate
on tblEmployee
FOR UPDATE
AS
BEGIN
	DECLARE @Id int
	DECLARE @OldName nvarchar(20), @NewName nvarchar(20)
	DECLARE @OldSalary int, @NewSalary int
	DECLARE @OldGender nvarchar(20), @NewGender nvarchar(20)
	DECLARE @OldDepartmentId int, @NewDepartmentId int

	DECLARE @AuditString nvarchar(1000)

	SELECT * INTO #TempTable From Inserted

	WHILE (Exists(Select Id from #TempTable))
	BEGIN
		Set @AuditString = ''
		SELECT			@Id = Id, @OldName = Name, @OldSalary = Salary,
						@OldGender = Gender, @OldDepartmentId = DepartmentId
		FROM Deleted

		SELECT	Top 1	@Id = Id, @NewName = Name, @NewSalary = Salary,
						@NewGender = Gender, @NewDepartmentId = DepartmentId
		FROM #TempTable

		SET @AuditString = 'Employee with Id = ' + CAST(@Id as nvarchar(5)) + ' changed  '
		SET @AuditString = @AuditString + dbo.tr_fn_GenString(@OldName, @NewName, default)
		SET @AuditString = @AuditString + dbo.tr_fn_GenString(@OldSalary, @NewSalary, default)
		SET @AuditString = @AuditString + dbo.tr_fn_GenString(@OldGender, @NewGender, default)
		SET @AuditString = @AuditString + dbo.tr_fn_GenString(@OldDepartmentId, @NewDepartmentId, '.')
		INSERT INTO tblEmployeeAudit VALUES (@AuditString)
		DELETE FROM #TempTable WHERE ID = @Id
	END
END

ALTER FUNCTION tr_fn_GenString(@OldString nvarchar(20), @NewString nvarchar(20), @End nvarchar(10)= ',')
RETURNS nvarchar(100)
AS
BEGIN
	DECLARE @Ret_String nvarchar(100)
	IF (@OldString != @NewString)
		SET @Ret_String =  'Name from ' + @OldString + ' to ' + @NewString + @End
	ELSE
		SET @Ret_String = ''
	RETURN @Ret_String
END

print dbo.tr_fn_GenString('1000', '2000')
UPDATE tblEmployee SET Name = 'Rose', Gender = 'Female' WHERE ID = 10

SELECT * FROM tblEmployee
SELECT * FROM tblEmployeeAudit