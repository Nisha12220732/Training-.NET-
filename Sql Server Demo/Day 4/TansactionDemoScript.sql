--Create Person Table  
  create table Person1  
    (  
        PersonID int primary key not null,  
        FirstName nvarchar(10)not null,  
        Company nvarchar(15)  
    )

--Create PersonDetails Table  	
    create table PersonDetails  
    (  
        PersonID int FOREIGN KEY REFERENCES dbo.Person1(PersonID),  
        Address nvarchar(60)  
    )    
	
--- Adding Records to Person
Insert into Person1  
values	(101,'Alok','Lionbridge Inc'),  
		(102,'Riya','Pearl Solutions'),
		(103,'Nidhi','IBM')	

--- Adding Records to PersonDetails
 Insert into PersonDetails  
    values(101,'505,SilverView Apt,Chennai'),  
		  (102,'78,NehruNagar,Chennai'),
          (103,'201,Parx Apt,Chennai')	  
	
--Create StoredProcedure  

   alter procedure uspTrans_Test  
    @newpersonid nvarchar(5),  
    @newfirstname nvarchar(10),  
    @newcompanyname nvarchar(15),  
    @oldpersonid nvarchar(5)  
   as  
    declare @inserr int  
    declare @delerr int  
    declare @maxerr int  
    set @maxerr = 0  
    BEGIN TRANSACTION  
      
    -- Add a person  
    insert into person1 (personid, firstname, company)  
    values(@newpersonid, @newfirstname, @newcompanyname)  
      
    -- Save error number returned from Insert statement  
    set @inserr = @@error  
    print 'Error is '+cast(@inserr as char)
    if @inserr > @maxerr  
    set @maxerr = @inserr  
      
    -- Delete a person  
    delete from person1  
    where personid = @oldpersonid  
      
    -- Save error number returned from Delete statement  
    set @delerr = @@error  
    if @delerr > @maxerr  
    set @maxerr = @delerr  
      
    -- If an error occurred, roll back  
    if @maxerr <> 0  
    begin  
       ROLLBACK  
       print 'Transaction rolled back'  
    end  
    else  
    begin  
       COMMIT  
       print 'Transaction committed'  
    end  
    print 'INSERT error number:'+ cast(@inserr as nvarchar(8))  
    print 'DELETE error number:'+ cast(@delerr as nvarchar(8))  
    return @maxerr
	
	--Executing Transaction
	exec uspTrans_Test 106,'Ritesh','capgemini',2137
	
	Select * from Person1
	
	delete from person1  
    where personid =1313234w2323