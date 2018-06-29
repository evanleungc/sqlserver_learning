Alter PROCEDURE spTransaction1
as
Begin
	begin tran
	begin try
		Update TableA Set Name = 'Mark Transaction 1'
		where id = 1
		waitfor delay '00:00:05'
		update tableB set name = 'Mary Transaction 1'
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
execute spTransaction1