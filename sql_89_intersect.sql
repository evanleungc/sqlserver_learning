/*
The number and the order of the columns of both tables should be the same
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
Id int,
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
Intersect
Select Id, Name, Gender from #TableB

Select a.Id, a.Name, a.Gender 
from #TableA a
inner join #TableB b
on a.Id = b.Id

--Difference 1
Create table #TableC
(
Id int,
name nvarchar(20),
gender nvarchar(20)
)

Go

Insert into #TableC values(1, 'Mark', 'Male')
Insert into #TableC values(2, 'Mary', 'Female')
Insert into #TableC values(2, 'Mary', 'Female')
Insert into #TableC values(3, 'Steve', 'Male')
Insert into #TableC values(4, 'John', 'Male')
Insert into #TableC values(5, 'Sara', 'Female')

Select Id, Name, Gender from #TableA
Intersect
Select Id, Name, Gender from #TableC

Select a.Id, a.Name, a.Gender 
from #TableA a
inner join #TableC b
on a.Id = b.Id

--Two MARY in inner join but only one in intersect because intersect only return the distinct

Select distinct a.Id, a.Name, a.Gender 
from #TableA a
inner join #TableC b
on a.Id = b.Id

--Difference 2
--Intersect will retain 'Null' but inner join won't
Insert into #TableB values(Null, 'Evan', 'Male')
Insert into #TableC values(Null, 'Evan', 'Male')

Select Id, Name, Gender from #TableB
Intersect
Select Id, Name, Gender from #TableC

Select a.Id, a.Name, a.Gender 
from #TableB a
inner join #TableC b
on a.Id = b.Id