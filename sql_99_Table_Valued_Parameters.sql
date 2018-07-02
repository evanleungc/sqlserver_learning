--You cannot do DML on the table parameter in the procedure

Create Table Employees
(
	Id int primary key,
	Name nvarchar(50),
	Gender nvarchar(10)
)
Go

Select * from Employees

--User Defined Table Type
Create Type EmpTableType as Table
(
	Id int primary key,
	Name nvarchar(50),
	Gender nvarchar(10)	
)

Create Proc spInsertEmployees
@EmpTableType EmpTableType READONLY  --Passing a table variable as a parameter to the stored procedure, READONLY parameter is a must!!!
AS
BEGIN
	Insert Into Employees
	Select * from @EmpTableType
END

Declare @EmployeeTableType EmpTableType
Insert into @EmployeeTableType values (1, 'Mark', 'Male')
Insert into @EmployeeTableType values (2, 'Evan', 'Male')

Exec spInsertEmployees @EmployeeTableType