--Check constraint
select * from tblPerson
Alter table tblPerson add age int

Insert into tblPerson values (11, 'Sarah', 's@s.com',2,-970)

Delete from tblPerson where ID = 11

Alter Table tblPerson
Add Constraint CK_tblPerson_Age CHECK (Age > 0 AND Age < 150)

Insert into tblPerson values (11, 'Sarah', 's@s.com', 2, -970) --Return error because we add constraint, but we can still add NULL

Alter Table tblPerson
Drop Constraint CK_tblPerson_Age