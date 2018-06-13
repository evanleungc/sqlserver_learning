--View Limitations

--1.You can't add parameter to a view
--2.You can't add constraint to a view
--3.You can't use order by in a view
--4.View cannot be based on temporary table or global temporary table

CREATE VIEW vMEmployeeDetails
@Gender nvarchar(20)
as
Select Id, Name, Gender from tblEmployee
Where gender = @Gender --Wrong

--You can use inline function to do it
CREATE FUNCTION fn_Test(@gender nvarchar(20))
RETURNS TABLE
AS
RETURN (Select Id, Name, Gender from tblEmployee WHERE gender= @gender)

drop function fn_Test

select * from fn_Test('male')