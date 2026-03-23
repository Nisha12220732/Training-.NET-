--Create Procedure usp_AddEmployee

--  @EmpID int,
--  @EName varchar(20),
--  @MgrId int,
--  @Sal int,
--  @DepCode int
  
--  AS
  
--  INSERT INTO Emp Values(@EmpID,@EName,@MgrId,@Sal,@DepCode)

EXEC usp_AddEmployee 1236,'Kashika1',1002,45000,10

Insert into Emp values(1237,'Pratima',1002,45000,30)

Select * from ShowAllEmployees


--Out Parameter Demo in Stored Procedure
Create Procedure usp_EmpCountPerDept
	@DeptID int,--Input Parameter
	@EmpCount int Out --Output Parameter
As
  Begin
     if @DeptID<=Null or @DeptID<10
      return -1
      
      Select @EmpCount=COUNT(*) from Emp 
      where DeptNo=@DeptID
End




Declare @MyEmpCount int
Exec usp_EmpCountPerDept 20,@MyEmpCount Out
Select @MyEmpCount 
  
 