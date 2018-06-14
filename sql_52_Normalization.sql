--Normalization
--We can separate a large table into small ones then link them through keys
/*
Problems with big table
1. Disk Space Wastage
2. Data Inconsistency, when you update department, you need to update a lot of rows
3. DML queries can be slow because you need to update many duplicate rows
*/

/*
6 Normal Forms
Usually to 3NF

--1st Normal Form
(1) Data in each column should be atomic. No multiple values, separted by comma.
(2) The table does not contain any repeating column groups
(3) Identify each record uniquely using primary key
*/

