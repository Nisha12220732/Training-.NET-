

Select * from Employees

--(2(3+6))

SELECT EmployeeID,FirstName
FROM Employees
WHERE Region=
(SELECT Region from Employees
WHERE EmployeeID=2)


SELECT City from Employees
WHERE Region='WA'


SELECT EmployeeID,FirstName
FROM Employees
WHERE City In
(SELECT City from Employees
WHERE Region='WA')

SELECT EmployeeID,FirstName
FROM Employees
WHERE Region='WA'






--==========MultiRow Subquery===========================
SELECT * FROM Suppliers

SELECT ProductID, ProductName, UnitPrice
FROM PRODUCTS WHERE SupplierID IN
(SELECT SupplierID
FROM Suppliers
WHERE Country='USA')
--==========================================

SELECT ProductID, ProductName, SupplierID
FROM Products
WHERE UnitPrice > ALL
(Select UnitPrice
FROM Products
WHERE SupplierID=1)


--=======EXISTS===================================

SELECT SupplierID
FROM suppliers
WHERE EXISTS
(select 'A'
from orders
where suppliers.supplierid = orders.ShipVia);


select * from Shippers
Select * from Orders


--Correlated Sub Query
--=============================
---In a correlated sub query, the inner query gets executed multiple times for the 
---outer query. In correlated sub query, the inner query depends on the outer
----- query for its value

--In the below query, we are selecting all the orders where the employee’s city
 --and order’s ship city are same.


Select * From Orders Ord Where EmployeeID 
IN(Select EmployeeID From Employees Emp Where Ord.ShipCity=Emp.City)


