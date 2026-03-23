Create Table Employees(EmployeeID int primary key,
					   Fname varchar(15) not null,
					   mname varchar(15) ,
					   Lname varchar(15) not null,
					   Desig varchar(20) not null,
					   HireDate date not null,
					   LeavesNo smallint,
					   Salary int not null
						)




CREATE VIEW vEmployees
AS
     SELECT *
     FROM Employees;
GO

---

INSERT INTO vEmployees
       SELECT 1, 
              'Sujay', 
              NULL, 
              'Rai', 
              'SME', 
              '1/5/2016', 
               180, 
              '700000';


Select * from vEmployees

---WithCheck Option Demo--

ALTER VIEW vEmployees
AS
     SELECT *
     FROM Employees
     WHERE Desig = 'Sales Representative'
 
WITH CHECK OPTION;
 
GO

---
INSERT INTO vEmployees
       SELECT 4, 
              'Bojan', 
              NULL, 
              'Petrovic', 
              'Sales Representative', 
              '1/1/2017', 
              2080, 
              '100000';

--To rename view
sp_rename 
  'vEmployees','vDemoEmployees';
  
  select * from vDemoEmployees
  
  select * from Employees
