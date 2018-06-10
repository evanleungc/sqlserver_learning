select * from tblGender
select * from tblPerson

Insert into tblGender (ID, Gender) Values (1, 'Male')
Insert into tblGender (ID, Gender) Values (2, 'Female')
Insert into tblGender (ID, Gender) Values (3, 'Unknown')

Insert into tblPerson (ID, Name, Email, GenderID) Values (1, 'John', 'j@j.com', 1)
Insert into tblPerson (ID, Name, Email, GenderID) Values (2, 'Mary', 'm@m.com', 2)
Insert into tblPerson (ID, Name, Email, GenderID) Values (3, 'Simon', 's@s.com', 1)
Insert into tblPerson (ID, Name, Email, GenderID) Values (4, 'Sam', 'sam@sam.com', 1)
Insert into tblPerson (ID, Name, Email, GenderID) Values (5, 'May', 'may@may.com', 2)
Insert into tblPerson (ID, Name, Email, GenderID) Values (6, 'Kenny', 'k@k.com', 3)
Insert into tblPerson (ID, Name, Email) Values (7, 'Rich', 'r@r.com')

ALTER TABLE tblPerson
ADD CONSTRAINT DF_tblPerson_GenderId
DEFAULT 3 FOR GenderId

Insert into tblPerson (ID, Name, Email) Values (8, 'Mike', 'm@m.com')
Insert into tblPerson (ID, Name, Email, GenderID) Values (9, 'sara', 's@r.com', 1)
Insert into tblPerson (ID, Name, Email, GenderID) Values (10, 'Johnny', 'j@j.com', NULL)

ALTER TABLE tblPerson
DROP CONSTRAINT DF_tblPerson_GenderID