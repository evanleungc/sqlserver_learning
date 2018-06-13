--Triggers

--DML
--DDL
--Logon

--DML Triggers are fired automatically in response to DML events(INSERT, UPDATE & DELETE)
--DML can be further classified into 2 types
--1.After Triggers (Sometimes called as FOR triggers)
--This trigger fire after the triggering action
--2.Insteand of Triggers
--This trigger fires instead of the triggering action

--After Triggers

CREATE TABLE tblEmployeeAudit
(
ID INT IDENTITY(1,1),
AuditDate nvarchar(100)
)

CREATE TRIGGER tr_tblEMployee_ForInsert
ON tblEmployee 
FOR INSERT
AS
BEGIN
	DECLARE @Id int
	Select @Id = Id from Inserted --**Inserted refer to the content you just inset and create a temporary table called 'inserted'
	Insert into tblEmployeeAudit
	Values('New employee with Id = ' + CAST(@Id as nvarchar) + ' is added at '+ CAST(GETDATE() as nvarchar))
END

INSERT INTO tblEmployee Values(11, 'Evan', 'Male', '50000', 'China', '1')
SELECT * FROM tblEmployee
SELECT * FROM tblEmployeeAudit

CREATE TRIGGER tr_tblEmployee_ForDelete
ON tblEmployee
FOR DELETE
AS
BEGIN
	DECLARE @Id int
	SELECT @Id=Id from deleted
	INSERT INTO tblEmployeeAudit
	Values ('An existing employee with id = ' + CAST(@Id as nvarchar(5)) + ' is deleted at ' + CAST(GETDATE() as nvarchar(20)))
END

DELETE FROM tblEmployee WHERE ID = 11
SELECT * FROM tblEmployee
SELECT * FROM tblEmployeeAudit
