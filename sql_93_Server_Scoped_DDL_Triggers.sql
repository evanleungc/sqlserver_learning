Create TRIGGER tryMyfirstTrigger
On database
for create_table, alter_table, drop_table
as
begin
	print 'you have done something'
end
--This trigger will only be useful in the sample database because you create that in the database
--Create the trigger in scope can solve the problem if we want to create a trigger that can be used in another database

Create TRIGGER tryMyfirstTrigger
On ALL SERVER --Define the scope here
for create_table, alter_table, drop_table
as
begin
	print 'you have done something'
end

Drop Trigger tryMyfirstTrigger on all server