--***********--
Alter PROCEDURE spTransaction2
as
Begin
	begin try
		begin tran
		Update TableB Set Name = 'Mark Transaction 2'
		where id = 1
		waitfor delay '00:00:05'
		update tableA set name = 'Mary Transaction 2'
		where id = 1
		commit tran
		print 'transaction succeeded'
	end try
	begin catch
		if (error_number() = 1205)
		begin
			print 'deadlock. transaction failed. please retry'
		end
		rollback
	end catch
End

--*****************--
execute spTransaction2
