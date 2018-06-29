--When block, want to know which transaction cause the block
Begin Tran
Update TableA set Name = 'Mark Transaction 1'
where Id = 1

Commit

--Kill a process
kill 56 -the number can be found using DBCC OpenTran