CREATE PROCEDURE spTransaction2
as
Begin
	begin tran
	Update TableB Set Name = 'Mark Transaction 2'
	where id = 1
	waitfor delay '00:00:05'
	update tableA set name = 'Mary Transaction 2'
	where id = 1
	commit tran
End

exec spTransaction2

select * from tableA
select * from tableB
