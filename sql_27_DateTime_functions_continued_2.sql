--DateTime Functions
--1.DatePart: Similar to DATENAME, but it returns integer
SELECT DATENAME(weekday, '2012-03-30 22:22:22.123')	--RETURN VARCHAR
SELECT DATEPART(weekday, '2012-03-30 22:22:22.123')	--RETURN INTEGER

--2.DateAdd
SELECT DATEADD(DAY, 20, '2012-08-30 22:22:22.123')
SELECT DATEADD(DAY, -20, '2012-08-30 22:22:22.123')
SELECT DATEADD(MONTH, 20, '2012-08-30 22:22:22.123')

--3.DateDiff
SELECT DATEDIFF(DAY, '2012-08-30 22:22:22.123', '2014-08-30 22:22:22.123')
SELECT DATEDIFF(MONTH, '2012-08-30 22:22:22.123', '2014-08-30 22:22:22.123')

--4. Example
CREATE TABLE tblDateSample
(
Id int Identity(1, 1) Primary Key,
Name nvarchar(20),
DateOfBirth Date
)

INSERT INTO tblDateSample VALUES('Sam', '1980-12-30 00:00:00.000')
INSERT INTO tblDateSample VALUES('Pam', '1982-09-01 12:02:36.260')
INSERT INTO tblDateSample VALUES('John', '1985-08-22 12:03:30.370')
INSERT INTO tblDateSample VALUES('Sara', '1979-11-29 12:59:30.670')
go

--****
CREATE FUNCTION CalAge (@DOB Datetime)
RETURNS nvarchar(50)
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

SELECT Id, Name, dbo.CalAge(DateOfBirth) from tblDateSample