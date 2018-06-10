--User Defined Functions(UDF)
--**Stored Procedure cannot be used in select
CREATE FUNCTION CalAge (@DOB Datetime)
RETURNS nvarchar(50) --**What datatype you want to return, you cannot return "text, ntext, image, cursor and timestamp"
AS
BEGIN
	DECLARE @Today Datetime
	DECLARE @AgeDay int
	DECLARE @AgeMonth int
	DECLARE @AgeYear int
	DECLARE @Age nvarchar(50)
	Set @Today= GETDATE()
	Set @AgeYear = DATEDIFF(Year, @DOB, @Today) - 
		CASE
			WHEN	(Month(@Today) > Month(@DOB)) OR
					(Month(@Today) = Month(@DOB) AND Day(@Today) >= Day(@DOB))
			THEN	0
			ELSE	1
		END
	DECLARE @TempDate Datetime
	Set @TempDate = DATEADD(YEAR, @AgeYear, @DOB)
	Set @AgeMonth = DATEDIFF(Month, @TempDate, @Today) - 
		CASE
			WHEN (Day(@Today) > Day(@DOB))
			THEN 0
			ELSE 1
		END
	SET @TempDate = DateAdd(Month, @AgeMonth, @TempDate)
	SET @AgeDay = DATEDIFF(DAY, @TempDate, @Today)
	SET @AGE = CONCAT(@AgeYear, ' Year ', @AgeMonth, ' Month ', @AgeDay, ' Day')
	RETURN @AGE
END

--You need to specify two-part name like dbo.CalAge

SELECT dbo.CalAge('2017-02-03')
SELECT sample.dbo.CalAge('2017-02-03')
SELECT CalAge('2017-02-03') -- Error

SELECT Id, Name, dbo.CalAge(DateOfBirth) from tblDateSample
SELECT Id, Name, dbo.CalAge(DateOfBirth) from tblDateSample WHERE CAST(LEFT(dbo.CalAge(DateOfBirth), 2) AS INT) > 35

sp_helptext CalAge