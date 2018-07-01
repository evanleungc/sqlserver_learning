/*
Server scoped triggers will always fire before any of the database scoped triggers

Using the sp_settriggerorder stored procedure, you can set the execution order of server-scoped
or database-scoped triggers

@triggername: Name of the trigger
@order£º Value can be first
*/
Create TRIGGER tryMyfirstTrigger
On database
for create_table
as
begin
	print 'you cerate a table'
end

Go

Create TRIGGER tryMyfirstTrigger
On ALL SERVER --Define the scope here
for create_table
as
begin
	print 'you cerate a table'
end

Go

drop trigger tryMyfirstTrigger on database
drop trigger tryMyfirstTrigger on all server

Create TRIGGER tr1
On database
for create_table
as
begin
	print 'you cerate a table 1'
end

Go

Create TRIGGER tr2
On database
for create_table
as
begin
	print 'you cerate a table 2'
end

Go

Create TRIGGER tr3
On database
for create_table
as
begin
	print 'you cerate a table 3'
end

Go

drop table test
create table test (id int)

exec sp_settriggerorder
@triggername = 'tr3',
@order = 'first',
@stmttype = 'create_table',
@namespace = 'database'
go

exec sp_settriggerorder
@triggername = 'tr1',
@order = 'last',
@stmttype = 'create_table',
@namespace = 'database'
go

drop trigger tr1 on database
drop trigger tr2 on database
drop trigger tr3 on database