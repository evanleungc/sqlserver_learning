/*
Difference:
Read committed snapshot isolation
-No update conflicts
-Works with existing applications without requiring any change to the application
-Can be used with distributed transactions
-Provides statement-level read consistency

-Snapshot isolation
-Vulnerable to update conflicts
-Application change may be required to use with an existing application
-Cannot be used with distributed transactions: this means that the result will not be changed by another 
						transaction during the time it's in the transaction
-Provides transaction-level read consistency
*/

Alter database sample
set allow_snapshot_isolation on

--transaction 1
set transaction isolation level snapshot
begin transaction
	update tblInventory
	set ItemsInStock = 8 where id = 1
commit transaction

--read committed situation
Alter database sample
set allow_snapshot_isolation off

Alter database sample
set read_committed_snapshot on

--transaction 1
set transaction isolation level read committed

begin transaction
	update tblInventory
	set ItemsInStock = 8 where id = 1
	select * from tblInventory
commit transaction