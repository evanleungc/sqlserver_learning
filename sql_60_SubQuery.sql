--SubQuery
Select * from tblSales
Select * from tblProduct

Select a.ProductId, b.UnitPrice, a.QuantitySold
into tblSales2
From tblSales a
Join tblProduct b
On a.ProductId = b.ProductId

Select * from tblSales2
Delete from tblSales2 where productid = 1

--Sub query
Select * from tblProduct where ProductId not in (select ProductId from tblSales2)

--OR using join

Select a.ProductId, a.Name, a.UnitPrice
From tblProduct a
Left Join tblSales2 b
On a.ProductId = b.ProductId
where b.ProductId is null

--Sub query
Select	Name, 
		(select isnull(sum(QuantitySold),0) from tblSales2 where ProductId = tblProduct.ProductId) as TotalQuantitySold
from tblProduct

--Or join

Select a.ProductId, a.Name, isnull(sum(b.quantitysold),0) as TotalQuantitySold
FROM tblProduct a
JOIN tblSales2 b
ON a.ProductId = b.ProductId
Group by a.ProductId, a.Name
Having a.ProductId = 2

