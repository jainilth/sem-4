-- Create Department Table
CREATE TABLE Department (
 DepartmentID INT PRIMARY KEY,
 DepartmentName VARCHAR(100) NOT NULL UNIQUE
);
-- Create Designation Table
CREATE TABLE Designation (
 DesignationID INT PRIMARY KEY,
 DesignationName VARCHAR(100) NOT NULL UNIQUE
);
-- Create Person Table
CREATE TABLE Person (
 PersonID INT PRIMARY KEY IDENTITY(101,1),
 FirstName VARCHAR(100) NOT NULL,
 LastName VARCHAR(100) NOT NULL,
 Salary DECIMAL(8, 2) NOT NULL,
 JoiningDate DATETIME NOT NULL,
 DepartmentID INT NULL,
 DesignationID INT NULL,
 FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
 FOREIGN KEY (DesignationID) REFERENCES Designation(DesignationID)
);

--1. Department, Designation & Person Table’s INSERT, UPDATE & DELETE Procedures.
create or alter procedure PR_Department_Insert
@DepartmentId int,
@DepartmentName varchar(100)
as
begin
	insert into Department
	values (@DepartmentId,@DepartmentName)
end

exec PR_Department_Insert 1,'Admin'
exec PR_Department_Insert 2,'IT'
exec PR_Department_Insert 3,'HR'
exec PR_Department_Insert 4,'Account'

select * from Department

create or alter procedure PR_Designation_Insert
@DesignationID int,
@DesignationName varchar(100)
as
begin
	insert into Designation
	values (@DesignationID,@DesignationName)
end

exec PR_Designation_Insert 11,'Jobber'
exec PR_Designation_Insert 12,'Welder'
exec PR_Designation_Insert 13,'Clerk'
exec PR_Designation_Insert 14,'Manager'
exec PR_Designation_Insert 15,'CEO'

select * from Designation

create or alter procedure PR_Person_Insert
@FirstName varchar(100),
@LastName varchar(100),
@Salary Decimal(8,2),
@JoiningDate datetime,
@DepartmentID int,
@DesignationID int
as
begin
	insert into Person
	values (@FirstName,@LastName,@Salary,@JoiningDate,@DepartmentID,@DesignationID)
end

exec PR_Person_Insert 'Rahul','Anshu',56000,'1990-01-01',1,12
exec PR_Person_Insert 'Hardik','Hinsu',18000,'1990-09-25',2,11
exec PR_Person_Insert 'Bhavin','Kamani',25000,'1991-05-14',NULL,11
exec PR_Person_Insert 'Bhoomi','Patel',39000,'2014-02-20',1,13
exec PR_Person_Insert 'Rohit','Rajgor',17000,'1990-07-23',2,15
exec PR_Person_Insert 'Priya','Mehta',25000,'1990-10-18',2,NULL
exec PR_Person_Insert 'Neha','Trivedi',18000,'2014-02-20',3,15

select * from Person

create or alter procedure PR_Department_Update
@DepartmentId int,
@DepartmentName varchar(100)
as
begin
	update Department
	set DepartmentName=@DepartmentName
	where DepartmentId=@DepartmentId
end

create or alter procedure PR_Designation_Update
@DesignationID int,
@DesignationName varchar(100)
as
begin
	update Designation
	set DesignationName=@DesignationName
	where DesignationID=@DesignationID
end

create or alter procedure PR_Person_Update
@PersonId int,
@FirstName varchar(100),
@LastName varchar(100),
@Salary Decimal(8,2),
@JoiningDate datetime,
@DepartmentID int,
@DesignationID int
as
begin
	update Person
	set
	FirstName=@FirstName,
	LastName=@LastName,
	Salary=@Salary,
	JoiningDate=@JoiningDate,
	DepartmentID=@DepartmentID,
	DesignationID=@DesignationID
	where 
	PersonId=@PersonId
end

create or alter procedure PR_Department_Delete
@DepartmentId int
as
begin
	delete from Department
	where DepartmentId=@DepartmentId
end

create or alter procedure PR_Designation_Delete
@DesignationID int
as
begin
	delete from Designation
	where DesignationID=@DesignationID
end

create or alter procedure PR_Person_Delete
@PersonId int
as
begin
	delete from Person
	where 
	PersonId=@PersonId
end

--2. Department, Designation & Person Table’s SELECTBYPRIMARYKEY
create or alter proc PR_Department_SelectById
@DepartmentId int
as
begin 
	select * from department
	where 
	DepartmentID=@DepartmentId
end

exec PR_Department_SelectById 1


--3. Department, Designation & Person Table’s (If foreign key is available then do write join and takecolumns on select list)
create or alter proc PR_Department_Select
as
begin
	select * from Department
end

exec PR_Department_Select

create or alter proc PR_Designation_Select
as
begin
	select * from Designation
end

create or alter proc PR_Person_Select
as
begin
	select Person.FirstName,Person.LastName,
	Person.Salary,Person.JoiningDate,Department.DepartmentName
	,Designation.DesignationName
	from Department	join person
	on Department.DepartmentID=Person.DepartmentID
	join Designation
	on Designation.DesignationID=Person.DesignationID
end

exec PR_Person_Select

--4. Create a Procedure that shows details of the first 3 persons
create or alter proc PR_Person_Top3
as
begin
	select top 3 * from
	Person
end

exec PR_Person_Top3
