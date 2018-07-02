-- function in SQL
--1. LEFT/RIGHT

SELECT Right('ABCDEF', 4)

--2.CHARINDEX

SELECT CHARINDEX('@', 'sara@aaa.com')
SELECT CHARINDEX('@', 'sara@aaa.com', 2)

--3.SUBSTRING
--Get domain name from the email
DECLARE @string nvarchar(50)
SET @string = 'sara@aaa.com'
SELECT SUBSTRING(@string, charindex('@', @string) + 1, len(@string))

SELECT		SUBSTRING(Email, CHARINDEX('@', Email) + 1, LEN(Email)) as Domain,
			Count(Id) as DomainCount
FROM		tblPerson
GROUP BY	SUBSTRING(Email, CHARINDEX('@', Email) + 1, LEN(Email))