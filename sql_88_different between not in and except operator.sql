/*Difference between except and not in
--Excpet filters duplicates and returns only DISTINCT rows from left query that aren't in the 
right query's results, where as NOT IN does not filter the duplicates

--EXCEPT operator expects the same number of clumns in both the queries, where as NOT IN, compares
a single column from the outer query with a single column from the sub-query
*/

Create table #TableA
(
Id int primary key,
name nvarchar(20),
gender nvarchar(20)
)

Go

Insert into #TableA values(1, 'Mark', 'Male')
Insert into #TableA values(2, 'Mary', 'Female')
Insert into #TableA values(3, 'Steve', 'Male')
Insert into #TableA values(4, 'John', 'Male')
Insert into #TableA values(5, 'Sara', 'Female')

Create table #TableB
(
Id int primary key,
name nvarchar(20),
gender nvarchar(20)
)

Go

Insert into #TableB values(4, 'John', 'Male')
Insert into #TableB values(5, 'Sara', 'Female')
Insert into #TableB values(6, 'Pam', 'Female')
Insert into #TableB values(7, 'Rebecca', 'Female')
Insert into #TableB values(8, 'Jordan', 'Male')

Select Id, Name, Gender from #TableA
Except
Select Id, Name, Gender from #TableB

Select Id, Name, Gender from #TableA
Where Id not in (Select Id from #TableB)

