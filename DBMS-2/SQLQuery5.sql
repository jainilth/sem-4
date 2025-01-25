-- Creating PersonInfo Table 
CREATE TABLE PersonInfo ( 
    PersonID INT PRIMARY KEY, 
    PersonName VARCHAR(100) NOT NULL, 
    Salary DECIMAL(8,2) NOT NULL, 
    JoiningDate DATETIME NULL, 
    City VARCHAR(100) NOT NULL, 
    Age INT NULL, 
    BirthDate DATETIME NOT NULL 
); 
 
-- Creating PersonLog Table 
CREATE TABLE PersonLog ( 
    PLogID INT PRIMARY KEY IDENTITY(1,1), 
    PersonID INT NOT NULL, 
    PersonName VARCHAR(250) NOT NULL, 
    Operation VARCHAR(50) NOT NULL, 
    UpdateDate DATETIME NOT NULL, 
);

CREATE TRIGGER TR_PersonInfo
ON PersonInfo
AFTER INSERT,UPDATE,DELETE
AS
BEGIN
	PRINT 'Record is Affected'
END

--2. Create a trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo table. For that, 
--log all operations performed on the person table into PersonLog. 
CREATE TRIGGER TR_Person_After_Insert
ON PersonInfo
after insert
AS
BEGIN
	DECLARE @PersonID INT;
	DECLARE @PersonName VARCHAR(100)

	SELECT @PersonID=PersonID FROM INSERTED
	SELECT @PersonName=PersonName FROM INSERTED

	INSERT INTO PersonLog(PersonID,PersonName,Operation,UpdateDate)
	values (@PersonID,@PersonName,'INSERTED',getdate())
end

CREATE TRIGGER TR_Person_After_Update
ON PersonInfo
after update
AS
BEGIN
	DECLARE @PersonID INT;
	DECLARE @PersonName VARCHAR(100)

	SELECT @PersonID=PersonID FROM INSERTED
	SELECT @PersonName=PersonName FROM INSERTED

	INSERT INTO PersonLog(PersonID,PersonName,Operation,UpdateDate)
	values (@PersonID,@PersonName,'UPDATED',getdate())
end

CREATE TRIGGER TR_Person_After_DELETE
ON PersonInfo
after delete
AS
BEGIN
	DECLARE @PersonID INT;
	DECLARE @PersonName VARCHAR(100)

	SELECT @PersonID=PersonID FROM DELETED
	SELECT @PersonName=PersonName FROM DELETED

	INSERT INTO PersonLog(PersonID,PersonName,Operation,UpdateDate)
	values (@PersonID,@PersonName,'DELETED',getdate())
end

insert into PersonInfo
values(1,'jayraj',20000.00,'21-FEB-2023','Rajkot',21,'22-JAN-2004')

update PersonInfo
set City='jamnagar'
where PersonName='jayraj'

delete PersonInfo
where PersonName='jayraj'

select * from PersonInfo
select * from PersonLog

drop trigger TR_PersonInfo
drop trigger TR_Person_After_Insert
drop trigger TR_Person_After_Update
drop trigger TR_Person_After_Delete


--3. Create an INSTEAD OF trigger that fires on INSERT, UPDATE and DELETE operation on the  PersonInfo 
--table. For that, log all operations performed on the person table into PersonLog. 
CREATE TRIGGER TR_Person_Instedof_Insert
ON PersonInfo
instead of insert
AS
BEGIN
	DECLARE @PersonID INT;
	DECLARE @PersonName VARCHAR(100)

	SELECT @PersonID=PersonID FROM INSERTED
	SELECT @PersonName=PersonName FROM INSERTED

	INSERT INTO PersonLog(PersonID,PersonName,Operation,UpdateDate)
	values (@PersonID,@PersonName,'INSERTED',getdate())
end

CREATE TRIGGER TR_Person_insteadof_Update
ON PersonInfo
instead of update
AS
BEGIN
	DECLARE @PersonID INT;
	DECLARE @PersonName VARCHAR(100)

	SELECT @PersonID=PersonID FROM INSERTED
	SELECT @PersonName=PersonName FROM INSERTED

	INSERT INTO PersonLog(PersonID,PersonName,Operation,UpdateDate)
	values (@PersonID,@PersonName,'UPDATED',getdate())
end

CREATE TRIGGER TR_Person_insteadof_DELETE
ON PersonInfo
instead of delete
AS
BEGIN
	DECLARE @PersonID INT;
	DECLARE @PersonName VARCHAR(100)

	SELECT @PersonID=PersonID FROM DELETED
	SELECT @PersonName=PersonName FROM DELETED

	INSERT INTO PersonLog(PersonID,PersonName,Operation,UpdateDate)
	values (@PersonID,@PersonName,'DELETED',getdate())
end

drop trigger TR_Person_Instedof_Insert
drop trigger TR_Person_insteadof_Update
drop trigger TR_Person_insteadof_DELETE
--4. Create  a trigger that  fires on  INSERT  operation on  the  PersonInfo  table  to  convert  person name  into 
--uppercase whenever the record is inserted. 
create trigger TR_Person_Upper
on PersonInfo
after insert
as
begin
	DECLARE @PersonID INT;
	DECLARE @PersonName VARCHAR(100)

	SELECT @PersonID=PersonID FROM INSERTED
	SELECT @PersonName=PersonName FROM INSERTED

	update PersonInfo
	set PersonName=upper(@PersonName)
	where PersonID=@PersonID
end

--5. Create trigger that prevent duplicate entries of person name on PersonInfo table. 

CREATE TRIGGER TR_STOP_DUPLICATE
ON  PersonInfo
INSTEAD OF INSERT
AS
BEGIN
	INSERT INTO PersonInfo (PersonID, PersonName, Salary, JoiningDate, City, Age, BirthDate)
	SELECT 
		PersonID, PersonName, Salary, JoiningDate, City, Age, BirthDate
		FROM inserted
		WHERE PersonName NOT IN	(
			SELECT PersonName FROM PersonInfo
		)
END

--6. Create trigger that prevent Age below 18 years.