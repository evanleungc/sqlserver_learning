--A dirty read happens when on transaction is permitted to read data that has been modified by
--another transaction that has not yet been commited.
--Transaction 1
Select * from tblEmployee2

begin tran
update tblEmployee2 set name = 'Mikey' where EmployeeId = 1

waitfor delay '00:00:15'
rollback transaction