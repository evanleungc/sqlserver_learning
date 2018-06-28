--transaction 2£ºIt will be blocked because it is trying to execute the thing that is the same as transaction 1
--			after transaction 1 is finished, the error occurs

set transaction isolation level snapshot
begin transaction
	update tblInventory
	set ItemsInStock = 5 where id = 1
commit transaction

--read committed situation
set transaction isolation level read committed
begin transaction
	update tblInventory
	set ItemsInStock = 5 where id = 1
	select * from tblInventory
commit transaction

select * from tblInventory