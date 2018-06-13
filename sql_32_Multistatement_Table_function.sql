--Inline Multi Statement Table Value Function
--Inline Table Value Functions are more efficient because it is treated as a view by the SQL Server, but multi-statment will be treated as function
--
CREATE FUNCTION fn_Get_DateSample()
RETURNS TABLE
AS
RETURN (SELECT Id, Name, Cast(DateOfBirth as Date) DOB FROM tblDateSample)

CREATE FUNCTION fn_Get_DateSample_Multivalue()
RETURNS @TABLE TABLE (Id int, Name nvarchar(20), DOB Date)
AS
BEGIN
	INSERT INTO @TABLE
	SELECT ID, NAME, CAST(DateOfBirth as Date) DOB FROM tblDateSample

	RETURN --Whatever you insert into the @table will be returned
END

SELECT * FROM fn_Get_DateSample()
SELECT * FROM fn_Get_DateSample_MultiValue()

--Update inline function as table
UPDATE fn_Get_DateSample() SET NAME = 'Sam1' WHERE NAME = 'Sam'
SELECT * FROM fn_Get_DateSample()

--You cannot update multi-stage table function
UPDATE fn_Get_DateSample_Multivalue() SET NAME = 'Sam' WHERE NAME = 'Sam1'