-----------------------------------------------Table Create--------------------------------------
-- Creating MST_User table
CREATE TABLE MST_User (
    UserID		INT PRIMARY KEY IDENTITY(1,1),
    UserName	NVARCHAR(100) NOT NULL,
    Password	NVARCHAR(100) NOT NULL,
    Email		NVARCHAR(100) NOT NULL,
    Mobile		NVARCHAR(100) NOT NULL,
    IsActive	BIT NOT NULL DEFAULT 1,
    IsAdmin		BIT NOT NULL DEFAULT 0,
    Created		DATETIME NOT NULL DEFAULT GETDATE(),
    Modified	DATETIME NOT NULL
);

-- Creating MST_Quiz table
CREATE TABLE MST_Quiz (
    QuizID			INT PRIMARY KEY IDENTITY(1,1),
    QuizName		NVARCHAR(100) NOT NULL,
    TotalQuestions	INT NOT NULL,
    QuizDate		DATETIME NOT NULL,
    UserID			INT NOT NULL,
    Created			DATETIME NOT NULL DEFAULT GETDATE(),
    Modified		DATETIME NOT NULL,
    FOREIGN KEY (UserID) REFERENCES MST_User(UserID)
);

-- Creating MST_Question table
CREATE TABLE MST_Question (
    QuestionID			INT PRIMARY KEY IDENTITY(1,1),
    QuestionText		NVARCHAR(MAX) NOT NULL,
    QuestionLevelID		INT NOT NULL,
    OptionA				NVARCHAR(100) NOT NULL,
    OptionB				NVARCHAR(100) NOT NULL,
    OptionC				NVARCHAR(100) NOT NULL,
    OptionD				NVARCHAR(100) NOT NULL,
    CorrectOption		NVARCHAR(100) NOT NULL,
    QuestionMarks		INT NOT NULL,
    IsActive			BIT NOT NULL DEFAULT 1,
    UserID				INT NOT NULL,
    Created				DATETIME NOT NULL DEFAULT GETDATE(),
    Modified			DATETIME NOT NULL,
    FOREIGN KEY (UserID) REFERENCES MST_User(UserID)
);

-- Creating MST_QuestionLevel table
CREATE TABLE MST_QuestionLevel (
    QuestionLevelID		INT PRIMARY KEY IDENTITY(1,1),
    QuestionLevel		NVARCHAR(100) NOT NULL,
    UserID				INT NOT NULL,
    Created				DATETIME NOT NULL DEFAULT GETDATE(),
    Modified			DATETIME NOT NULL,
    FOREIGN KEY (UserID) REFERENCES MST_User(UserID)
);

-- Creating MST_QuizWiseQuestions table
CREATE TABLE MST_QuizWiseQuestions (
    QuizWiseQuestionsID INT PRIMARY KEY IDENTITY(1,1),
    QuizID			INT NOT NULL,
    QuestionID		INT NOT NULL,
    UserID			INT NOT NULL,
    Created			DATETIME NOT NULL DEFAULT GETDATE(),
    Modified		DATETIME NOT NULL,
    FOREIGN KEY (QuizID) REFERENCES MST_Quiz(QuizID),
    FOREIGN KEY (QuestionID) REFERENCES MST_Question(QuestionID),
    FOREIGN KEY (UserID) REFERENCES MST_User(UserID)
);

-----------------------------------------Procedure---------------------------------------------

------------------------------Stored Procedures for MST_User Table -----------------------------
--Stored Procedures for MST_User Table Insert
CREATE OR ALTER PROC PR_MST_User_Insert
    @UserName		NVARCHAR(100),
    @Email			NVARCHAR(100),
    @Password		NVARCHAR(100),
	@Mobile			NVARCHAR(100),
	@IsActive		Int,
	@IsAdmin        Int
AS
BEGIN
	DECLARE @Modified DATETIME = GETDATE();
    INSERT INTO [dbo].[MST_User] 
    (
        [dbo].[MST_User].[UserName],
        [dbo].[MST_User].[Email],
        [dbo].[MST_User].[Password],
        [dbo].[MST_User].[Modified],
		[dbo].[MST_User].[Mobile],
		[dbo].[MST_User].[IsActive],
		[dbo].[MST_User].[IsAdmin]
    )
    VALUES
    (
        @UserName,
        @Email,
        @Password,
        @Modified,
		@Mobile,
		1,
		0
    )
