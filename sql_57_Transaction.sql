--Transaction
--	If all succeed, it succeed, one fail all fail and roll back to the origin state

Select * from tblProduct2

Update tblProduct2 set QtyAvailable = 200 WHERE PRODUCTID = 3

BEGIN TRAN
Select * from tblProduct2
COMMIT TRAN

BEGIN TRAN
Update tblProduct2 set QtyAvailable = 3000 WHERE PRODUCTID = 3
ROLLBACK TRAN --Go back to the former state because you roll back
