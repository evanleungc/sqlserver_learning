--Transaction 2
alter database sample set read_committed_snapshot off

set transaction isolation level read committed
begin transaction
select itemsinstock from tblInventory where id = 1
commit transaction

