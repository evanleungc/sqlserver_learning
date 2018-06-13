--Temporary Tables: #Table can be viewed in system-temporary_table
--Permanent Tables can be viewd in Tables in the object explorer

Create Table #PersonDetatils(Id int identity(1,1), Name nvarchar(20))

Insert into #PersonDetatils Values('Mike')
Insert into #PersonDetatils Values('Tom')

Select * From #PersonDetatils

SELECT NAME FROM tempdb..sysobjects
where name like '#PersonDetatils%'

--The temptable will be dropped immediately after the stored procedure has been executed
ALTER PROC spCreateTempTable
AS
BEGIN
	Create Table #PersonDetatils2(Id int identity(1,1), Name nvarchar(20))
	Insert into #PersonDetatils2 Values('Mike')
	Insert into #PersonDetatils2 Values('Tom')

	SELECT NAME FROM tempdb..sysobjects
	where name like '#PersonDetatils2%' ----YOU CAN FIND RESULTS HERE

	Select * From #PersonDetatils2
END

EXEC spCreateTempTable
SELECT NAME FROM tempdb..sysobjects
where name like '#PersonDetatils2%' --YOU CANNOT FIND ANY RESULTS

--Global Table:You can connect to it in 2nd connection
Create Table ##PersonDetatils(Id int identity(1,1), Name nvarchar(20))

Insert into ##PersonDetatils Values('Mike')
Insert into ##PersonDetatils Values('Tom')
