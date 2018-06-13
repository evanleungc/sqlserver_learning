--Clustred and Unclustred Indexes
--A cluster index determines the physical order of data in a table. For this reason, a table can have only ONE clustered index.
--A uncluster index will not affect the physical order and it can be more than 1 in the table
--Clustered index is faster than unclustred index becaue the unclustred index has to refer back to the table, if the selected column is not presented in the index
--Clustered index is in the table itself but unclustred index is stored in another place so it faster and consume less space
--A primary key is a clustred index
sp_HelpIndex tblEmployee
CREATE TABLE #INDEX_TEST
(
ID INT PRIMARY KEY,
NAME NVARCHAR(20)
)

INSERT INTO #INDEX_TEST VALUES(3,'JOHN')
INSERT INTO #INDEX_TEST VALUES(5,'MIKE')
INSERT INTO #INDEX_TEST VALUES(2,'AMY')

SELECT * FROM #INDEX_TEST --No matter how you insert data, it will be sorted by the clustered index

--COMPOSITE CLUSTRED INDEX
CREATE TABLE INDEX_TEST2
(
ID INT,
NAME NVARCHAR(20),
GENDER NVARCHAR(20)
)

INSERT INTO INDEX_TEST2 VALUES(3,'JOHN', 'MALE')
INSERT INTO INDEX_TEST2 VALUES(5,'MIKE', 'MALE')
INSERT INTO INDEX_TEST2 VALUES(2,'AMY', 'FEMALE')

CREATE CLUSTERED INDEX		IX_INDEX_TEST2_GENDER_NAME
ON							INDEX_TEST2 (GENDER DESC, NAME ASC)  --First order by gender then name

SELECT * FROM INDEX_TEST2

DROP INDEX INDEX_TEST2.IX_INDEX_TEST2_GENDER_NAME
