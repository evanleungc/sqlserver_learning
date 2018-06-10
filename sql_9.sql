--Unique Key
--We can have only primary key but more than one unique key
--Unique Key can have one null

Select * from tblPerson
Alter Table tblPerson
Add Constraint UQ_tblPerson_Email Unique(Email)

Alter Table tblPerson
Drop Constraint UQ_tblPerson_Email