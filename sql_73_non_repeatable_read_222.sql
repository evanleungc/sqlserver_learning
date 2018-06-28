--Transaction 2

update tblInventory set itemsinstock = 5
where id = 1

--*************Use the repeatable read
--ONLY when transaction 1 is completed, the transaction 2 works
set transaction isolation level repeatable read
update tblInventory set itemsinstock = 5
where id = 1

select * from tblInventory