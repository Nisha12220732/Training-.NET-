create table Employee1 
(  
ID int primary key,  
Name varchar(20),  
Salary float,  
Department varchar(20)  
)


create table Logs  
(  
Activity varchar(20),  
Activity_date datetime  
)


CREATE TRIGGER trigger_example1 ON Employee1  
AFTER INSERT  
AS  
Insert into Logs values('Data is inserted',getdate())


Insert into Employee1 values(1,'Alok',40000,'Finance')


select * from Employee1
select * from Logs


create TRIGGER trigger_example2 ON Employee1  
Instead of INSERT  
AS  
Insert into Logs values('Data is Now inserted',getdate()) 


Insert into Employee1 values(2,'Riya',40000,'IT')

Insert into Employee1 values(3,'Raman',45000,'IT')

select * from Employee1  
select * from Logs 


Create TRIGGER trigger_example3 ON Employee1  
After INSERT  
AS  
begin  
Insert into Employee1 select * from inserted  
Insert into Logs values('Data is Just inserted',getdate())  
End


Insert into Employee1 values(8,'Dummy1',50000,'IT')  
select * from Employee1  
select * from Logs


--Alter the trigger and insert the data via the "inserted" virtual table

Create TRIGGER trigger_example4 ON Employee1  
Instead of INSERT  
AS  
begin  
Insert into Employee1 select * from inserted  
Insert into Logs values('Data is Just now inserted',getdate())  
end


Insert into Employee1 values(3,'ABC',50000,'IT')  
select * from Employee1  
select * from Logs

--Filling the data into Employee2 based on Employee1
Insert into Employee2 Select * from Employee1 where Department='IT'


Select * from Employee1
Select * from Employee2
truncate table Employee2