END
--EXEC PR_MST_User_Insert 'smit','smitmaru2005@gmail.com','smit@123','9021234354',1,0

--Stored Procedures for MST_User Table Update
CREATE OR ALTER PROC PR_MST_User_Update
@UserID			INT,
@UserName		NVARCHAR(100),
@Email			NVARCHAR(100),
@Password		NVARCHAR(100),
@Mobile			NVARCHAR(100),
@IsActive		BIT,
@IsAdmin		BIT
AS
BEGIN
	DECLARE @Modified DATETIME = GETDATE();
	UPDATE [dbo].[MST_User]
	SET 
		[dbo].[MST_User].[UserName]		=	@UserName,
		[dbo].[MST_User].[Password]		=	@Password,
		[dbo].[MST_User].[Email]		=	@Email,
		[dbo].[MST_User].[Mobile]		=	@Mobile,
		[dbo].[MST_User].[IsActive]		=	@IsActive,
		[dbo].[MST_User].[IsAdmin]		=	@IsAdmin,
		[dbo].[MST_User].[Modified]		=	@Modified
	WHERE [dbo].[MST_User].[UserID]		=	@UserID
END
--EXEC PR_MST_User_Update 1,'Jainil','jainilthummar2005@gmail.com','Jainil@123','7321234354',1,0

--Stored Procedures for MST_User Table Delete
CREATE OR ALTER PROC PR_MST_User_Delete
    @UserID INT
AS
BEGIN
    DELETE FROM [dbo].[MST_User]
    WHERE UserID = @UserID
END

--Stored Procedures for MST_User Table Select All
CREATE OR ALTER PROC PR_MST_User_SelectAll
AS
BEGIN
	SELECT 
		[dbo].[MST_User].[UserID],
		[dbo].[MST_User].[UserName],
		[dbo].[MST_User].[Password],
		[dbo].[MST_User].[Email],
		[dbo].[MST_User].[Mobile],
		[dbo].[MST_User].[IsActive],	
		[dbo].[MST_User].[IsAdmin],	
		[dbo].[MST_User].[Created],
		[dbo].[MST_User].[Modified]
	FROM [dbo].[MST_User]
END
--EXEC PR_MST_User_SelectAll

--Stored Procedures for MST_User Table Select By Id
CREATE OR ALTER PROC PR_MST_User_SelectByID
@UserID INT
AS
BEGIN
	SELECT 
		[dbo].[MST_User].[UserID],
		[dbo].[MST_User].[UserName],
		[dbo].[MST_User].[Password],
		[dbo].[MST_User].[Email],
		[dbo].[MST_User].[Mobile],
		[dbo].[MST_User].[IsActive],	
		[dbo].[MST_User].[IsAdmin],	
		[dbo].[MST_User].[Created],
		[dbo].[MST_User].[Modified]
	FROM [dbo].[MST_User]
	WHERE [dbo].[MST_User].[UserID] = @UserID
END
--EXEC PR_MST_User_SelectByID 1

-------------------------------Stored Procedures for MST_Quiz Table----------------------------
--Stored Procedures for MST_Quiz Table Insert
CREATE OR ALTER PROC PR_MST_Quiz_Insert
    @QuizName			NVARCHAR(100),
    @TotalQuestions		INT,
    @QuizDate			DATETIME,
    @UserID				INT
AS
BEGIN
	DECLARE @Modified DATETIME = GETDATE();
    INSERT INTO [dbo].[MST_Quiz] 
    (
        [dbo].[MST_Quiz].[QuizName],
        [dbo].[MST_Quiz].[TotalQuestions],
        [dbo].[MST_Quiz].[QuizDate],
        [dbo].[MST_Quiz].[UserID],
        [dbo].[MST_Quiz].[Modified]
    )
    VALUES
    (
        @QuizName,
        @TotalQuestions,
        @QuizDate,
        @UserID,
        @Modified
    )
