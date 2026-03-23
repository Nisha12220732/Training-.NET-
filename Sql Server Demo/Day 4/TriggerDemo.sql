USE EurofinDb

Select * from Department

Select * from Employee

--Trigger for Insert
create trigger trgInsertEmp 
 on Employee 
 for insert 
 as
  begin 
   declare @dcode int
   select @dcode = deptNo from inserted 
   update department set no_of_emp = no_of_emp + 1 where deptNo = @dcode
   print 'The Department updated succesfully' 
 end



--Trigger for Delete
create trigger trgDeleteEmp
  on Employee
  for delete
 as
    begin
	declare @dcode int
	select @dcode = DeptNo from deleted
	update Department set no_of_emp = no_of_emp - 1 where DeptNo = @dcode
	print 'The Department updated succesfully'
   end

--Trigger for Update
Create trigger trgUpdateDeptCode
on Employee
for update as
begin
if update(DeptNo)
begin
declare @olddept int, @newdept int
select @olddept = DeptNo from deleted
select @newdept = DeptNo from inserted
update Department set no_of_emp = no_of_emp - 1 where DeptNo = @olddept
update Department set no_of_emp = no_of_emp + 1 where DeptNo = @newdept
print 'The Employee moved successfully'
end
end

--
CREATE TRIGGER Empl_Delete ON Employees
FOR DELETE
AS
IF exists (select 'a' from loan,deleted where
loan.EmpCode = deleted.EmpCOde)
BEGIN
RAISERROR(
'You cannot delete employee having loan', 16, 1)
ROLLBACK TRANSACTION
END



insert into Employee values(203,'Dummy3',1002,25000,20)

select * from Employee

Select * from Department

Delete from Employee where EmpNo=203