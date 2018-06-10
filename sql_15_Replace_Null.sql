--Replace Null, eg. replace the null with 'No Manager'
--ISNULL, COALESCE, CASE Statement
Select ISNULL('a', 'replace null')
Select ISNULL(NULL, 'replace null')
Select COALESCE('a', 'replace null')
Select COALESCE(NULL, 'replace null')
CASE WHEN EXPRESSION THEN '' ELSE '' END

Select		a.Name Employee, b.Name Manager
From		tblEmployee2 a
Left Join	tblEmployee2 b
On			a.EmployeeId = b.ManagerId

--1st Solution, ISNULL() Function
Select		a.Name Employee, ISNULL(b.Name, 'No Manager') Manager
From		tblEmployee2 a
Left Join	tblEmployee2 b
On			a.EmployeeId = b.ManagerId

--2nd Solution, COALESCE
Select		a.Name Employee, COALESCE(b.Name, 'No Manager') Manager
From		tblEmployee2 a
Left Join	tblEmployee2 b
On			a.EmployeeId = b.ManagerId

--3nd Solution, CASE Statement
Select		a.Name Employee, 
			Case When b.Name Is Null Then 'No Manager' Else b.Name End as Manager
From		tblEmployee2 as a
Left Join	tblEmployee2 as b
On			a.EmployeeId = b.ManagerId