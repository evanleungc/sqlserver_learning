--Cursor:Word on row by row basis, a pointer to a row
Declare @ProductId int
Declare @Name nvarchar(30)

Declare ProdcutCursor Cursor For
Select Id, Name from tblProduct3 where Id < 1000

Open ProdcutCursor

Fetch Next From ProdcutCursor into @ProductId, @Name

While(@@FETCH_STATUS = 0)
Begin
	print 'Id = ' + CAST(@ProductId AS NVARCHAR(20)) + ' Name = ' + @Name

	Fetch Next From ProdcutCursor into @ProductId, @Name

End

Close ProdcutCursor
Deallocate ProdcutCursor
------
Declare @ProductId int
Declare @ProductName nvarchar(30)

Declare ProductCursor Cursor For
Select ProductId from tblProductSales3

Open ProductCursor

Fetch Next from ProductCursor into @ProductId

While(@@FETCH_STATUS = 0)
Begin
	Select @ProductName = Name from tblProduct3 where Id = @ProductId
	If (@ProductName = 'Product - 55')
	Begin
		Update tblProductSales3 set UnitPrice = 55 where ProductId = @ProductId
	End
	Fetch Next from ProductCursor into @ProductId
End
Close ProductCursor
Deallocate ProductCursor