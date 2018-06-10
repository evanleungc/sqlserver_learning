--Intelligent Join
--Exclude right
Select		a.Name, a.Gender, a.Salary, b.DepartmentName
from		tblEmployee a
Left Join	tblDepartment b
ON			a.DepartmentId = b.Id
Where		a.DepartmentId is NULL
--Exclude left
Select		a.Name, a.Gender, a.Salary, b.DepartmentName
from		tblEmployee a
Right Join	tblDepartment b
ON			a.DepartmentId = b.Id
Where		a.DepartmentId is NULL
--Exclude middle
Select		a.Name, a.Gender, a.Salary, b.DepartmentName
from		tblEmployee a
Full Join	tblDepartment b
ON			a.DepartmentId = b.Id
Where		a.DepartmentId is NULL Or b.Id is NULL