--Update/Delete/Insert View
USE sample

Create view vWEmployeesDataExceptSalary
AS
SELECT ID, NAME, GENDER, DEPARTMENTID
FROM tblEmployee

SELECT * FROM vWEmployeesDataExceptSalary

Update	vWEmployeesDataExceptSalary
SET		NAME = 'Tompson' WHERE ID = 4

SELECT * FROM vWEmployeesDataExceptSalary
SELECT * FROM tblEmployee

--VIEW From multiple tables
CREATE VIEW		vwEmployeesByDepartment
AS
SELECT			a.Id, a.Name, a.Salary, a.Gender, b.DepartmentName
FROM			tblEmployee a
JOIN			tblDepartment b
ON				a.DepartmentID = b.Id


SELECT * FROM vWEmployeesByDepartment

UPDATE vwEmployeesByDepartment
SET DepartmentName = 'IT' Where NAME = 'John' --These two are from different tables it will go really wrong because it will change wrongly
											  --It is good to use triger to solve the problem

SELECT * FROM vWEmployeesByDepartment
SELECT * FROM tblDepartment
SELECT * FROM tblEmployee