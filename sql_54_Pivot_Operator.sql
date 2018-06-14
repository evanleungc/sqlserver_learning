--Pivot Operator
--Pivot is a sql server operator that can be used to turn unique values from on column, into multiple columns in the output, thereby
--		effectively rotating a table

CREATE TABLE tblProductSales
(
SalesAgent nvarchar(20),
SalesCountry nvarchar(20),
SalesAmount int
)

Insert into tblProductSales Values('Tom', 'UK', 200)
Insert into tblProductSales Values('John', 'US', 180)
Insert into tblProductSales Values('John', 'UK', 260)
Insert into tblProductSales Values('David', 'India', 450)
Insert into tblProductSales Values('Tom', 'India', 350)
Insert into tblProductSales Values('David', 'US', 200)
Insert into tblProductSales Values('Tom', 'US', 300)
Insert into tblProductSales Values('John', 'India', 540)
Insert into tblProductSales Values('John', 'UK', 120)
Insert into tblProductSales Values('David', 'US', 220)
Insert into tblProductSales Values('John', 'UK', 420)
Insert into tblProductSales Values('David', 'UK', 450)

Select * From tblProductSales

SELECT SalesAgent, SalesCountry, SUM(SalesAmount) as TotalSales
FROM tblProductSales
GROUP BY SalesAgent, SalesCountry
ORDER BY SalesAgent,SalesCountry

--Pivot
SELECT SalesAgent, India, US, UK --India, US, UK are from pivot
From tblProductSales
PIVOT
(
	SUM(SalesAmount)
	FOR SalesCountry
	IN ([India], [US], [UK])
)
As PivotTalbe

SELECT SalesAgent, India, US, UK
FROM tblProductSales
PIVOT
(
	SUM(SalesAmount) --Then counry become unique
	FOR SalesCountry 
	IN ([India], [US], [UK])
)
As PivotTable

--If the original table with id columns they will consider it and return wrong results
CREATE TABLE tblProductSales2
(
ID int identity(1,1),
SalesAgent nvarchar(20),
SalesCountry nvarchar(20),
SalesAmount int
)

Insert into tblProductSales2 Values('Tom', 'UK', 200)
Insert into tblProductSales2 Values('John', 'US', 180)
Insert into tblProductSales2 Values('John', 'UK', 260)
Insert into tblProductSales2 Values('David', 'India', 450)
Insert into tblProductSales2 Values('Tom', 'India', 350)
Insert into tblProductSales2 Values('David', 'US', 200)
Insert into tblProductSales2 Values('Tom', 'US', 300)
Insert into tblProductSales2 Values('John', 'India', 540)
Insert into tblProductSales2 Values('John', 'UK', 120)
Insert into tblProductSales2 Values('David', 'US', 220)
Insert into tblProductSales2 Values('John', 'UK', 420)
Insert into tblProductSales2 Values('David', 'UK', 450)

--WRONG, it actually group by with id
SELECT SalesAgent, India, US, UK
FROM tblProductSales2
PIVOT
(
	SUM(SalesAmount)
	FOR SalesCountry
	IN (India, US, UK)
)
AS PivotTable

Select * from tblProductSales2
SELECT SalesAgent, India, US, UK
FROM
(
	Select SalesAgent, SalesCountry, SalesAmount
	From tblProductSales2
) AS SourceTable
PIVOT
(
	SUM(SalesAmount)
	FOR SalesCountry
	IN (India, US, UK)
)
AS PivotTable