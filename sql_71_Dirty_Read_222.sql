--Transaction 2
set transaction isolation level read uncommitted --Normall you cannot read something that is not completed in another transaction
--If this is set, the dirty read data occurs
select * from tblEmployee2 where employeeid = 1

--Or you can do this in the following way
set transaction isolation level read committed
select * from tblEmployee2 (nolock) where employeeid = 1