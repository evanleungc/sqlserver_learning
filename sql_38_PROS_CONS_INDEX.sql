--PROS AND CONS ON INDEXES
/*

*/
--**PROS
sp_HelpIndex tblEmployee
CREATE INDEX IX_tblEmployee_Salary
ON tblEmployee (SALARY ASC)

SELECT * FROM tblEmployee where Salary > 4000 and Salary < 8000 --It will be benefited because it is ordered in the indexes
--The same benefit will be on DELETE ORDERBY AND GROUPBY

--*CONS
--1. Additional Storage
--2. Insert and Delete can become slow. When you do them, you need to update all the indexes as well

--** Covering query -- If all the columns that you have requested in the SELECT clause of query, are present in the index, then there is
--	no need to lookup in the table agin. The requested columns data can simply be returned from the index
-- eg. if there is a composite index called(id, name), then "select id, name from table" will not be looked up in the table
--****The clustred query will always be the covering query!!