--When deadlocks occur, SQL Server chooses one of the transactions as the deadlock victim and rolls it back

--First, create a deadloc
Create table TableA
(
	Id int identity primary key,
	name nvarchar(50)
)
go

Insert into TableA values ('Mark')
go

create table TableB
(
	Id int identity primary key,
	name nvarchar(50)
)
go

insert into TableB values ('Mary')
Go

CREATE PROCEDURE spTransaction1
as
Begin
	begin tran
	Update TableA Set Name = 'Mark Transaction 1'
	where id = 1
	waitfor delay '00:00:05'
	update tableB set name = 'Mary Transaction 1'
	where id = 1
	commit tran
End

exec spTransaction1

execute sp_readerrorlog

--Set SQL Server trace flag 1222
DBCC Traceon(1222, -1) --If no -1, only session level, if -1, global level
-- Check the status of the trac flag
DBCC TraceStatus(1222, -1)
-- Turn off the trac flag
DBCC Traceoff(1222)