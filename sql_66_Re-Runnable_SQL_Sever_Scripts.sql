--Re-Runnable sql server scripts
If not exists(select * from INFORMATION_SCHEMA.TABLES where table_name = 'tblTest')
Begin
	Create table tblTest
	(
		Id int identity(1,1) primary key,
		Name nvarchar(100),
		Gender nvarchar(10),
		DateOfBirth DateTime
	)
	Print 'Table tblTest successfully created'
End
Else
Begin
	Print 'Table tblTest already exsited'
End

If OBJECT_ID('tblEmployee') is not null
Begin
Print 'Exist'
End
Else
Begin
Print 'Not Exist'
End

Insert into tblTest values('Evan', 'Male', '2018-01-01')
If not exists(Select * from INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME = 'EmailAddress'
AND TABLE_NAME = 'tblTest' AND TABLE_SCHEMA = 'dbo')
BEGIN
	ALTER TABLE tblTest
	ADD EmailAddress nvarchar(50)
END
ELSE
BEGIN
	PRINT 'Column EmailAddress already exists'
END
select * from tblTest

If col_length('tblTest', 'EmailAddress') is not null
Begin
	Print 'Column already exists'
End
Else
Begin
	Print 'Column does not exist'
End