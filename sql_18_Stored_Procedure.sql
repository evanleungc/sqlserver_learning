--Stored Procedure

Create Procedure spGetEmployees			--sp is the convention for stored procedure
As
Begin
	Select Name, Gender from tblEmployee
End

Create Proc spGetEmployees			--Proc is the shortcut
As
Begin
	Select Name, Gender from tblEmployee
End

--Excecute Procedure
spGetEmployees
Exec spGetEmployees
Execute spGetEmployees

--SP with parameters
Create Proc spGetEmployeeByGenderAndDepartment
@Gender nvarchar(20),
@DepartmentId int
As
Begin
	Select			Name, Gender DepartmentId from tblEmployee
	Where			Gender = @Gender and DepartmentId = @DepartmentId
End

--Execution with Params
spGetEmployeeByGenderAndDepartment 'Male', 1
spGetEmployeeByGenderAndDepartment @DepartmentId = 1, @Gender = 'Male'

--Help of procedure: Pop out the creation method of the procedure
sp_helptext spGetEmployees

--Alter Procedure:
Alter Procedure spGetEmployees
As
Begin
	Select Name, Gender from tblEmployee Order by Name
End

--Drop Procedure:
Drop Proc spGetEmployees

--Protect the Procedure being modifed: add enryption
Alter Procedure spGetEmployees
With Encryption  --**Add encryption
As
Begin
	Select Name, Gender from tblEmployee Order by Name
End