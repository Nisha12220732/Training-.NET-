--Demos for Working with Joins

--1. Cross Join(Default)
--=========================
Use Northwind
GO
Select * from Dept
Select * from Emp
GO
Select Dept.*,Emp.* From Dept,Emp
Select Dept.*,Emp.* From Dept Cross Join Emp



-- Inner Join
--===============

Select Dept.*,Emp.* From Dept,Emp Where Dept.DeptNo=Emp.DeptNo

Select Dept.*,Emp.* From Dept Inner Join Emp On Dept.DeptNo=Emp.DeptNo Where 
Emp.DeptNo=10



SELECT ProductID, ProductName, CategoryName
FROM Products, Categories
WHERE Products.CategoryID=Categories.CategoryID
GO

--OR
SELECT ProductID, ProductName, CategoryName
FROM Products inner join Categories
ON Products.CategoryID=Categories.CategoryID
GO



Select EmpNo,EName,Salary,Emp.DeptNo,DName from
Emp Inner Join Dept
On Emp.DeptNo=Dept.DeptNO Where Emp.DeptNo>20


Select ContactName,OrderDate,ProductName,Quantity
	From Orders Inner Join [Order Details]
	On Orders.OrderId=[Order Details].OrderId
	Inner Join Products
	On [Order Details].ProductId=Products.ProductId
	Inner Join Customers
	On Orders.CustomerId=Customers.CustomerId




--INNER JOIN – More than 2 tables
--=========================================

SELECT categoryname, description,
productname, productid, companyname, suppliers.city
FROM products, categories, suppliers
WHERE Products.categoryid = Categories.categoryid
AND Products.supplierid = Suppliers.supplierid
AND Suppliers.city = 'London'
ORDER by productname
GO




--Outer Join
---Left Outer Joins
--====================

SELECT categoryname, description,
productname, productid
FROM Categories
LEFT OUTER JOIN Products
ON PRODUCTS.categoryid = CATEGORIES.categoryid
GO


--RIGHT OUTER Join
--===================

SELECT categoryname, description,
productname, productid
FROM CATEGORIES
RIGHT OUTER JOIN PRODUCTS
ON PRODUCTS.categoryid = CATEGORIES.categoryid
GO

--FULL OUTER JOIN - includes all rows from both tables
--=====================================================


Select EmpNo,EName,Salary,Emp.DeptNo,Dept.DeptNo,DName from
Dept Full Outer Join Emp
On Dept.DeptNo=Emp.DeptNO

SELECT categoryname, description,
productname, productid
FROM Products
FULL OUTER JOIN CATEGORIES
ON PRODUCTS.categoryid = CATEGORIES.categoryid
GO


--Self Join
--=====================
USE SEP23DB
GO

Select * from Emp



Select e.EName As 'Employee',m.EName as 'Reports To'
from Emp e,Emp m
Where e.Mgr=m.EmpNo
 

--CROSS JOIN
--======================

SELECT categoryname, description, productname, productid
FROM CATEGORIES ,PRODUCTS


SELECT categoryname, description, productname, productid
FROM CATEGORIES CROSS JOIN PRODUCTS
ORDER BY CategoryName



--===========================================================
--Demos on Pubs Database
--===========================================================




USE pubs
GO
Select * from Authors

Select * from Publishers

SELECT au_fname, au_lname, pub_name,authors.city,publishers.city
FROM authors, publishers 
ORDER BY au_lname DESC

SELECT au_fname, au_lname, pub_name,a.city,p.city
FROM authors AS a INNER JOIN publishers AS p
   ON a.city = p.city
ORDER BY a.au_lname DESC






--3. Outer Join

--Left Outer Join(Left Join)
--==================================

USE pubs
Go
SELECT a.au_fname, a.au_lname, p.pub_name,a.city,p.city
FROM authors a LEFT OUTER JOIN publishers p
   ON a.city = p.city
ORDER BY p.pub_name ASC, a.au_lname ASC, a.au_fname ASC



--Right Outer Join(Right Join)
--=======================================
USE pubs
GO
SELECT a.au_fname, a.au_lname, p.pub_name,a.city,p.city
FROM authors a Right OUTER JOIN publishers p
   ON a.city = p.city
ORDER BY p.pub_name ASC, a.au_lname ASC, a.au_fname ASC


--Full Outer Join(Full Join)
--===============================================
USE pubs

Select * from authors

Select * from publishers

Go
SELECT a.au_fname, a.au_lname, p.pub_name
FROM authors as a Full OUTER JOIN publishers as p
   ON a.city = p.city
ORDER BY p.pub_name ASC, a.au_lname ASC, a.au_fname ASC


