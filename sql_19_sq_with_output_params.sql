--Stored Procedure with output param
Select * from tblEmployee

Create Proc spGetEmployeeCountByGender
@Gender nvarchar(20),
@EmployeeCount int output
As
Begin
	Select @EmployeeCount = Count(Id) from tblEmployee where Gender = @Gender
End

--Receive Employee Count
Declare @TotalCount int		--First declare the variable that you are going to receive the return
Exec spGetEmployeeCountByGender 'Male', @TotalCount output
print @TotalCount

--**Don't forget the output param, if it is forgotten, the TotalCount will be null
Declare @TotalCount int		--First declare the variable that you are going to receive the return
Exec spGetEmployeeCountByGender 'Male', @TotalCount  --**If output param is missed here
if (@TotalCount is NULL)
	Print '@TotalCount is Null'
else
	Print '@TotalCount is not Null'

--Userful procedures
sp_help spGetEmployeeCountByGender
sp_helptext spGetEmployeeCountByGender
sp_depends spGetEmployeeCountByGender --Check what tables the procedure depends on