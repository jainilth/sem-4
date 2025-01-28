-- Country Table
CREATE TABLE Country (
    CountryID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    CountryName VARCHAR(100) UNIQUE NOT NULL,
    CountryCode VARCHAR(50) NOT NULL,
    CreationDate DATETIME DEFAULT GETDATE(),
    UserID INT NOT NULL FOREIGN KEY REFERENCES [User](UserID)
);

-- State Table
CREATE TABLE State (
    StateID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    CountryID INT NOT NULL FOREIGN KEY REFERENCES Country(CountryID),
    StateName VARCHAR(100) UNIQUE NOT NULL,
    StateCode VARCHAR(50) NOT NULL,
    CreationDate DATETIME DEFAULT GETDATE(),
    UserID INT NOT NULL FOREIGN KEY REFERENCES [User](UserID)
);

-- City Table
CREATE TABLE City (
    CityID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    StateID INT NOT NULL FOREIGN KEY REFERENCES State(StateID),
    CountryID INT NOT NULL FOREIGN KEY REFERENCES Country(CountryID),
    CityName VARCHAR(100) UNIQUE NOT NULL,
    STDCode VARCHAR(50) NULL,
    PinCode VARCHAR(6) NULL,
    CreationDate DATETIME DEFAULT GETDATE(),
    UserID INT NOT NULL FOREIGN KEY REFERENCES [User](UserID)
);

-- User Table
CREATE TABLE [User] (
    UserID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    UserName VARCHAR(100) NOT NULL,
    MobileNo VARCHAR(50) NOT NULL,
    EmailID VARCHAR(100) NOT NULL,
    CreationDate DATETIME DEFAULT GETDATE()
);


CREATE OR ALTER PROC PR_Country_Insert
@CountryName NVARCHAR(100),
@CountryCode NVARCHAR(50),
@UserID INT
AS
BEGIN
    INSERT INTO [dbo].[Country]
	(
		CountryName,
		CountryCode,
		UserID
	)
    VALUES
    (
        @CountryName,
        @CountryCode,
        @UserID
    )
END

CREATE OR ALTER PROC PR_Country_Update
@CountryID INT,
@CountryName NVARCHAR(100),
@CountryCode NVARCHAR(50)
AS
BEGIN
    UPDATE [dbo].[Country]
    SET 
        [dbo].[Country].[CountryName] = @CountryName,
        [dbo].[Country].[CountryCode] = @CountryCode
    WHERE [dbo].[Country].[CountryID] = @CountryID
END

CREATE OR ALTER PROC PR_Country_Delete
@CountryID INT
AS
BEGIN
    DELETE FROM [dbo].[Country]
    WHERE [dbo].[Country].[CountryID] = @CountryID
END

CREATE OR ALTER PROC PR_Country_SelectAll
AS
BEGIN
    SELECT 
        [dbo].[Country].[CountryID],
        [dbo].[Country].[CountryName],
        [dbo].[Country].[CountryCode],
        [dbo].[Country].[CreationDate],
        [dbo].[User].[UserName]
    FROM [dbo].[Country]
	join [dbo].[User]
	on [dbo].[Country].[UserID]=[dbo].[User].[UserID]
END

CREATE OR ALTER PROC PR_Country_SelectByID
@CountryID INT
AS
BEGIN
    SELECT 
        [dbo].[Country].[CountryName],
        [dbo].[Country].[CountryCode],
        [dbo].[Country].[CreationDate],
        [dbo].[User].[UserName]
    FROM [dbo].[Country]
	join [dbo].[User]
	on [dbo].[Country].[UserID]=[dbo].[User].[UserID]
    WHERE [dbo].[Country].[CountryID] = @CountryID
END

CREATE OR ALTER PROC PR_State_Insert
@CountryID INT,
@StateName NVARCHAR(100),
@StateCode NVARCHAR(50),
@UserID INT
AS
BEGIN
    INSERT INTO [dbo].[State]
	(
        CountryID,
        StateName,
        StateCode,
        UserID
    )
    VALUES
    (
        @CountryID,
        @StateName,
        @StateCode,
        @UserID
    )
END

CREATE OR ALTER PROC PR_State_Update
@StateID INT,
@CountryID INT,
@StateName NVARCHAR(100),
@StateCode NVARCHAR(50),
@UserID INT
AS
BEGIN
    UPDATE [dbo].[State]
    SET 
        [dbo].[State].[CountryID] = @CountryID,
        [dbo].[State].[StateName] = @StateName,
        [dbo].[State].[StateCode] = @StateCode,
        [dbo].[State].[UserID] = @UserID
    WHERE [dbo].[State].[StateID] = @StateID
END

CREATE OR ALTER PROC PR_State_Delete
@StateID INT
AS
BEGIN
    DELETE FROM [dbo].[State]
    WHERE [dbo].[State].[StateID] = @StateID
END

