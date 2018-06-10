--Indexes
--Used to find data quickly
--Table scans is slow and if there is no index, it will go table scanning
--If the table is big, the table scanning is very slow

CREATE INDEX	IX_tblEmployee_Salary --Name in convenion IX_tablename_columnname
ON				tblEmployee (SALARY ASC) --Table name and Salary and Order of the key: "ASC" "DESC"

SELECT * FROM tblEmployee

sp_Helpindex tblEmployee

DROP INDEX tblEmployee.IX_tblEmployee_Salary --Drop index