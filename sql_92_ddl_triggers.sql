--Data definition language (DDL) trigger
--fire in response to DDL event - CREATE, ALTER, AND DROP (Table, Function...)

--If you want to execute some code in response to a specific DDL event
--To prevent certain changes to your database schema
--Audit the changes that the users are making to the database structure

--SYNTAX
CREATE TRIGGER [Trigger_Name]
ON [Scope (Server | Database)]
FOR [EventType1, EventType2, ..]
AS
BEGIN
	---Triger Body
END

CREATE TRIGGER tryMyFirstTrigger
On database
for create_table
as
begin
	print 'new table created'
end

Create TRIGGER tryMyfirstTrigger
On database
for create_table, alter_table, drop_table
as
begin
	print 'you have done something'
end

create table test (id int)
drop table test

Create TRIGGER tryMysecondTrigger
On database
for drop_table
as
begin
	rollback
	print 'you cannot do it'
end

disable trigger tryMyfirstTrigger ON Database
enable trigger tryMyfirstTrigger ON Database
drop trigger tryMyfirstTrigger ON Database
drop trigger tryMysecondTrigger ON Database

Create TRIGGER trMyFirstTrigger
On database
for rename
as
begin
	print 'you just rename something'
end

drop trigger trMyFirstTrigger ON Database

sp_rename 'NewTest', 'Test'