--Transaction 2
insert into Emp values(2, 'Evan')

----Snapshot or Serializable To Solve the problem To Solve the problem
set transaction isolation level serializable
insert into Emp values(2, 'Evan') --Only Execute after the transaction has done