END
--EXEC PR_MST_Quiz_Insert 'exam2',60,'2020-10-10',2


--Stored Procedures for MST_Quiz Table Update
CREATE OR ALTER PROC PR_MST_Quiz_Update
    @QuizID			INT,
    @QuizName		NVARCHAR(100),
    @TotalQuestions INT,
    @QuizDate		DATETIME,
	@UserID			INT
AS
BEGIN
	DECLARE @Modified DATETIME = GETDATE();
    UPDATE [dbo].[MST_Quiz]
    SET 
        [dbo].[MST_Quiz].[QuizName]			= @QuizName,
        [dbo].[MST_Quiz].[TotalQuestions]	= @TotalQuestions,
        [dbo].[MST_Quiz].[QuizDate]			= @QuizDate,
		[dbo].[MST_Quiz].[UserID]			= @UserID,
        [dbo].[MST_Quiz].[Modified]			= @Modified
    WHERE [dbo].[MST_Quiz].[QuizID]			= @QuizID
END
--EXEC PR_MST_Quiz_Update 1,'exam1',50,'2020-10-10',1


--Stored Procedures for MST_Quiz Table Delete
CREATE OR ALTER PROC PR_MST_Quiz_Delete
@QuizID INT
AS
BEGIN
	DELETE FROM [dbo].[MST_Quiz]
	WHERE [dbo].[MST_Quiz].[QuizID] = @QuizID
END
--EXEC PR_MST_Quiz_Delete 3


--Stored Procedures for MST_Quiz Table Select All
CREATE OR ALTER PROC PR_MST_Quiz_SelectAll
AS
BEGIN
    SELECT 
        [dbo].[MST_Quiz].[QuizID],
        [dbo].[MST_Quiz].[QuizName],
		[dbo].[MST_Quiz].[TotalQuestions],
        [dbo].[MST_Quiz].[QuizDate],
		[dbo].[MST_User].[UserName],
        [dbo].[MST_Quiz].[Created],
        [dbo].[MST_Quiz].[Modified]
        FROM [dbo].[MST_Quiz]
		JOIN [dbo].[MST_User] ON
		[dbo].[MST_Quiz].[UserID]=[dbo].[MST_User].[UserID]
END
--EXEC PR_MST_Quiz_SelectAll


-- Stored Procedure for Selecting a Quiz by QuizID
CREATE OR ALTER PROC PR_MST_Quiz_SelectByID
@QuizID INT
AS
BEGIN
    SELECT 
        [dbo].[MST_Quiz].[QuizID],
        [dbo].[MST_Quiz].[QuizName],
		[dbo].[MST_Quiz].[TotalQuestions],
        [dbo].[MST_Quiz].[QuizDate],
		[dbo].[MST_User].[UserName],
        [dbo].[MST_Quiz].[Created],
        [dbo].[MST_Quiz].[Modified]
        FROM [dbo].[MST_Quiz]
		JOIN [dbo].[MST_User] ON
		[dbo].[MST_Quiz].[UserID]=[dbo].[MST_User].[UserID]
    WHERE [dbo].[MST_Quiz].[QuizID] = @QuizID
END
--EXEC PR_MST_Quiz_SelectByID 1


----------------------- Stored Procedures for MST_Question Table ------------------------------
--Stored Procedures for MST_Question Table Insert
CREATE OR ALTER PROC PR_MST_Question_Insert
	@QuestionText		NVARCHAR(MAX),
	@QuestionLevelID	INT,
    @OptionB			NVARCHAR(100),
    @OptionA			NVARCHAR(100),
    @OptionC			NVARCHAR(100),
    @OptionD			NVARCHAR(100),
    @CorrectOption		NVARCHAR(100),
    @QuestionMarks		INT,
    @UserID				INT
