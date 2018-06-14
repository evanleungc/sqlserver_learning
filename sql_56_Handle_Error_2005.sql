--TRY...CATCH: Cannot be used in user defined function

ALTER PROC spSellProduct
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
		BEGIN TRY --*****DIFFERENCE IS HERE******
			BEGIN TRAN
				Update tblProduct2 Set QtyAvailable = (QtyAvailable - @QuantityToSell) Where ProductId = @ProductId

				Declare @MaxProdcutSalesId int
				Select @MaxProdcutSalesId = Case When
														Max(Id) IS NULL
														THEN 0
														ELSE Max(Id)
												 End
				From tblProductSale
				--SET @MaxProdcutSalesId = @MaxProdcutSalesId + 1
				Insert into tblProductSale Values(@MaxProdcutSalesId, @ProductId, @QuantityToSell)
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK TRAN
			SELECT
				ERROR_NUMBER() AS ErrorNumber,
				ERROR_MESSAGE() AS ErrorMessage,
				ERROR_PROCEDURE() AS ErrorProcedure,
				ERROR_STATE() AS ErrorState,
				ERROR_SEVERITY() AS ErrorSeverity,
				ERROR_LINE() AS ErrorLine
		END CATCH
	END
END

Exec spSellProduct 1, 10
SELECT * FROM tblProduct2
SELECT * FROM tblProductSale