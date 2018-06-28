--Transaction 1

set transaction isolation level read committed
begin transaction
update tblInventory
set itemsinstock = 10 where id =1
commit transaction