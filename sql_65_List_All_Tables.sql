--List All Tables in Database
Select * from sysobjects
Select * from sysobjects where xtype = 'U' --'U' means user tables
Select * from sysobjects where xtype = 'P' --'P' means stored procedure
Select distinct xtype from sysobjects
Select * from sys.tables
Select * from sys.views
Select * from sys.procedures
Select * from INFORMATION_SCHEMA.TABLES
Select * from INFORMATION_SCHEMA.VIEWS