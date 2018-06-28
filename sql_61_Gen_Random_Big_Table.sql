use sample

If (Exists (Select * 
			from information_schema.tables
			where table_name = 'tblProductSales3'))
Begin
	Drop Table tblProductSales3
End

If (Exists (Select * 
			from information_schema.tables
			where table_name = 'tblProduct3'))
Begin
	Drop Table tblProduct3
End

CREATE TABLE tblProduct3
(
	[Id] int identity(1, 1) primary key,
	[Name] nvarchar(50),
	[Description] nvarchar(250)
)
GO

CREATE TABLE tblProductSales3
(
	Id int identity(1, 1) primary key,
	ProductId int foreign key references tblProduct3(Id),
	UnitPrice int,
	QuantitySold int
)
GO

DECLARE @Id int
Set @Id = 1

While(@Id <= 50000)
Begin
	Insert into tblProduct3 values('Product - ' + CAST(@Id as nvarchar(20)), 
	'Product - ' +CAST(@Id as nvarchar(20)) + 'Description')

	Print @Id
	Set @Id = @Id + 1
End

Select * from tblProduct3
Select * from tblProductSales3

Declare @RandomProductId int
Declare @RandomUnitPrice int
Declare @RandomQuantitySold int

Declare @UpperProductId int
Declare @LowerProductId int
Declare @UpperUnitPrice int
Declare @LowerUnitPrice int
Declare @UpperQuantitySold int
Declare @LowerQuantitySold int
Set @UpperProductId = 45000
Set @LowerProductId = 1
Set @UpperUnitPrice = 10
Set @LowerUnitPrice = 1
Set @UpperQuantitySold = 1000
Set @LowerQuantitySold = 1
PRINT Round((@UpperProductId - @LowerProductId) * Rand(), 0)

Declare @Count int
Set @Count = 1

While(@Count < 70000)
Begin
	select @RandomProductId = Round((@UpperProductId - @LowerProductId) * Rand(), 0)
	select @RandomUnitPrice = Round((@UpperUnitPrice - @LowerUnitPrice) * Rand(), 0)
	select @RandomQuantitySold = Round((@UpperQuantitySold - @LowerQuantitySold) * Rand(), 0)

	Insert into tblProductSales3
	values(@RandomProductId, @RandomUnitPrice, @RandomQuantitySold)
	Print @Count
	Set @Count = @Count + 1
End