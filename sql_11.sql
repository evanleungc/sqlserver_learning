use sample

create table tblEmployee
(
ID int primary key,
Name nvarchar(50),
Gender nvarchar(50),
Slary int,
City nvarchar(50)
)

--Change column name
sp_rename 'tblEmployee.Slary', Salary

insert into tblEmployee values(1, 'Tom', 'Male', 4000, 'London')

select * from tblEmployee

select sum(Salary) from tblEmployee--Aggregate

--Group by
Select City, sum(Salary) as TotalSalary
From tblEmployee
Group by City

--The following is wrong because the groupby should be in the select
Select City, sum(Salary) as TotalSalary
From tblEmployee
Group by Gender 

Select City, Gender, sum(Salary) as TotalSalary
From tblEmployee
Group by City, Gender

Select City, Gender, sum(Salary) as TotalSalary, count(ID) as TotalEmployee
From tblEmployee
Group by City, Gender

--Using Where, first filter with where then group, so where goes before group by
Select City, Gender, sum(Salary) as TotalSalary, count(ID) as TotalEmployee
From tblEmployee
Where Gender = 'Male'
Group by City, Gender

--Using Having, first group but only show having part, so having goes after group by
Select City, Gender, sum(Salary) as TotalSalary, count(ID) as TotalEmployee
From tblEmployee
Group by City, Gender
Having Gender = 'Male'

--Aggregation cannot be used in Where Clause
Select Gender, City, Sum(Salary) as TotalSalary from tblEmployee 
Where sum(Salary) > 1000 --Error
Group By City, Gender

--Aggregation can be used in Having Clause
Select City, Sum(Salary) as TotalSalary from tblEmployee 
Group By City
Having sum(Salary) > 1000