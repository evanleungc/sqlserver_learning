--Lost update problem happends when 2 transactions read and update the same data

--Transaction 1
select * from tblProduct2
Begin Tran
Declare @QtyAvailable int

select @QtyAvailable = QtyAvailable
from tblProduct2 where productid = 1
waitfor delay '00:00:10'
set @QtyAvailable = @QtyAvailable - 1

update tblProduct2
set QtyAvailable = @QtyAvailable where productid = 1

print @QtyAvailable
commit tran

--Transaction 1
set transaction isolation level repeatable read --waiting for the another transaction to read

select * from tblProduct2
Begin Tran
Declare @QtyAvailable int

select @QtyAvailable = QtyAvailable
from tblProduct2 where productid = 1
waitfor delay '00:00:10'
set @QtyAvailable = @QtyAvailable - 1

update tblProduct2
set QtyAvailable = @QtyAvailable where productid = 1

print @QtyAvailable
commit tran
