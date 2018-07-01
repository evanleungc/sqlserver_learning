--Select Into

/*
Select from one table and insert into another table
*/

select * into #backup from tblEmployee
select * from #backup

drop table #backup

select tblEmployee.*, tblDepartment.DepartmentName into #backup
from tblEmployee
inner join tblDepartment
on tblEmployee.DepartmentID = tblDepartment.Id

select * from #backup

drop table #backup
--The following trick will create a table which has the same structure as the table but does not have any data
select * into #backup from tblEmployee where 1 != 1
select * from #backup

--Insert a table into another table
Insert Into #backup
Select * From tblEmployee

select * from #backup