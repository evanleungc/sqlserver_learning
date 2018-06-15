--Test on join and subquery

CHECKPOINT
GO
DBCC DROPCLEANBUFFERS; --Clear query cache
GO
DBCC FREEPROCCACHE; --Clear execution plan cache

SELECT Id, Name, [Description]
From tblProduct3
Where Id in 
(
	Select ProductId from tblProductSales3
)

SELECT Distinct a.Id, a.Name, a.[Description]
From tblProduct3 a
Join tblProductSales3 b
On a.Id = b.ProductId

--MSDN says that using join is quicker if using exists
--Actually it does not matter, because sql server will prepare a plan that have good performance.
--If the plan is the same, they perform the same
SELECT Id, Name, [Description]
from tblProduct3
where not exists (Select * from tblProductSales3 where ProductId = tblProduct3.Id)

SELECT a.Id, a.Name, a.[Description]
from tblProduct3 a
left join tblProductSales3 b
on a.Id = b.ProductId
where b.ProductId is null