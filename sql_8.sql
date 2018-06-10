--Retrieving Identity Columns Values

Create Table Test1
(
ID int identity(1,1),
Value nvarchar(20)
)

Create Table Test2
(
ID int identity(1,1),
Value nvarchar(20)
)

Insert into Test1 Values('X')

Select * from Test1

Insert into Test1 Values('Y')

--This Scenario, they are the same
Select SCOPE_IDENTITY()
Select @@IDENTITY

--Triger: When doing one action it will triger another action
Create Trigger trForInsert on Test1 for Insert
as
Begin
	Insert into Test2 Values('YYYY')
End

Select * from Test1
Select * from Test2

Insert into Test1 Values('Z')

Select * from Test1
Select * from Test2

Select SCOPE_IDENTITY() --Same session and the same scope, session means "ÐÂ´°¿Ú"
Select @@IDENTITY --Same session and across any scope

Select IDENT_CURRENT('Test1') --Not based on any sessions but tables themselves
Select IDENT_CURRENT('Test2')