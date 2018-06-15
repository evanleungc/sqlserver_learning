Select * from tblEmployee

Select gender, sum(salary) as Total
from tblEmployee
group by gender

Alter Table tblEmployee
Alter column Salary int