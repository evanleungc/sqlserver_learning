use sample

--Index View
--When indexed view is used, it will be 

--Product
CREATE TABLE tblProduct
(
ProductId int identity(1,1) primary key,
Name nvarchar(20),
UnitPrice int
)
go
Insert into tblProduct values('Books', 20)
Insert into tblProduct values('Pens', 14)
Insert into tblProduct values('Pencils', 10)
Insert into tblProduct values('Clips', 10)

CREATE TABLE tblSales
(
ProductId int,
QuantitySold int
)
GO

Insert into tblSales values (1, 10)
Insert into tblSales values (3, 23)
Insert into tblSales values (4, 21)
Insert into tblSales values (2, 12)
Insert into tblSales values (1, 13)
Insert into tblSales values (3, 12)
Insert into tblSales values (4, 13)
Insert into tblSales values (1, 11)
Insert into tblSales values (2, 12)
Insert into tblSales values (1, 14)

ALTER VIEW vWTotalSalesByProduct
WITH SCHEMABINDING --If you use indexed view, you need to schemabinding
AS
Select	a.Name,
		count_big(*) as TotalTransaction,  --count_big will reutrn the count with data type big_int
		sum(isnull((a.unitprice * b.quantitysold), 0)) as TotalSales --Use isnull to prevent from null values
From dbo.tblProduct as a
Join dbo.tblSales as b
ON a.ProductId = b.ProductId
GROUP BY a.Name

SELECT * FROM vWTotalSalesByProduct

CREATE UNIQUE CLUSTERED INDEX UIX_vWTotalSalesByProduct_Name
on vWTotalSalesByProduct(Name)

--This performence is slower than directly creating index on a new table
--Not good for database but daily usage if you only need the view for a temporarily usage