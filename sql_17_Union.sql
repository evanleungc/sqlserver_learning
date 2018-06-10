--UNION
--Numbers/DataType/Columns should be the same between two tables
--UNION ALL is less time consuming
--UNION is time consuming because it first sort and then remove duplicates
Create Table tblIndiaCustomers
(
Id int Identity(1,1) Primary Key,
Name nvarchar(50),
Email nvarchar(50)
)

Create Table tblUKCustomers
(
Id int Identity(1,1) Primary Key,
Name nvarchar(50),
Email nvarchar(50)
)

Insert Into tblIndiaCustomers Values('Raj', 'R@R.com')
Insert Into tblIndiaCustomers Values('Sam', 'S@S.com')
Insert Into tblUKCustomers Values('Ben', 'B@B.com')
Insert Into tblUKCustomers Values('Sam', 'S@S.com')

--UNION ALL: Return all including duplicates
Select * from tblIndiaCustomers
UNION ALL
Select * from tblUKCustomers

--UNION: Return all 1.excluding duplicates as well as 2.sorting the results(time consuming)
Select * from tblIndiaCustomers
UNION
Select * from tblUKCustomers

--If the order of the columns is not matched, they will match wrong like the following
--The following example miss the name and email
Select Name, Email from tblIndiaCustomers
UNION
Select Email, Name from tblUKCustomers

--Sorting with the result of UNION or UNION ALL
Select * from tblIndiaCustomers
UNION
Select * from tblUKCustomers
Order By Name

--Cannot put order before union
Select * from tblIndiaCustomers
Order By Name
UNION
Select * from tblUKCustomers  --Error