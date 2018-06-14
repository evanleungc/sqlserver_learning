--Transaction Acid Test
/*A transaction is a group of database comands that are treated as a single unit.
	A successful transaction must pass the 'ACID' test, that is, it must be

Atomic-All statements in the transaction either completed succesfully or they were all rolled back.
		The task that the set of operations represents is either acocomplished or not, but in any case not left half-done

Consistent-All data touched by the transaction is left in a logically consistent state. For example,
	if stock available number decremented from tblProductTable, then, there has to be a related entry in tblProductSales table. 
	The inventory cannot just disappear.

Isolated-The transaction must affect data without interfering with other concurrent transactions, or being interfered with by them.
	This prevents transaction from making changes to data based on uncommitted information, 
	for exmaple changes to a record that are subsequently rooled back. Most database use locking to maintain transaction isolation

Durable-Once a change is made, it is permanent. If a system error or power failure occurs before a set of commands is complete,
		those commandas are undone and the data is restored to its original state once the system begins running again.
*/