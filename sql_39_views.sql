--VIEWS: It is nothing but a save SQL query
--lower complexity
--improve security

CREATE VIEW		vwEmployeesByDepartment
AS
SELECT			a.Id, a.Name, a.Salary, a.Gender, b.DepartmentName
FROM			tblEmployee a
JOIN			tblDepartment b
ON				a.DepartmentID = b.Id

SELECT * FROM vwEmployeesByDepartment

sp_helptext vwEmployeesByDepartment-- You can find that it is just a stored query


--Improve secutiry

CREATE VIEW		vwITEmployeesByDepartment
AS
SELECT			a.Id, a.Name, a.Salary, a.Gender, b.DepartmentName
FROM			tblEmployee a
JOIN			tblDepartment b
ON				a.DepartmentID = b.Id
WHERE b.DepartmentName = 'IT'

SELECT * FROM vwITEmployeesByDepartment