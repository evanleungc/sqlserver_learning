--Option parameter in stored 

Select * from tblEmployee

Create Proc spSearchEmployees
@Name nvarchar(50) = Null,
@Email nvarchar(50) = Null,
@Gender nvarchar(50) = Null
as
Begin
	Select * from tblEmployee
	where	(Name = @Name Or @Name is null) And
			(Gender = @Gender Or @Gender is null)  And
			(EmailAddress = @Email Or @Email is null)
End

Exec spSearchEmployees Tommy

Create Proc spSearchEmployees
@Name nvarchar(50) = Null,
@Email nvarchar(50) = Null,
@Gender nvarchar(50) = Null
as
Begin
	Select * from tblEmployee
	where	(Name = @Name Or @Name is null) And
			(Gender = @Gender Or @Gender is null)  And
			(EmailAddress = @Email Or @Email is null)
End