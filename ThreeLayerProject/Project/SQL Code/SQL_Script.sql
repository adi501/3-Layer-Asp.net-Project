
-- create Database

Create Database DBTest
Use DBTest

-- create table

Create table tblEmployee(EmployeeId int identity(1,1) primary key,EmployeeName varchar(50),Designation varchar(30),
Salary decimal(18,2),Email varchar(50),Mobile varchar(15),Qualification varchar(20),Manager varchar(50))



--- create Stored procedure for Insert, Update, Delete and Select

create procedure spEmployee
(@EmployeeId int=null,
@EmployeeName varchar(50)=NULL,
@Designation varchar(30)=NULL,
@Salary decimal (18, 2) =NULL,
@Email varchar(50)= NULL,
@Mobile varchar(15)= NULL,
@Qualification varchar(20)= NULL,
@Manager varchar(50)= NULL,
@type int=null,
@result int =null out
      )
AS
BEGIN
IF @type = 1
	BEGIN
	insert into tblEmployee(
		EmployeeName
      ,Designation
      ,Salary
      ,Email
      ,Mobile
      ,Qualification
      ,Manager
      ) values(
    @EmployeeName
      ,@Designation
      ,@Salary
      ,@Email
      ,@Mobile
      ,@Qualification
      ,@Manager)   
	set @result=1
	return @result
	
	END
IF @type = 2
BEGIN
SELECT   * from tblEmployee
END 
IF @type = 3
BEGIN
UPDATE tblEmployee SET
       EmployeeName=@EmployeeName
      ,Designation=@Designation
      ,Salary=@Salary
      ,Email=@Email
      ,Mobile=@Mobile
      ,Qualification=@Qualification
      ,Manager=@Manager
where EmployeeId=@EmployeeId
set @result=2
	return @result
END
IF @type = 5
BEGIN
SELECT   * from tblEmployee where EmployeeId=@EmployeeId
END 
IF @type = 6
BEGIN
 delete from tblEmployee where EmployeeId=@EmployeeId
 set @result=1
	return @result
END 
end

