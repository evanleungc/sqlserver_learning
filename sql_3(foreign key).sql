Alter database sample set offline with rollback immediate
Alter database sample set online with rollback immediate
Drop database sample
Create database sample

Use [Sample]
Go

Create Table tblPerson
(
ID int NOT NULL Primary Key,
Name nvarchar(50) NOT NULL,
Email nvarchar(50) NOT NULL,
GenderID int
)

Create Table tblGender
(
ID int NOT NULL Primary Key,
Gender nvarchar(50) NOT NULL
)

Alter Table tblPerson add constraint tblPerson_genderID_FK
Foreign Key (GenderID) references tblGender(ID)