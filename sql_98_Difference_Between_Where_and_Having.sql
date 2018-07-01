/*
Where clause filters rows before aggregate calcualtions are performed
Having clause filters rows after agregate calculations are performed

Having is slower than where, because where will filter before aggregation
*/
SELECT ProductId, Sum(QuantitySold) As TotalSales
From tblSales
Group By ProductId

SELECT ProductId, Sum(QuantitySold) As TotalSales
From tblSales
Group By ProductId
Having ProductId = 1
