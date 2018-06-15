--Replacing Cursor with Join
Update tblProductSales3
set UnitPrice = Case
					When Name = 'Product-55' Then 55
					When Name = 'Product-65' Then 65
					When Name like 'Product - 100%' Then 1000
				End
From tblProductSales3 a
Join tblProduct3 b
On b.Id = a.ProductId
Where (b.Name = 'Product - 55' or b.Name = 'Product - 65' or b.Name like 'Product - 100%')

select * from tblProduct3
select * from tblProductSales3