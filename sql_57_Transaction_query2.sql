SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED --If you don't isolate, it will stuck because the thing is not commited in other query
Select * from tblProduct2