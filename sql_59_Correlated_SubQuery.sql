--Correlated Subquery
--If the subquery depends on the outer query for its values, then that sub query is called as correlated subquery
Select	Name, 
		(select isnull(sum(QuantitySold),0) from tblSales2 where ProductId = 1) as TotalQuantitySold
From tblProduct
where ProductId = 1

Select ProductId, Name
FROM tblProduct where ProductId not in (Select distinct ProductId from tblSales2) -- the sub query will executed first

--The 'where ProductId = tblProduct.ProductId' is depend on outer query so it is a correlted subquery
Select	Name, 
		(select isnull(sum(QuantitySold),0) from tblSales2 where ProductId = tblProduct.ProductId) as TotalQuantitySold
from tblProduct