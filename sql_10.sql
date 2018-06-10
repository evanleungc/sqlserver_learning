--All about Select

--Select all columns
Select * from tblPerson

--Select distinct columns
Select distinct name, email from tblPerson

--Filter with where
Select * from tblPerson where GenderID = 1
Select * from tblPerson where GenderID != 1
Select * from tblPerson where GenderID in (1,2)
Select * from tblPerson where GenderID between 1 and 2
Select * from tblPerson where Name like 's%'
Select * from tblPerson where Name like 's___'
Select * from tblPerson where Email like '%@%'
Select * from tblPerson where Email not like '%@%'
Select * from tblPerson where Name like '[msk]%'
Select * from tblPerson where Name like '[^msk]%'

--Sort
Select * from tblPerson order by Name
Select * from tblPerson order by Name DESC
Select * from tblPerson order by Name, GenderID DESC

--Draw Sample
Select top 5 * from tblPerson
Select top 5 Name from tblPerson