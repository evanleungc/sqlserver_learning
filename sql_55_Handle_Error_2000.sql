USE SAMPLE
/*
ERROR IN SQL SERVER 2000 -@@ERROR
ERROR IN SQL_SERVER 2005 & LATER -TRY...CATCH
*/
drop table tblProduct2
select * into tblProduct2 from tblProduct
select * from tblProduct2
Alter Table tblProduct2 Add QtyAvailable int not null Default(0)

UPDATE tblProduct2 Set QtyAvailable = 100

Create Table tblProductSale
(
Id int primary key,
ProductId int,
QuantityToSell int
)

SELECT * FROM tblProductSale

CREATE PROC spSellProduct
@ProductId int,
@QuantityToSell int
AS
BEGIN
	--Check the stock availability, fro the product we want to sell
	Declare @StockAvailabe int
	Select @StockAvailabe = QtyAvailable From tblProduct2 Where ProductId = @ProductId

	If (@StockAvailabe < @QuantityToSell)
	BEGIN
		RAISERROR('Not enough stock available', 16, 1) 
				--('ErrorMsg', 'SeverityLevel', 'State') -16 indicate the error can be corrected
				--RAISERROR only generates error with state from 1 through 127
	END

	Else
	BEGIN
		BEGIN TRAN --
			Update tblProduct2 Set QtyAvailable = (QtyAvailable - @QuantityToSell) Where ProductId = @ProductId

			Declare @MaxProdcutSalesId int
			Select @MaxProdcutSalesId = Case When
													Max(Id) IS NULL
													THEN 0
													ELSE Max(Id)
											 End
			From tblProductSale
			Insert into tblProductSale Values(@MaxProdcutSalesId + 1, @ProductId, @QuantityToSell)
			If(@@ERROR != 0) --Indicate that there is error if not 0
				BEGIN
					ROLLBACK TRANSACTION --"TRAN"
					PRINT 'Transaction rollback'
				END
			ELSE
				COMMIT TRAN
	END
END

Exec spSellProduct 3, 50
SELECT * FROM tblProduct2
SELECT * FROM tblProductSale

delete from tblProductSale where ProductId is null