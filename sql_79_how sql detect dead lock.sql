SET DEADLOCK_PRIORITY NORMAL --DEFAULT

--You can also set an integer value in range of -10 to 10
--Low: -5
--Normal: 0
--High: 5

/*
1. If the DEADLOCK_PRIORITY is different, the session with the lowest priority is selected as the victim
2. If both the sessions have the same priority, the transaction that is least expensivve to rollback is selected as the victim
3. If both the sessions have the same deadlock priority and the same cost, a victim is chosen randomly
*/