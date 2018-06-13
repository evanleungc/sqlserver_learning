--Instead_Of_Delete_Trigger

ALTER TRIGGER tr_vwEmployeesByDepartment_InsteadOfDelete
ON vwEmployeesByDepartment
INSTEAD OF DELETE
AS
BEGIN
	--DELETE FROM tblEmployee WHERE Id = (SELECT TOP 1 ID FROM DELETED)
	--*Sub query is usually slower than join
	DELETE FROM tblEmployee
	JOIN DELETED
	ON tblEmployee.Id = Deleted.Id
END

DELETE FROM vwEmployeesByDepartment WHERE Id = 2
SELECT * FROM vwEmployeesByDepartment