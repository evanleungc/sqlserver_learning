/*
Except operator returns unique rows from the left query that aren't in the right query's results
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

--When using except, the number and the order of the columns must be the same in both the queries

Select Id, Name, Gender from #TableB
Except
Select Id, Name, Gender from #TableA