AS
BEGIN
    INSERT INTO [dbo].[MST_Question] 
    (
        [dbo].[MST_Question].[QuestionText],
        [dbo].[MST_Question].[QuestionLevelID],
        [dbo].[MST_Question].[OptionA],
        [dbo].[MST_Question].[OptionB],
        [dbo].[MST_Question].[OptionC],
        [dbo].[MST_Question].[OptionD],
        [dbo].[MST_Question].[CorrectOption],
        [dbo].[MST_Question].[QuestionMarks],
		[dbo].[MST_Question].[IsActive],
        [dbo].[MST_Question].[UserID],
        [dbo].[MST_Question].[Modified]
    )
    VALUES
    (
        @QuestionText,
        @QuestionLevelID,
        @OptionA,
        @OptionB,
        @OptionC,
        @OptionD,
        @CorrectOption,
        @QuestionMarks,
		1,
        @UserID,
        GETDATE()
    )
END
--EXEC PR_MST_Question_Insert 'what is your name?',1,a,b,c,d,a,1,1
 

-- Stored Procedure for MST_Question Update
CREATE OR ALTER PROC PR_MST_Question_Update
@QuestionID			INT,
@QuestionText		NVARCHAR(MAX),
@QuestionLevelID	INT,
@OptionA			NVARCHAR(500),
@OptionB			NVARCHAR(500),
@OptionC			NVARCHAR(500),
@OptionD			NVARCHAR(500),
@CorrectOption		NVARCHAR(500),
@QuestionMarks		INT,
@IsActive			BIT,
@UserID				INT
AS
BEGIN
    UPDATE [dbo].[MST_Question]
    SET 
        [dbo].[MST_Question].[QuestionText]		= @QuestionText,
		[dbo].[MST_Question].[QuestionLevelID]	= @QuestionLevelID,
        [dbo].[MST_Question].[OptionA]			= @OptionA,
        [dbo].[MST_Question].[OptionB]			= @OptionB,
        [dbo].[MST_Question].[OptionC]			= @OptionC,
        [dbo].[MST_Question].[OptionD]			= @OptionD,
        [dbo].[MST_Question].[CorrectOption]	= @CorrectOption,
		[dbo].[MST_Question].[QuestionMarks]	= @QuestionMarks,
		[dbo].[MST_Question].[IsActive]			= @IsActive,
        [dbo].[MST_Question].[UserID]			= @UserID,
        [dbo].[MST_Question].[Modified]			= getdate()
    WHERE [dbo].[MST_Question].[QuestionID]		= @QuestionID
END
--EXEC PR_MST_Question_Update 1,'what is your name?',1,a,b,c,d,b,1,1,1


-- Stored Procedure for MST_Question Delete
CREATE OR ALTER PROC PR_MST_Question_Delete
@QuestionID INT
AS
BEGIN
    -- Deleting the Question based on QuestionID
    DELETE FROM [dbo].[MST_Question]
    WHERE [dbo].[MST_Question].[QuestionID] = @QuestionID
END
--EXEC PR_MST_Question_Delete 2

--Stored Procedures for MST_Question Select All
CREATE OR ALTER PROC PR_MST_Question_SelectAll
AS
BEGIN
    SELECT 
        [dbo].[MST_Question].[QuestionID],
        [dbo].[MST_Question].[QuestionText],
        [dbo].[MST_QuestionLevel].[QuestionLevel],
        [dbo].[MST_Question].[OptionA],
        [dbo].[MST_Question].[OptionB],
        [dbo].[MST_Question].[OptionC],
        [dbo].[MST_Question].[OptionD],
		'(a) '+[dbo].[MST_Question].[OptionA]+',(b) '+[dbo].[MST_Question].[OptionB]+',(c) '+[dbo].[MST_Question].[OptionC]+',(d) '+[dbo].[MST_Question].[OptionD] AS All_in_One,
        [dbo].[MST_Question].[CorrectOption],
        [dbo].[MST_Question].[QuestionMarks],
        [dbo].[MST_Question].[IsActive],
		[dbo].[MST_User].[UserName],
        [dbo].[MST_Question].[Created],
        [dbo].[MST_Question].[Modified]
    FROM [dbo].[MST_Question]
    INNER JOIN [dbo].[MST_QuestionLevel] ON [dbo].[MST_Question].[QuestionLevelID] = [dbo].[MST_QuestionLevel].[QuestionLevelID]
    INNER JOIN [dbo].[MST_User] ON [dbo].[MST_Question].[UserID] = [dbo].[MST_User].[UserID]
