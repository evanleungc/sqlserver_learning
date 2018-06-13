--Deterministic function: Always return the same result if the same parameter and same database is given any time they are called
	--EG. 
	Select COUNT(*) FROM tblEmployee
--Non-Deterministic function: Return different result even if the same parameter and same database is given any time they are called
	--EG.
	Select GetDate()

--RAND() can be both
	PRINT RAND() --Non - Deterministic
	PRINT RAND(1) --Deterministic

--ENCRYPTION: 

CREATE FUNCTION fn_GetNameById(@ID INT)
RETURNS NVARCHAR(20)
WITH ENCRYPTION --NOT ALLOWED FOR VIEWING THE CODE
AS
BEGIN
	RETURN (SELECT NAME FROM tblEmployee where ID = @ID)
END

SELECT dbo.fn_GetNameById(1)

sp_helptext fn_GetNameById

--Sheme Binding
ALTER FUNCTION fn_GetNameById(@ID INT)
RETURNS NVARCHAR(20)
WITH SCHEMABINDING --After Binding, the table related to this table cannot be deleted
AS
BEGIN
	RETURN (SELECT NAME FROM dbo.tblEmployee where ID = @ID) --When you use "schemabinding", you need to specify dbo vefore the table name
END

DROP TABLE tblEmployee --After schemabinding it cannot be deleted

