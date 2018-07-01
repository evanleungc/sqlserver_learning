--Apply can join with function that returns table
Select D.DepartmentName, E.name, E.gender, E.salary from tblDepartment D
Inner Join tblEmployee E
on D.id = E.departmentid

Select D.DepartmentName, E.name, E.gender, E.salary from tblDepartment D
Left Join tblEmployee E
on D.id = E.departmentid

Create function fn_GetEmployeesByDepartmentId(@Departmentid int)
returns table
as
return
(
select * from tblEmployee
where DepartmentId = @Departmentid
)

select * from fn_GetEmployeesByDepartmentId(1)

Select D.DepartmentName, E.name, E.gender, E.salary
from tblDepartment D
cross apply fn_GetEmployeesByDepartmentId(D.Id) E

Select D.DepartmentName, E.name, E.gender, E.salary
from tblDepartment D
outer apply fn_GetEmployeesByDepartmentId(D.Id) E