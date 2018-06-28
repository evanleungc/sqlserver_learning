--Transaction 2
--The transaction 1 has locked the resource when transaction 2 want to use it
Set transaction isolation level serializable

begin tran

select ItemsInStock from tblInventory where Id = 1

commit transaction

--Snapshot
Alter database sample 
set allow_snapshot_isolation on --**alter to snapshot

set transaction isolation level snapshot
begin tran
select ItemsInStock from tblInventory where Id = 1
commit transaction

--Another trial£ºYou cannot update using snapshot when it is being used by another transaction.
--				However, you can select it like we have done before
set transaction isolation level snapshot
begin tran
update tblInventory set
itemsinstock = 8 where id = 1

commit transaction