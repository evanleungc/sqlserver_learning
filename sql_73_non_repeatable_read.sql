--Non repeatable read happens when one transaction reads the same data twice and another transaction updates the data in between the
--first and second read of transaction one

drop table tblInventory
Create table tblInventory
(
Id int identity(1, 1) primary key,
Product nvarchar(20),
ItemsInStock int
)
go

Insert into tblInventory values('iPhone', 10) 


Select * from tblInventory
--Transaction 1£ºThe two select results are different
Begin Transaction
select itemsinstock from tblInventory
where id = 1

waitfor delay '00:00:10'

select itemsinstock from tblInventory
where id = 1
commit transaction

--*************Use the repeatable read
set transaction isolation level repeatable read

Begin Transaction
select itemsinstock from tblInventory
where id = 1

waitfor delay '00:00:10'

select itemsinstock from tblInventory
where id = 1
commit transaction
