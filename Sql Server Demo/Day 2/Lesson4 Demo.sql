Use Northwind
GO
Select * from Customers

Select Distinct Country from Customers

Select CustomerID,CompanyName,ContactName,City from Customers


Select * from Customers Order By 6 Desc,3 Asc


Select * from Customers where CustomerId='ALFKI'

Select * from Customers where Not CustomerId='ALFKI'

Select * from Customers where CustomerId='ALFKI' Or CustomerId='ANTON'

Select * from Orders Where CustomerId='ALFKI' And EmployeeId=1

Select * from Orders Where CustomerId='ALFKI' Or EmployeeId=1



Select * from Orders Where CustomerId IN('TORTU','RATTC','ALFKI','ANTON','ANATR') Order By CustomerID

Select * from Customers where CustomerId Like 'A%'
Select * from Customers where CustomerId Like '%A'
Select * from Customers where CustomerId Like '%A%'
Select * from Customers where CustomerId Like '%A%A%'
Select * from Customers where CustomerId Like 'A_A__'
Select * from Customers Where CustomerId Like '[A-D]%'
Select * from Customers Where CustomerId Like '[^A-D]%'

Select * from Customers where CustomerId Like 'A_A%'

Select * from Orders where OrderDate between '01-Jul-1996' And '31-Jul-1996'
--OR
Select * from Orders where OrderDate>= '01-Jul-1996' And OrderDate<= '31-Jul-1996'

Select * from Customers Where CustomerID Between 'A' And 'E'


use Northwind
select GETDATE()
--Print GetDate()
Select GETUTCDATE()

--*******************************DATEADD(DatePart,Number,Date)*******************************
--Adding Year
SELECT DATEADD(YY,1,GETDATE())

SELECT DATEADD(YYYY,2,GETDATE())

--Adding Month
SELECT DATEADD(MM,3,GETDATE())
SELECT DATEADD(M,2,GETDATE())

--Adding Quarter
SELECT DATEADD(Q,4,GETDATE())
SELECT DATEADD(QQ,2,GETDATE())

--Adding Day Of Year
SELECT DATEADD(y,10,GETDATE())
SELECT DATEADD(DY,20,GETDATE())

--Adding Week
SELECT DATEADD(WK,2,GETDATE())
SELECT DATEADD(WW,2,GETDATE())

--Adding Hours
SELECT DATEADD(hh,5,GETDATE())
SELECT DATEADD(HH,2,GETDATE())

--*******************************DATEDIFF(DatePart,StartDate,EndDate)*******************************

--Year Difference
SELECT DATEDIFF(YY,GETDATE(),'12/May/1998')

SELECT DATEDIFF(YY,'12/May/1998',GETDATE())

SELECT DATEDIFF(YYYY,GETDATE(),'12/May/2014')

--Month Difference
SELECT DATEDIFF(M,GETDATE(),'22/APR/2021')
SELECT DATEDIFF(MM,GETDATE(),'12/May/2014')

--Quarter Difference
SELECT DATEDIFF(Q,GETDATE(),'12/Jan/2021')
SELECT DATEDIFF(QQ,GETDATE(),'12/May/2014')

--Days Of Year Difference
SELECT DATEDIFF(Dy,GETDATE(),'12/May/1996')
SELECT DATEDIFF(Y,GETDATE(),'12/May/2009')

--Weeks Difference
SELECT DATEDIFF(WK,GETDATE(),'12/May/2009')
SELECT DATEDIFF(WW,GETDATE(),'12/May/2009')

--Hour Difference
SELECT DATEDIFF(HH,GETDATE(),'15/Nov/2021')
SELECT DATEDIFF(HH,GETDATE(),'12/May/2009')


--*******************************DATEPART(DatePart,Date)*******************************

--Find Year
SELECT DATEPART(YY,GETDATE())
SELECT DATEPART(YYYY,GETDATE())

--Find Quarter
SELECT DATEPART(Q,GETDATE())
SELECT DATEPART(QQ,GETDATE())

--Find Month
SELECT DATEPART(M,GETDATE())
SELECT DATEPART(MM,GETDATE())

--Find Day-Of-Year
SELECT DATEPART(DY,GETDATE())
SELECT DATEPART(Y,GETDATE())

--Find Day
SELECT DATEPART(D,GETDATE())
SELECT DATEPART(DD,GETDATE())

--Find Week
SELECT DATEPART(WK,GETDATE())
SELECT DATEPART(WW,GETDATE())

--Find Week Day
SELECT DATEPART(DW,GETDATE())-1

--Find Hours
SELECT DATEPART(HH,GETDATE())

