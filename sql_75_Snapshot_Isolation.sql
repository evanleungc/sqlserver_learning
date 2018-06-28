/*
Difference between serialize and snapshot

Serializable isolation is implemented by acquiring locks which means the resources are
locked for the duration of the current transaction. This is isolation level does not have any 
concurrency side effects but at the cost of significant reduction in concurrency

Snpshot isolation does not qcquire locks, it maintains versioning in Tempdb. Since, snapshot isolation does not lock resources, 
it can significantly increase the number of concurrent transaction while 
providing the same level of data consistency as seriazlizble isolation does.
*/
select * from tblInventory
update tblInventory set ItemsInStock = 10 where id = 1
--Transaction 1

Set transaction isolation level serializable

begin tran
update tblInventory
set ItemsInStock = 5 where id = 1

commit transaction


--Transaction 1

begin tran
update tblInventory
set ItemsInStock = 5 where id = 1

commit transaction