END
--EXEC PR_MST_Question_SelectAll

-- Stored Procedure for MST_Question Select by ID
CREATE OR ALTER PROC PR_MST_Question_SelectByID
@QuestionID INT
AS
BEGIN
    SELECT 
        [dbo].[MST_Question].[QuestionID],
        [dbo].[MST_Question].[QuestionText],
        [dbo].[MST_QuestionLevel].[QuestionLevel],
        [dbo].[MST_Question].[OptionA],
        [dbo].[MST_Question].[OptionB],
        [dbo].[MST_Question].[OptionC],
        [dbo].[MST_Question].[OptionD],
		[dbo].[MST_Question].[OptionA]+','+[dbo].[MST_Question].[OptionB]+','+[dbo].[MST_Question].[OptionC]+','+[dbo].[MST_Question].[OptionD] AS All_in_One,
        [dbo].[MST_Question].[CorrectOption],
        [dbo].[MST_Question].[QuestionMarks],
        [dbo].[MST_Question].[IsActive],
		[dbo].[MST_User].[UserName],
        [dbo].[MST_Question].[Created],
        [dbo].[MST_Question].[Modified]
    FROM [dbo].[MST_Question]
    INNER JOIN [dbo].[MST_QuestionLevel] ON [dbo].[MST_Question].[QuestionLevelID] = [dbo].[MST_QuestionLevel].[QuestionLevelID]
    INNER JOIN [dbo].[MST_User] ON [dbo].[MST_Question].[UserID] = [dbo].[MST_User].[UserID]
    WHERE [dbo].[MST_Question].[QuestionID] = @QuestionID
END
--EXEC PR_MST_Question_SelectByID 1

------------------------------- Stored Procedures for MST_QuestionLevel Table --------------------
-- Stored Procedures for MST_QuestionLevel Table Insert
CREATE OR ALTER PROC PR_MST_QuestionLevel_Insert
    @QuestionLevel NVARCHAR(100),
    @UserID			INT
AS
BEGIN
    -- Inserting a new Question Level into MST_QuestionLevel table
    INSERT INTO [dbo].[MST_QuestionLevel] 
    (
        [dbo].[MST_QuestionLevel].[QuestionLevel],
        [dbo].[MST_QuestionLevel].[UserID],
        [dbo].[MST_QuestionLevel].[Modified]
    )
    VALUES
    (
        @QuestionLevel,
        @UserID,
        getdate()
    )
END
--EXEC PR_MST_QuestionLevel_Insert 'easy',2

-- Stored Procedures for MST_QuestionLevel Table Update
CREATE OR ALTER PROC PR_MST_QuestionLevel_Update
@QuestionLevelID	INT,
@QuestionLevel		NVARCHAR(100),
@UserID				INT
AS
BEGIN
    UPDATE [dbo].[MST_QuestionLevel]
    SET 
        [dbo].[MST_QuestionLevel].[QuestionLevel] = @QuestionLevel,
        [dbo].[MST_QuestionLevel].[UserID] = @UserID,
        [dbo].[MST_QuestionLevel].[Modified] = Getdate()
    WHERE [dbo].[MST_QuestionLevel].[QuestionLevelID] = @QuestionLevelID
END
--EXEC PR_MST_QuestionLevel_Update 2,'easy',1


-- Stored Procedure for MST_QuestionLevel Table Delete
CREATE OR ALTER PROC PR_MST_QuestionLevel_Delete
@QuestionLevelID INT
AS
BEGIN
    DELETE FROM [dbo].[MST_QuestionLevel]
    WHERE [dbo].[MST_QuestionLevel].[QuestionLevelID] = @QuestionLevelID
END
--EXEC PR_MST_QuestionLevel_Delete 2


