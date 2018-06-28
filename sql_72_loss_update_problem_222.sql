--Transaction 2


select * from tblProduct2
Begin Tran
Declare @QtyAvailable int

select @QtyAvailable = QtyAvailable
from tblProduct2 where productid = 1
waitfor delay '00:00:1'
set @QtyAvailable = @QtyAvailable - 2

update tblProduct2
set QtyAvailable = @QtyAvailable where productid = 1

print @QtyAvailable
commit tran

set transaction isolation level repeatable read
--Transaction 2


select * from tblProduct2
Begin Tran
Declare @QtyAvailable int

select @QtyAvailable = QtyAvailable
from tblProduct2 where productid = 1
waitfor delay '00:00:1'
set @QtyAvailable = @QtyAvailable - 2

update tblProduct2
set QtyAvailable = @QtyAvailable where productid = 1

print @QtyAvailable
commit tran