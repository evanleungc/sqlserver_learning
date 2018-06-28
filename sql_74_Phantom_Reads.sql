/*
Phantom read happens when one transaction executes a query twice and it gets a different number of rows
in the result set each time

Difference between Repeatable Read and Serializable

Repeatable: Only prevent from being updated or deleted when the table is being read by another transaction.
		It cannot prevent from being inserted new rows

Serializable: Prevent both
*/
--Create Tables
drop table Emp
Create table Emp
(
id int primary key,
name nvarchar(20)
)
Go

insert into Emp values(1, 'Mark')
insert into Emp values(3, 'Sara')

--Transaction 1
begin tran
select * from Emp where id between 1 and 3 --2 rows
waitfor delay '00:00:10'
select * from Emp where id between 1 and 3 --3 rows becuase you insert another row in transaction 2
commit tran

--Snapshot or Serializable To Solve the problem
set transaction isolation level serializable
--The lock is added to "1 and 3"

begin tran
select * from Emp where id between 1 and 3 --2 rows
waitfor delay '00:00:10'
select * from Emp where id between 1 and 3 --3 rows
commit tran