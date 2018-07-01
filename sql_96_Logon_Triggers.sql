--Logon Triggers

--Write a trigger to limit the maximun number of open connections for a user to 3

Select * from sys.dm_exec_sessions

Select is_user_process, original_login_name, *
from sys.dm_exec_sessions order by login_time desc

Create trigger tr_AuditLogin
ON ALL SERVER
FOR LOGON
AS
BEGIN
	Declare @LoginName nvarchar(100)
	Set @LoginName = Original_Login()

	IF(Select Count(*) from sys.dm_exec_sessions
	where is_user_process = 1 and original_login_name = @LoginName) > 3
	BEGIN
		Print 'Fourth connection attempt by ' + @LoginName + ' blocked'
		ROLLBACK;
	END
END

--Open more windows(scopes) you will find you will fail after three
Select is_user_process, original_login_name, *
from sys.dm_exec_sessions order by login_time desc

drop trigger tr_AuditLogin on all server