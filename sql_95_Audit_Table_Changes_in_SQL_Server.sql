--Trace the table change

CREATE TRIGGER tr_AuditTableChanges
ON ALL SERVER
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
	SELECT EventData()
END

CREATE TABLE MyTable(Id int, Name nvarchar(20))

CREATE TABLE TableChanges
(
	DatabaseName nvarchar(250),
	TableName nvarchar(250),
	EventType nvarchar(250),
	LoginName nvarchar(250),
	SQLCommand nvarchar(2500),
	AuditDataTime datetime
)
GO

ALTER TRIGGER tr_AuditTableChanges
ON ALL SERVER
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
	DECLARE @EventData XML
	SELECT @EventData = EventData()

	INSERT INTO [sample].dbo.TableChanges --Use fully qualified name becuase it is an ALL SERVER Trigger
	(DatabaseName, TableName, EventType, LoginName, SQLCommand, AuditDataTime)
	values
	(
	@EventData.value('(/EVENT_INSTANCE/DatabaseName)[1]', 'nvarchar(250)'),
	@EventData.value('(/EVENT_INSTANCE/ObjectName)[1]', 'nvarchar(250)'),
	@EventData.value('(/EVENT_INSTANCE/EventType)[1]', 'nvarchar(250)'),
	@EventData.value('(/EVENT_INSTANCE/LoginName)[1]', 'nvarchar(250)'),
	@EventData.value('(/EVENT_INSTANCE/TSQLCommand)[1]', 'nvarchar(2500)'),
	GetDate()
	)
END

DROP TABLE MyTable

select * from tablechanges