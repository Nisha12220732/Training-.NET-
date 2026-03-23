USE Northwind
GO

SELECT * FROM Customers
SELECT * FROM Employees
SELECT * FROM Orders
SELECT * FROM [Order Details]
SELECT * FROM Products
GO

--Scalar User Defined Functions Examples
--Fetch the total number of orders placed by a given customer
CREATE FUNCTION FetchTotalOrders
(
	@p_CustomerID NVARCHAR(10)
) RETURNS INT
BEGIN
	RETURN (SELECT COUNT(OrderID) FROM Orders 
	WHERE CustomerID=@p_CustomerID)
END
GO
--Test the function
SELECT dbo.FetchTotalOrders('ALFKI') AS 'Total Number Of Orders'
--Fetch The number of Orders processed by an Employee in a given year
GO

CREATE FUNCTION FetchEmployeeProcessedOrdersYearWise
(
	@p_EmployeeID INT,
	@p_Year INT
) RETURNS INT
BEGIN
	RETURN (SELECT COUNT(OrderID) FROM Orders 
	WHERE EmployeeID=@p_EmployeeID AND YEAR(OrderDate)=@p_Year)
END
GO
--Test the function
SELECT dbo.FetchEmployeeProcessedOrdersYearWise(1,1996) AS 'Year 1996'
SELECT dbo.FetchEmployeeProcessedOrdersYearWise(1,1997) AS 'Year 1997'
SELECT dbo.FetchEmployeeProcessedOrdersYearWise(1,1998) AS 'Year 1998'
GO
----------------------------------------------------------------------
--Table Valued Functions Examples [in-Line]
--Fetch the Product details purchased by a given customer

CREATE FUNCTION CustomerPurchasedProductDetails
(
	@p_CustomerID NVARCHAR(10)
) RETURNS TABLE
AS
RETURN 
(
	SELECT P.ProductName,P.UnitPrice,P.UnitsInStock FROM 
	Customers C INNER JOIN Orders O 
	ON C.CustomerID=O.CustomerID INNER JOIN [Order Details] OD
	ON O.OrderID=OD.OrderID INNER JOIN Products P
	ON OD.ProductID=P.ProductID
	WHERE C.CustomerID=@p_CustomerID
)
GO

--Test the function
SELECT * FROM dbo.CustomerPurchasedProductDetails('ANTON')
GO
--Fetch The Product details processed by an Employee in a given year
CREATE FUNCTION EmployeeProcessedProductDetails
(
	@p_EmployeeID INT,
	@p_Year INT
) RETURNS TABLE
AS
RETURN 
(
	SELECT P.ProductName,P.UnitPrice,P.UnitsInStock FROM
	Employees E INNER JOIN Orders O 
	ON E.EmployeeID=O.EmployeeID INNER JOIN [Order Details] OD
	ON O.OrderID=OD.OrderID INNER JOIN Products P
	ON OD.ProductID=P.ProductID
	WHERE E.EmployeeID=@p_EmployeeID AND YEAR(O.OrderDate)=@p_Year
)
GO
--Test the function
SELECT * FROM dbo.EmployeeProcessedProductDetails(1,1996)
SELECT * FROM dbo.EmployeeProcessedProductDetails(1,1997)
SELECT * FROM dbo.EmployeeProcessedProductDetails(1,1998)
GO
--Table Valued Functions Examples [Multi-Statement]
CREATE FUNCTION CustomerPurchasedProductDetailsMultiStatement
(
	@p_CustomerID NVARCHAR(10)
) 
RETURNS @CustomerPurchasedProducts TABLE(
										ProductName NVARCHAR(50),
										UnitPrice DECIMAL(8,2),
										AvailableStock INT)
AS
BEGIN
	INSERT @CustomerPurchasedProducts 
	SELECT P.ProductName,P.UnitPrice,P.UnitsInStock FROM 
	Customers C INNER JOIN Orders O 
	ON C.CustomerID=O.CustomerID INNER JOIN [Order Details] OD
	ON O.OrderID=OD.OrderID INNER JOIN Products P
	ON OD.ProductID=P.ProductID
	WHERE C.CustomerID=@p_CustomerID
	RETURN
END
GO
--Test the function
SELECT * FROM dbo.CustomerPurchasedProductDetailsMultiStatement('ANTON')