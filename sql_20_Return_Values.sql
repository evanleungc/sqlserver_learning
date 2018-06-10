--Stored Procedure_Difference between Return Values and Ouput Param

--##Output Param
Create Proc spGetTotalCountOfEmployee1
@TotalCount int output
As
Begin
	Select Count(Id) from tblEmployee
End

Declare @TotalEmployees int
Exec spGetTotalCountOfEmployee1 @TotalEmployees output
print @TotalEmployees

--##Return Values
Create Proc spGetTotalCountOfEmployee2
As
Begin
	return (Select Count(Id) from tblEmployee)
End

Declare @TotalEmployees2 int
Exec @TotalEmployees2 = spGetTotalCountOfEmployee2
Print @TotalEmployees2

--Example
Create proc spGetNameById1
@Id int,
@Name nvarchar(20) output
As
Begin
	Select @Name = Name from tblEmployee Where Id = @Id
End

Declare @Name nvarchar(20)
Exec spGetNameById1 1, @Name output
Print 'Name = ' + @Name

Create proc spGetNameById2
@Id int
As
Begin
	Return (Select Name from tblEmployee Where Id = @Id)
End

Declare @Name2 nvarchar(20)
Exec @Name2 = spGetNameById2 1
Print 'Return Name is ' + @Name2 --##Error occur says that cannot convert string to int
--The reason is that the procedure will return ONE INTEGER status variable, 0-succes, else-failure
