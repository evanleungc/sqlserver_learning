--CONVERT DATATYPE WITH CAST AND CONVERT
/*
Difference
1. Cast is on ANSI standard which you can use on other database
2. Conver can only be used on sql server

*/
USE SAMPLE
--
DECLARE @Date Datetime
SET @Date='1980-01-01 22:22:22.123'
SELECT CAST(@Date AS NVARCHAR)
SELECT CAST(@Date AS NVARCHAR(20))
SELECT CONVERT(NVARCHAR,@Date) --No length specify
SELECT CONVERT(NVARCHAR,@Date,103) --'Style' param for CONVERT, only when you convert a date to nvarchar, the style can be used.

SELECT Id, Name, Name + '-'+ CAST(Id as nvarchar) as [NAME - ID] From tblPerson
