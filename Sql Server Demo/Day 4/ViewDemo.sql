USE Northwind
GO
CREATE VIEW dbo.[Order Subtotals] WITH ENCRYPTION
AS
SELECT OrderID,
Sum(CONVERT(money,(UnitPrice * Quantity*( 1-Discount) / 100)) * 100) AS Subtotal 
FROM [Order Details] 
GROUP BY OrderID 
GO



--Demo for Views


Create View AuthorData As
SELECT au_lname, au_fname 
FROM authors
WHERE au_id IN
   (SELECT au_id
   FROM titleauthor
   WHERE title_id IN
      (SELECT title_id
      FROM titles
      WHERE type = 'popular_comp'))
sp_helptext 'AuthorData'
Select * from AuthorData Where au_lname Like '[A-D]%'

Use Northwind
Go

Create View Employee As
Select * From Emp

Select * from Employee

Insert Employee Values('10','Pankaj','1001','24000',20)
Update Employee Set Salary=Salary+Salary*25/100 Where EmpNo='10'
Delete Employee Where EmpNo='10'
Grant Select On Object::dbo.Employee to Test
Select * from sysusers
select * from sys.all_views
sp_HELP 'Employee'
Create View vEmployees As
Select * from Northwind.dbo.Emp 
Union
Select * from Pubs.dbo.Emp

Select * from vEmployees
Insert Dept Values(50,'Training','Pune')

--Demo For Indexed View
USE AdventureWorks;
GO
--Set the options to support indexed views.
SET NUMERIC_ROUNDABORT OFF;
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT,
    QUOTED_IDENTIFIER, ANSI_NULLS ON;
GO
--Create view with schemabinding.
IF OBJECT_ID ('Sales.vOrders', 'view') IS NOT NULL
DROP VIEW Sales.vOrders ;
GO
CREATE VIEW Sales.vOrders
WITH SCHEMABINDING
AS
    SELECT SUM(UnitPrice*OrderQty*(1.00-UnitPriceDiscount)) AS Revenue,
        OrderDate, ProductID, COUNT_BIG(*) AS COUNT
    FROM Sales.SalesOrderDetail AS od, Sales.SalesOrderHeader AS o
    WHERE od.SalesOrderID = o.SalesOrderID
    GROUP BY OrderDate, ProductID;
GO
--Create an index on the view.
CREATE UNIQUE CLUSTERED INDEX IDX_V1 
    ON Sales.vOrders (OrderDate, ProductID);
GO
--This query can use the indexed view even though the view is 
--not specified in the FROM clause.
SELECT SUM(UnitPrice*OrderQty*(1.00-UnitPriceDiscount)) AS Rev, 
    OrderDate, ProductID
FROM Sales.SalesOrderDetail AS od
    JOIN Sales.SalesOrderHeader AS o ON od.SalesOrderID=o.SalesOrderID
        AND ProductID BETWEEN 700 and 800
        AND OrderDate >= CONVERT(datetime,'05/01/2002',101)
GROUP BY OrderDate, ProductID
ORDER BY Rev DESC;
GO
--This query can use the above indexed view.
SELECT  OrderDate, SUM(UnitPrice*OrderQty*(1.00-UnitPriceDiscount)) AS Rev
FROM Sales.SalesOrderDetail AS od
    JOIN Sales.SalesOrderHeader AS o ON od.SalesOrderID=o.SalesOrderID
        AND DATEPART(mm,OrderDate)= 3
        AND DATEPART(yy,OrderDate) = 2002
GROUP BY OrderDate
ORDER BY OrderDate ASC;

Select * from Sales.vOrders
Select * from DistributedDeptView