-- Stored Procedure for MST_QuestionLevel Table Selecting All
CREATE OR ALTER PROC PR_MST_QuestionLevel_SelectAll
AS
BEGIN
    SELECT 
        [dbo].[MST_QuestionLevel].[QuestionLevelID],
        [dbo].[MST_QuestionLevel].[QuestionLevel],
		[dbo].[MST_User].[UserName],
        [dbo].[MST_QuestionLevel].[Created],
        [dbo].[MST_QuestionLevel].[Modified]
    FROM 
        [dbo].[MST_QuestionLevel]
    INNER JOIN 
        [dbo].[MST_User] 
    ON 
        [dbo].[MST_QuestionLevel].[UserID] = [dbo].[MST_User].[UserID]
END
--EXEC PR_MST_QuestionLevel_SelectAll


-- Stored Procedure for MST_QuestionLevel Table Selecte by ID
CREATE OR ALTER PROC PR_MST_QuestionLevel_SelectByID
@QuestionLevelID INT
AS
BEGIN
    SELECT 
        [dbo].[MST_QuestionLevel].[QuestionLevelID],
        [dbo].[MST_QuestionLevel].[QuestionLevel],
		[dbo].[MST_User].[UserName],
        [dbo].[MST_QuestionLevel].[Created],
        [dbo].[MST_QuestionLevel].[Modified]
    FROM 
        [dbo].[MST_QuestionLevel]
    INNER JOIN 
        [dbo].[MST_User] 
    ON 
        [dbo].[MST_QuestionLevel].[UserID] = [dbo].[MST_User].[UserID]
    WHERE 
        [dbo].[MST_QuestionLevel].[QuestionLevelID] = @QuestionLevelID
END
EXEC PR_MST_QuestionLevel_SelectByID 2


-------------------- Stored Procedures for MST_QuizWiseQuestions Table -------------------------
-- Stored Procedures for MST_QuizWiseQuestions Table Insert
CREATE OR ALTER PROC PR_MST_QuizWiseQuestions_Insert
    @QuizID			INT,
    @QuestionID		INT,
    @UserID			INT
AS
BEGIN
    INSERT INTO [dbo].[MST_QuizWiseQuestions] 
    (
        [dbo].[MST_QuizWiseQuestions].[QuizID],
        [dbo].[MST_QuizWiseQuestions].[QuestionID],
        [dbo].[MST_QuizWiseQuestions].[UserID],
        [dbo].[MST_QuizWiseQuestions].[Modified]
    )
    VALUES
    (
        @QuizID,
        @QuestionID,
        @UserID,
        getdate()
    )
END
--EXEC PR_MST_QuizWiseQuestions_Insert 2,1,2


-- Stored Procedures for MST_QuizWiseQuestions Table Update
CREATE OR ALTER PROC PR_MST_QuizWiseQuestions_Update
@QuizWiseQuestionsID	INT,
@QuizID					INT,
@QuestionID				INT,
@UserID					INT
AS
BEGIN
	UPDATE [dbo].[MST_QuizWiseQuestions]
	SET 
		[dbo].[MST_QuizWiseQuestions].[QuizID]		= @QuizID,
		[dbo].[MST_QuizWiseQuestions].[QuestionID]	= @QuestionID,
		[dbo].[MST_QuizWiseQuestions].[UserID]		= @UserID,
		[dbo].[MST_QuizWiseQuestions].[Modified]	= getdate()
	WHERE [dbo].[MST_QuizWiseQuestions].[QuizWiseQuestionsID] = @QuizWiseQuestionsID
END
--EXEC PR_MST_QuizWiseQuestions_Update 2,2,1,2


-- Stored Procedures for MST_QuizWiseQuestions Table Delete
CREATE OR ALTER PROC PR_MST_QuizWiseQuestions_Delete
@QuizWiseQuestionsID INT
AS
BEGIN
	DELETE FROM [dbo].[MST_QuizWiseQuestions]
	WHERE [dbo].[MST_QuizWiseQuestions].[QuizWiseQuestionsID] = @QuizWiseQuestionsID
END
--EXEC PR_MST_QuizWiseQuestions_Delete 3