--Find Minutes
SELECT DATEPART(MI,GETDATE())
SELECT DATEPART(N,GETDATE())

--Find Seconds
SELECT DATEPART(SS,GETDATE())
SELECT DATEPART(S,GETDATE())

--Find Mili-Second
SELECT DATEPART(MS,GETDATE())

--***************************MONTH(Date)

SELECT Month(GetDate())

--***************************YEAR(Date)

SELECT Year(GetDate())

--***************************DATENAME(DatePart,Date)

SELECT DATENAME(M,getDATE())
SELECT DATENAME(W,getDATE())

--------------------------------------------------------------------------

--***********************String Function*******************************

SELECT ASCII('a')

SELECT CHAR(110)

--First Character Index CHARINDEX(SerachingChr,String,StartPosition)
SELECT CHARINDEX('s','HelloStudents',7)


SELECT LEFT('Customer Experience Improvement Program',12)

SELECT RIGHT('Customer Experience Improvement Program',12)

SELECT LEN('PANKAJ Ramesh Patil')

SELECT LOWER('PANKAJ')

SELECT UPPER('pankaj')

SELECT LEN(LTRIM('    SEED'))

SELECT LEN('    SEED')

SELECT LEN(RTRIM('SEED    '))

SELECT REVERSE('SEED')

SELECT REPLACE('Pankaj R Patil','R','Ramesh')

SELECT SOUNDEX ('Smith'), SOUNDEX ('Smooth')

SELECT SUBSTRING('HELLO',1,3)

--Aggregate Functions Demo--

use SEP23DB
--Drop Table Dept
Create Table Dept
(
	DeptNo int Primary Key,
	DName varchar(20),
	Location varchar(20)
)

Insert Dept Values('10','HR','Pune')
Insert Dept Values('20','Accounts','Pune')
Insert Dept Values('30','R & D','Pune')
Insert Dept Values('40','Production','Pune')

Select * from Dept

Drop Table Emp

Create Table Employee
(
	EmpNo int Primary Key,
	EName Varchar(20),
	Mgr int,
	Salary decimal,
	DeptNo int references Dept(DeptNo)
)

Insert Employee Values('1001','Saket',NULL,'40000','10')
Insert Employee Values('1002','Pravin','1001','35000','10')
Insert Employee Values('1003','Mahesh','1002','35000','20')
Insert Employee Values('1004','Ravi','1002','30000','20')
Insert Employee Values('1005','Pragya','1001','20000','10')
Insert Employee Values('1006','Mayur','1003','10000','30')

Select * from Dept
Select * from Employee


Select Count(EmpNo) as 'No of Employees',
Count(Distinct MGR) as 'No of Managers' from Employee

--Fetching Total Salary Paid to all Employeess 
Select Sum(salary)as 'Total Salary' from Employee

Select Max(salary)as 'Maximum Salary' from Employee

Select Min(salary)as 'Minimum Salary' from Employee

Select Avg(salary)as 'Average Salary' from Employee

Select Distinct Deptno from Employee

Select Count(*) as 'No of Employees' from Employee 

Select DeptNo,Count(*) as 'No of Employees' from Employee Group By DeptNo

Select DeptNo,Sum(salary) from Employee group by deptno


Select * from Employee
Select DeptNo,MGR,Sum(salary) from Employee group by deptno,Mgr

Select DeptNo,Max(salary) from Employee group by deptno

Select DeptNo,Min(salary) from Employee group by deptno

Select DeptNo,Avg(salary) from Employee group by deptno  Having Avg(Salary)>20000



Select Avg(salary) from Employee

Select DeptNo  from Dept
union
Select Deptno as 'Department ID' from Employee

declare @maxPrice money;
select @maxPrice= MAX(unitprice) from Products;
print @maxPrice;
select productname,unitprice from Products where UnitPrice=@maxPrice

--UNION

SELECT ProductID,ProductName FROM Products
WHERE categoryID=1
UNION
SELECT ProductID,ProductName FROM Products
WHERE categoryID=3

--OR
Select ProductID,ProductName FROM Products where CategoryID IN(1,3)
GO

--Intersect

SELECT CustomerID FROM Customers
INTERSECT
SELECT CustomerID FROM Orders


--EXCEPT
SELECT CustomerID FROM Customers
EXCEPT
SELECT CustomerID FROM Orders

--Use of Custom variables in SQL Server

declare @num1 int
set @num1=100
declare @num2 int
set @num2=200

declare @res int
set @res=@num1+@num2

--select @res
print 'The sum of '+RTRIM(cast(@num1 as char))+' and '+RTRIM(cast(@num2 as char))+' is '+ RTRIM(cast(@res as char))


