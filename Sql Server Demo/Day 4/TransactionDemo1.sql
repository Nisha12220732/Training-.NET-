--==================Creating Sample Table For Demo============================
Drop Table Person

CREATE TABLE Person
 (
    PersonID int PRIMARY KEY IDENTITY(1,1),
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255),
	Age INT
)
 
GO

--===============Adding Records to Person Table==================================
 
INSERT INTO Person VALUES('S', 'Aloak','17,Snow-Wood Society,Kothrud','Pune',24)

INSERT INTO Person VALUES('Chouhan','Dhiraj','23  Peach Road','Jaipur',45)

INSERT INTO Person VALUES('Patil','Neeraj','15  Race Course Road','Gwalior',25)

INSERT INTO Person VALUES('Thomas', 'Tom','509  Tower Road', 'Manglore',51)

INSERT INTO Person VALUES('Reddy','Niranjan','106  Newmarket Road','Hyderabad',26)

INSERT INTO Person VALUES('Pawar','Amit ','100  Daffodil Society','Pune',24)

INSERT INTO Person VALUES('Pandey','Nishant','14  Arera Colony','Bhopal',31)

INSERT INTO Person VALUES('Reddy','VenkatShiva ','34,4th Cross,KundanHalli','Bangalore',56)

INSERT INTO Person VALUES('Khan','Imtiyaz','72  Banargatta Road','Bangalore',34)


--======================================================================
PRINT @@TRANCOUNT
--  The BEGIN TRAN statement will increment the
--  transaction count by 1.
BEGIN TRAN
    PRINT @@TRANCOUNT
    BEGIN TRAN
        PRINT @@TRANCOUNT
--  The COMMIT statement will decrement the transaction count by 1.
    COMMIT
    PRINT @@TRANCOUNT
COMMIT
PRINT @@TRANCOUNT

--============Implicit Transaction in SQL Server=====================

SET IMPLICIT_TRANSACTIONS ON 
UPDATE 
    Person 
SET 
    Lastname = 'Chauhan', 
    Firstname = 'Dheeraj' 
WHERE 
    PersonID = 2 
--SELECT 
  --  IIF(@@OPTIONS & 2 = 2, 
    --'Implicit Transaction Mode ON', 
    --'Implicit Transaction Mode OFF'
   -- ) AS 'Transaction Mode' 
SELECT isnull ((select 'Implicit Transaction Mode ON' where @@OPTIONS & 2 = 2),'Implicit Transaction Mode OFF')AS 'Transaction Mode'
SELECT 
    @@TRANCOUNT AS OpenTransactions 
COMMIT TRAN 
SELECT 
    @@TRANCOUNT AS OpenTransactions


--==============Explicit Transaction in SQL Server=================

BEGIN TRAN
UPDATE Person 
SET    Lastname = 'Shinde', 
        Firstname = 'Alok' 
WHERE  PersonID = 1
SELECT @@TRANCOUNT AS OpenTransactions 
COMMIT TRAN 
COMMIT TRAN
SELECT @@TRANCOUNT AS OpenTransactions

--=======================

BEGIN TRAN
UPDATE Person 
SET    Lastname = 'Rajawat', 
        Firstname = 'Dharmendra'  WHERE PersonID=2
 
 
SELECT * FROM Person WHERE PersonID=2
 
ROLLBACK TRAN 
 
SELECT * FROM Person WHERE PersonID=2

--=============Save Points in Transactions======================================

BEGIN TRANSACTION 
INSERT INTO Person 
	VALUES('Kulkarni', 'Mahesh','46,ShriKripa,Chitrangan Soc.','Nashik',43)
SAVE TRANSACTION InsertStatement--Save Point 
	DELETE Person WHERE PersonID=4
	SELECT * FROM Person 
ROLLBACK TRANSACTION InsertStatement
COMMIT
SELECT * FROM Person


--=================Auto Rollback transactions in SQL Server====================

BEGIN TRAN
	INSERT INTO Person 
	VALUES('Banerjee', 'Shubham','742 Evergreen Terrace','Kolkatta',34)
    
	UPDATE Person SET Age='MiddleAge' WHERE PersonID=7

	SELECT * FROM Person
 
COMMIT TRAN


--==============Marked transactions in SQL Server==================


BEGIN TRAN DeletePerson WITH MARK 'MarkedTransactionDescription' 
    DELETE Person WHERE PersonID BETWEEN 14 AND 16    
    COMMIT TRAN DeletePerson
    
    
SELECT * FROM msdb.dbo.logmarkhistory