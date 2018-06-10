--Identity Columns
--Create tblPerson1 and set PersonId and Name with PersonId with identity column, identity seed 1 and incr 1
--Set identity in columns
Create Table tblPerson1
(
PersonId int Identity(1,1) Primary Key, --Set Identity (seed, incr)
Name nvarchar(50)
)

Select * from dbo.tblPerson1

Insert into dbo.tblPerson1 values ('John')
Insert into dbo.tblPerson1 values ('Mary')
Insert into dbo.tblPerson1 values ('Mike')

Delete from dbo.tblPerson1 where  PersonId= 1
Insert into dbo.tblPerson1 values (1, 'Amy') --Error 'An explicit value for the identity column in table 'dbo.tblPerson1' can only be specified when a column list is used and IDENTITY_INSERT is ON.'

--Turn on Identity Insert

Set Identity_Insert tblPerson1 On
Insert into dbo.tblPerson1 values (1, 'Amy') --Error 'You need to specify the column names'
Insert into dbo.tblPerson1 (PersonId, Name) values (1, 'Amy')

Set Identity_Insert tblPerson1 Off

Delete from dbo.tblPerson1
Insert into dbo.tblPerson1 values ('Martin')
Select * from dbo.tblPerson1 --The identity start from 4, which did not reset at al

DBCC CHECKIDENT(tblPerson1, Reseed, 0) --DBCC command will reset the seed
Select * from dbo.tblPerson1
Delete from dbo.tblPerson1
Insert into dbo.tblPerson1 values ('Martin')
Select * from dbo.tblPerson1
