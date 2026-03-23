create table Customer(CustID int,CustName varchar(20),Addr varchar(50))

Create Schema Normal

create table Normal.Customer(CustID int,CustName varchar(20) Not Null,Addr varchar(50) NOT NULL)

Create Schema Prime

create table Prime.Customer(CustID int,CustName varchar(20),Addr varchar(50))

--Adding Normal Customers

Insert InTo Normal.Customer values(101,'Alok','Pune');
Insert InTo Normal.Customer values(102,'Riya','Pune');

--Adding Prime Customers

Insert InTo Prime.Customer values(1,'Nisha','Mumbai');
Insert InTo Prime.Customer values(2,'Raghav','Chennai');



Select * from Normal.Customer;

Select * from Prime.Customer;

Drop Table Normal.Customer


--Adding a column to existing table
Alter Table Normal.Customer
Add PhoneNo char(10)

Alter Table Prime.Customer
Add PhoneNo char(10)


Alter Table Normal.Customer
Drop Column PhoneNo

--Insert Into Prime.Customer(PhoneNo) values('1234567890')

--Modifying The Record
Update Prime.Customer Set PhoneNo='9922435666' where CustId=2

--Deleting the Record
Delete from Prime.Customer where PhoneNo='1234567890'


Alter Table Prime.Customer
Drop Column PhoneNo

--Demo fro Computed Columns
Create Table StudentMarks(
                          ID int Identity(1,1) Primary Key,
						  RollNo int ,                         
						  Physics tinyint,
						  Chemistry tinyint,
						  Maths tinyint,
						  Total as (Physics+Chemistry+Maths),
						  Perc as ((Physics+Chemistry+Maths)/3)
						  )

Alter Table StudentMarks
Add Lname varchar(20)

Alter Table StudentMarks
Drop Column LName

Select * from StudentMarks

Alter Table StudentMarks
add FullName as (Fname+' '+Lname)

--Adding Data to Table

--Insert into StudentMarks(Name,Physics,Chemistry,Maths) Values('Abhishek',65,78,90)
--Insert into StudentMarks Values('Aditya',60,70,80)
--Insert into StudentMarks Values('Aman',60,60,60,456.65)

Insert into StudentMarks(RollNo,Physics,Chemistry,Maths) Values(101,65,78,90)
Insert into StudentMarks(RollNo,Physics,Chemistry,Maths) Values(102,60,70,80)
Insert into StudentMarks(RollNo,Physics,Chemistry,Maths) Values(103,60,60,60)

Insert into StudentMarks(RollNo,Physics,Chemistry,Maths) Values(104,75,80,60)

drop Table StudentMarks

truncate table StudentMarks
--Update StudentMarks set Lname='Goyal' where RollNo=103


Select * from StudentMarks
--Adding Default Constraint 
Alter Table StudentMarks
Add Constraint DF_Physics Default 0 for Physics

Alter Table StudentMarks
Add Constraint DF_Chemistry Default 0 for Chemistry

Alter Table StudentMarks
Add Constraint DF_Maths Default 0 for Maths


--Adding Check Constraint on Table

Alter Table StudentMarks
Add Constraint CHK_Physics Check(Physics>=0 and Physics<=100)

Alter Table StudentMarks
Add Constraint CHK_Chemistry Check(Chemistry>=0 and Chemistry<=100)

Alter Table StudentMarks
Add Constraint CHK_Maths Check(Maths>=0 and Maths<=100)


--Creating Student Table

Create Table Student1 (RollNo int Identity(100,1) primary key,
					  Fname varchar(20) not null,
					  Mname varchar(20),--allow null
					  Lname varchar(20) not null,
					  Addr varchar(50) not null
					  )

--Adding Records to Student1 Table

Insert INTO Student1(Fname,Mname,Lname,Addr)
  Values('Alok','R','Goyal','Delhi')
  ,('Alok','R','Goyal','Delhi'),('Alok','R','Goyal','Delhi');

Select * from Student1
Select * from StudentMarks

Delete StudentMarks Where RollNo=103


Alter Table StudentMarks
Add Constraint FK_RollNo Foreign Key(RollNo)
References dbo.Student1(RollNo)

--Adding data to StudentMarks for RollNo 12 which doesn't exist in Student1

Insert into StudentMarks(RollNo,Physics,Chemistry,Maths) Values(100,85,70,100);


--Adding Primary key to Student1 
Alter Table Student1
Add Constraint PK_RollNo Primary Key(RollNo)

Delete From StudentMarks Where RollNo=422

create Table BankAccount (AccNo int Primary Key,
                          AccHolderName varchar(20),
						  OpBalance int,
						  CurrrentBal int,
						  AcctType varchar(10),
						  IntEarn int);

Select * from BankAccount

--Creating a Rule for Account Type
create Rule rl_AccTypeRule
as @actType in('Saving','RD','FD','Current')

--Binding the Rule to the Column
sp_bindrule rl_AccTypeRule,'BankAccount.AcctType'


--Adding Data to Table
insert into BankAccount values(103,'Prashant',15000,75000,'Sg',1800)

Select * from Student1

Select * from Student2


insert into Student1 Select * from Student2

--CurrentMonthPending
--PrvMonthPending
