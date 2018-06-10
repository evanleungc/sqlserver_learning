--Self Join
Create Table tblEmployee2
(
EmployeeId int Identity(1, 1) Primary Key,
Name nvarchar(50),
ManagerId int
)

Insert Into tblEmployee2 Values ('Mike', 3)
Insert Into tblEmployee2 Values ('Rob', 1)
Insert Into tblEmployee2 Values ('Todd', NULL)
Insert Into tblEmployee2 Values ('Ben', 1)
Insert Into tblEmployee2 Values ('Sam', 1)

Select * from tblEmployee2
--Left Outer Self Join
Select		E.Name As Employee, M.Name as Manager
From		tblEmployee2 E
Left Join	tblEmployee2 M
On			E.EmployeeId = M.ManagerId

--Inner Self Join
Select		E.Name as Employee, M.Name as Manager
From		tblEmployee2 E
Inner Join	tblEmployee2 M
On			E.EmployeeId = M.ManagerId

--Cross Self Join
Select		E.Name as Employee, M.Name as Manager
From		tblEmployee2 E
Cross Join	tblEmployee2 M

