--Inline Table Value Function
--Do not have 'begin-end' keywords
--1. Inline is a functionality of parametrized views
--2. The return table can be joined with other tables
USE sample

CREATE FUNCTION fn_EmployeesByGender(@Gender nvarchar(20))
RETURNS TABLE
AS
RETURN	(SELECT Id, Name, Gender, DepartmentID from tblEmployee where Gender = @Gender)

SELECT * FROM fn_EmployeesByGender('FEMALE') WHERE ID = 2

SELECT		a.ID, a.NAME, a.GENDER, a.DepartmentID
FROM		fn_EmployeesByGender('FEMALE') a
JOIN		tblDepartment b
ON			A.DepartmentID=B.Id