CREATE OR ALTER PROC PR_State_SelectAll
AS
BEGIN
    SELECT 
        [dbo].[State].[StateID],
        [dbo].[State].[CountryID],
        [dbo].[State].[StateName],
        [dbo].[State].[StateCode],
        [dbo].[State].[CreationDate],
        [dbo].[State].[UserID]
    FROM [dbo].[State]
END

CREATE OR ALTER PROC PR_State_SelectByID
@StateID INT
AS
BEGIN
    SELECT 
        [dbo].[State].[CountryID],
        [dbo].[State].[StateName],
        [dbo].[State].[StateCode],
        [dbo].[State].[CreationDate],
        [dbo].[State].[UserID]
    FROM [dbo].[State]
    WHERE [dbo].[State].[StateID] = @StateID
END

CREATE OR ALTER PROC PR_City_Insert
@StateID INT,
@CountryID INT,
@CityName NVARCHAR(100),
@STDCode NVARCHAR(50),
@PinCode NVARCHAR(6),
@UserID INT,
@CreationDate DATETIME
AS
BEGIN
    INSERT INTO [dbo].[City]
    VALUES
    (
        @StateID,
        @CountryID,
        @CityName,
        @STDCode,
        @PinCode,
        @CreationDate,
        @UserID
    )
END

CREATE OR ALTER PROC PR_City_Update
@CityID INT,
@StateID INT,
@CountryID INT,
@CityName NVARCHAR(100),
@STDCode NVARCHAR(50),
@PinCode NVARCHAR(6),
@UserID INT,
@CreationDate DATETIME
AS
BEGIN
    UPDATE [dbo].[City]
    SET 
        [dbo].[City].[StateID] = @StateID,
        [dbo].[City].[CountryID] = @CountryID,
        [dbo].[City].[CityName] = @CityName,
        [dbo].[City].[STDCode] = @STDCode,
        [dbo].[City].[PinCode] = @PinCode,
        [dbo].[City].[CreationDate] = @CreationDate,
        [dbo].[City].[UserID] = @UserID
    WHERE [dbo].[City].[CityID] = @CityID
END

CREATE OR ALTER PROC PR_City_Delete
@CityID INT
AS
BEGIN
    DELETE FROM [dbo].[City]
    WHERE [dbo].[City].[CityID] = @CityID
END

CREATE OR ALTER PROC PR_City_SelectAll
AS
BEGIN
    SELECT 
        [dbo].[City].[CityID],
        [dbo].[City].[StateID],
        [dbo].[City].[CountryID],
        [dbo].[City].[CityName],
        [dbo].[City].[STDCode],
        [dbo].[City].[PinCode],
        [dbo].[City].[CreationDate],
        [dbo].[City].[UserID]
    FROM [dbo].[City]
END

CREATE OR ALTER PROC PR_City_SelectByID
@CityID INT
AS
BEGIN
    SELECT 
        [dbo].[City].[StateID],
        [dbo].[City].[CountryID],
        [dbo].[City].[CityName],
        [dbo].[City].[STDCode],
        [dbo].[City].[PinCode],
        [dbo].[City].[CreationDate],
        [dbo].[City].[UserID]
    FROM [dbo].[City]
    WHERE [dbo].[City].[CityID] = @CityID
END

CREATE OR ALTER PROC PR_User_Insert
@UserName NVARCHAR(100),
@MobileNo NVARCHAR(50),
@EmailID NVARCHAR(100),
@CreationDate DATETIME
AS
BEGIN
    INSERT INTO [dbo].[User]
    VALUES
    (
        @UserName,
        @MobileNo,
        @EmailID,
        @CreationDate
    )
END

CREATE OR ALTER PROC PR_User_Update
@UserID INT,
@UserName NVARCHAR(100),
@MobileNo NVARCHAR(50),
@EmailID NVARCHAR(100),
@CreationDate DATETIME
AS
BEGIN
    UPDATE [dbo].[User]
    SET 
        [dbo].[User].[UserName] = @UserName,
        [dbo].[User].[MobileNo] = @MobileNo,
        [dbo].[User].[EmailID] = @EmailID,
        [dbo].[User].[CreationDate] = @CreationDate
    WHERE [dbo].[User].[UserID] = @UserID
END

CREATE OR ALTER PROC PR_User_Delete
@UserID INT
AS
BEGIN
    DELETE FROM [dbo].[User]
    WHERE [dbo].[User].[UserID] = @UserID
END

CREATE OR ALTER PROC PR_User_SelectAll
AS
BEGIN
    SELECT 
        [dbo].[User].[UserID],
        [dbo].[User].[UserName],
        [dbo].[User].[MobileNo],
        [dbo].[User].[EmailID],
        [dbo].[User].[CreationDate]
    FROM [dbo].[User]
END

CREATE OR ALTER PROC PR_User_SelectByID
@UserID INT
AS
BEGIN
    SELECT 
        [dbo].[User].[UserName],
        [dbo].[User].[MobileNo],
        [dbo].[User].[EmailID],
        [dbo].[User].[CreationDate]
    FROM [dbo].[User]
    WHERE [dbo].[User].[UserID] = @UserID
END
