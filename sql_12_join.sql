--Join
--Syntax:
Select		ColumnList
From		LeftTable
JoinType	RightTable
On			JoinCondition

Alter Table tblEmployee
Add DepartmentID int

Alter Table tblEmployee
Add Constraint FK_tblEmployee_DepartmentId
Foreign Key (DepartmentId) References tblDepartment(Id)

Create Table tblDepartment
(
Id int Identity(1,1) Primary Key,
DepartmentName nvarchar(50),
Location nvarchar(50),
DepartmentHead nvarchar(50)
)

Insert into tblDepartment Values ('IT', 'London', 'Rick')
Insert into tblDepartment Values ('PayRoll', 'Delhi', 'Ron')
Insert into tblDepartment Values ('HR', 'New York', 'Christie')
Insert into tblDepartment Values ('Other Department', 'Sydney', 'Cindrella')

select * from tblEmployee
select * from tblDepartment

--Inner Join
Select Name, Gender, Salary, DepartmentName
from tblEmployee
INNER JOIN tblDepartment
ON tblEmployee.DepartmentId = tblDepartment.Id

--OR(Inner Join can simply use join)

Select Name, Gender, Salary, DepartmentName
from tblEmployee
JOIN tblDepartment
ON tblEmployee.DepartmentId = tblDepartment.Id

--Outer Join (Left Join, Right Join), Fixed one side
Select Name, Gender, Salary, DepartmentName
from tblEmployee
Left Join tblDepartment
ON tblEmployee.DepartmentId = tblDepartment.Id

Select Name, Gender, Salary, DepartmentName
from tblEmployee
Right Join tblDepartment
ON tblEmployee.DepartmentId = tblDepartment.Id

--Full Join (Left Join + Right Join)
Select Name, Gender, Salary, DepartmentName
from tblEmployee
Full Join tblDepartment
ON tblEmployee.DepartmentId = tblDepartment.Id

--Cross Join (Cross Join does not have Null) Cartesian Product of two tables
--Cross Join does not have not On Clause
Select Name, Gender, Salary, DepartmentName
from tblEmployee
Cross Join tblDepartment
