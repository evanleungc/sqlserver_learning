--Concurrent Transaction
CREATE TABLE #tblTest
(
Id Int Identity(1,1) primary key,
AccountName nvarchar(20),
Balance int
)
Insert into #tblTest values('Mark', 1000)
Insert into #tblTest values('Mary', 1000)

BEGIN TRY
	BEGIN TRAN
		UPDATE #tblTest SET Balance = Balance - 100 where Id = 1
		UPDATE #tblTest SET Balance = Balance + 100 where Id = 'A'
	COMMIT TRAN
	PRINT 'Transaction committed'
END TRY
BEGIN CATCH
	ROLLBACK TRAN
	PRINT 'Transaction rolled back'
END CATCH

SELECT * FROM #tblTest

--Common Concurrency Problem
/*
1. DirtyReads
2. LostUpdates
3. Nonrepeatable Reads
4. Phantom Reads
*/
--SQL Server Transaction Isolation Levels
/*
1. ReadUncommited
2. ReadCommitted
3. RepeatableRead
4. Snapshot
5. Serializable
*/

--The ultimate solution is only give the permission to only ONE USER