-- Stored Procedures for MST_QuizWiseQuestions Table Select All
CREATE OR ALTER PROC PR_MST_QuizWiseQuestions_SelectAll
AS
BEGIN
	SELECT 
		[dbo].[MST_QuizWiseQuestions].[QuizWiseQuestionsID],
		[dbo].[MST_QuizWiseQuestions].[QuizID],
		[dbo].[MST_Quiz].[QuizName],
		[dbo].[MST_QuizWiseQuestions].[QuestionID],
		[dbo].[MST_Question].[QuestionText],
		[dbo].[MST_QuizWiseQuestions].[UserID],
		[dbo].[MST_User].[UserName],
		[dbo].[MST_QuizWiseQuestions].[Created],
		[dbo].[MST_QuizWiseQuestions].[Modified]
	FROM [dbo].[MST_QuizWiseQuestions]
	INNER JOIN [dbo].[MST_Quiz] ON [dbo].[MST_QuizWiseQuestions].[QuizID] = [dbo].[MST_Quiz].[QuizID]
	INNER JOIN [dbo].[MST_Question] ON [dbo].[MST_QuizWiseQuestions].[QuestionID] = [dbo].[MST_Question].[QuestionID]
	INNER JOIN [dbo].[MST_User] ON [dbo].[MST_QuizWiseQuestions].[UserID]=[dbo].[MST_User].[UserID]
END
--EXEC PR_MST_QuizWiseQuestions_SelectAll


-- Stored Procedures for MST_QuizWiseQuestions Table Select By Id
CREATE OR ALTER PROC PR_MST_QuizWiseQuestions_SelectByID
@QuizWiseQuestionsID INT
AS
BEGIN
	SELECT 
		[dbo].[MST_QuizWiseQuestions].[QuizWiseQuestionsID],
		[dbo].[MST_QuizWiseQuestions].[QuizID],
		[dbo].[MST_Quiz].[QuizName],
		[dbo].[MST_QuizWiseQuestions].[QuestionID],
		[dbo].[MST_Question].[QuestionText],
		[dbo].[MST_QuizWiseQuestions].[UserID],
		[dbo].[MST_User].[UserName],
		[dbo].[MST_QuizWiseQuestions].[Created],
		[dbo].[MST_QuizWiseQuestions].[Modified]
	FROM [dbo].[MST_QuizWiseQuestions]
	INNER JOIN [dbo].[MST_Quiz] ON [dbo].[MST_QuizWiseQuestions].[QuizID] = [dbo].[MST_Quiz].[QuizID]
	INNER JOIN [dbo].[MST_Question] ON [dbo].[MST_QuizWiseQuestions].[QuestionID] = [dbo].[MST_Question].[QuestionID]
	INNER JOIN [dbo].[MST_User] ON [dbo].[MST_QuizWiseQuestions].[UserID]=[dbo].[MST_User].[UserID]
	WHERE [dbo].[MST_QuizWiseQuestions].[QuizWiseQuestionsID] = @QuizWiseQuestionsID
END
--EXEC PR_MST_QuizWiseQuestions_SelectByID 3


------------------------Dropdown queris--------------------------

---------Dropdown query for MST_User table---------
CREATE OR ALTER PROC Dropdown_MST_User
AS
BEGIN
	SELECT
		[dbo].[MST_User].[UserID],
		[dbo].[MST_User].[UserName]
		FROM [dbo].[MST_User]
END



---------Dropdown query for MST_Quiz table---------
CREATE OR ALTER PROC Dropdown_MST_Quiz
AS
BEGIN
	SELECT
		[dbo].[MST_Quiz].[QuizID],
		[dbo].[MST_Quiz].[QuizName]
		FROM [dbo].[MST_Quiz]
END



---------Dropdown query for MST_Question table---------
CREATE OR ALTER PROC Dropdown_MST_Question
AS
BEGIN
	SELECT
		[dbo].[MST_Question].[QuestionID],
		[dbo].[MST_Question].[QuestionText]
		FROM [dbo].[MST_Question]
END



---------Dropdown query for MST_QuestionLevel table---------
CREATE OR ALTER PROC Dropdown_MST_QuestionLevel
AS
BEGIN
	SELECT
		[dbo].[MST_QuestionLevel].[QuestionLevelID],
		[dbo].[MST_QuestionLevel].[QuestionLevel]
		FROM [dbo].[MST_QuestionLevel]
END