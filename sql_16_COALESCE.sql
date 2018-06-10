--COALESCE
--Return the first thing that is not null
Create Table tblEmployee3
(
Id int Identity(1,1) Primary Key,
FirstName nvarchar(50),
MiddleName nvarchar(50),
LastName nvarchar(50)
)

Insert Into tblEmployee3 Values('Sam', NULL, NULL)
Insert Into tblEmployee3 Values(NULL, 'Todd', NULL)
Insert Into tblEmployee3 Values(NULL, NULL, 'Sara')
Insert Into tblEmployee3 Values('Ben', 'Parker', NULL)
Insert Into tblEmployee3 Values('James', 'Nick', 'Nancy')

Select	Id, 
		COALESCE(FirstName, MiddleName, LastName) as Name 
From	tblEmployee3