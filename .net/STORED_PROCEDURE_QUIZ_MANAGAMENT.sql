	

----PROCEDURE FOR QUIZ MANAGEMENT SYSTEM PROJECT ASP.NET CORE----

--LOGIN PROCEDURE FOR USER TABLE

--EXEC PR_MST_User_SelectByUsernamePassword 'Deven','12345'
CREATE OR ALTER PROCEDURE [dbo].[PR_MST_User_SelectByUsernamePassword]
@USERNAME NVARCHAR(MAX),
@PASSWORD NVARCHAR(MAX)
AS BEGIN
	SELECT [dbo].[MST_User].[UserName],
		[dbo].[MST_User].[Password]
	FROM [dbo].[MST_User]
	WHERE (
		[dbo].[MST_User].[UserName] = @USERNAME OR
		[dbo].[MST_User].[Email]	= @USERNAME	OR 
		[dbo].[MST_User].[Mobile]	= @USERNAME
		)
		AND [dbo].[MST_User].[Password] = @PASSWORD 
		AND [dbo].[MST_User].[IsActive] = 1
END

--SELECT ALL PROCEDURE FROM USER TABLE

--EXEC PR_MST_User_SelectAll
CREATE OR ALTER PROCEDURE [dbo].[PR_MST_User_SelectAll] AS
BEGIN
	SELECT	[dbo].[MST_User].[UserID]
			,[dbo].[MST_User].[UserName]
			,[dbo].[MST_User].[Password]
			,[dbo].[MST_User].[Email]
			,[dbo].[MST_User].[Mobile]
			,[dbo].[MST_User].[IsActive]
			,[dbo].[MST_User].[IsAdmin]
			,[dbo].[MST_User].[Created]
			,[dbo].[MST_User].[Modified]
	FROM [dbo].[MST_User]
	ORDER BY [dbo].[MST_User].[UserName]
END


--SELECT BY PK PROCEDURE FROM USER TABLE

--EXEC PR_MST_User_SelectByPK 2
CREATE OR ALTER PROCEDURE [dbo].[PR_MST_User_SelectByPK]
@UserID INT
AS BEGIN
	SELECT	[dbo].[MST_User].[UserID]
			,[dbo].[MST_User].[UserName]
			,[dbo].[MST_User].[Password]
			,[dbo].[MST_User].[Email]
			,[dbo].[MST_User].[Mobile]
			,[dbo].[MST_User].[IsActive]
			,[dbo].[MST_User].[IsAdmin]
			,[dbo].[MST_User].[Created]
			,[dbo].[MST_User].[Modified]
	FROM [dbo].[MST_User]
	WHERE [dbo].[MST_User].[UserId] = @UserID
	ORDER BY [dbo].[MST_User].[UserName]
END


--INSERT PROCEDURE FOR USER TABLE

--EXEC PR_MST_User_Insert 'DEVEN','Dev123','DEVEN1@GMAIL.COM',1234567891,1,0
CREATE OR ALTER PROCEDURE [dbo].[PR_MST_User_Insert]
@UserName  NVARCHAR(MAX),
@Password NVARCHAR(MAX),
@Email NVARCHAR(MAX),
@Mobile NVARCHAR(MAX)
AS BEGIN
	INSERT INTO [dbo].[MST_User]
	(	
		[dbo].[MST_User].[UserName]
		,[dbo].[MST_User].[Password]
		,[dbo].[MST_User].[Email]
		,[dbo].[MST_User].[Mobile]
		,[dbo].[MST_User].[Modified]
	)
	VALUES
	(
		@UserName
		,@Password
		,@Email
		,@Mobile
		,GETDATE()
	)
END


--UPDATE PROCEDURE FOR USER TABLE

--EXEC PR_MST_User_UpdateByPK
CREATE OR ALTER PROCEDURE  [dbo].[PR_MST_User_UpdateByPK]
@UserID INT,
@UserName NVARCHAR(MAX),
@Password NVARCHAR(MAX),
@Email NVARCHAR(MAX),
@Mobile NVARCHAR(MAX),
@IsActive BIT,
@IsAdmin BIT
AS BEGIN
	UPDATE [dbo].[MST_User]
	SET	[dbo].[MST_User].[UserName]	= @UserName
		,[dbo].[MST_User].[Password]	= @Password
		,[dbo].[MST_User].[Email]	    = @Email
		,[dbo].[MST_User].[Mobile]	    = @Mobile
		,[dbo].[MST_User].[IsActive]	= @IsActive
		,[dbo].[MST_User].[IsAdmin]	    = @IsAdmin
		,[dbo].[MST_User].[Modified]	= GETDATE()
	WHERE [dbo].[MST_User].[UserId] = @UserID
END


--DELETE PROCEDURE FOR USER TABLE

--EXEC PR_MST_User_DeleteByPK
CREATE OR ALTER PROCEDURE [dbo].[PR_MST_User_DeleteByPK]
@UserID INT,
@IsActive BIT
AS BEGIN
	UPDATE [dbo].[MST_User]
	SET [dbo].[MST_User].[IsActive] = 0
	WHERE [dbo].[MST_User].[UserID] = @UserID
END
	
--DELETE FROM [dbo].[MST_User]
--WHERE [dbo].[MST_User].[UserID] = @UserID


----PROCEDURE FOR QUIZ TABLE----


--SELECT BY ALL PROCEDURE FOR QUIZ TABLE 

--EXEC PR_MST_Quiz_SelectAll
CREATE OR ALTER PROCEDURE [dbo].[PR_MST_Quiz_SelectAll] 
AS BEGIN
	SELECT [dbo].[MST_Quiz].[QuizID]
		,[dbo].[MST_Quiz].[QuizName]
		,[dbo].[MST_Quiz].[TotalQuestions]
		,[dbo].[MST_Quiz].[QuizDate]
		,[dbo].[MST_Quiz].[UserID]
		,[dbo].[MST_Quiz].[Created]
		,[dbo].[MST_Quiz].[Modified]
		,[dbo].[MST_Quiz].[UserID]
		,[dbo].[MST_User].[UserName]
	FROM [dbo].[MST_Quiz]
	INNER JOIN [dbo].[MST_User]  
	ON [dbo].[MST_Quiz].[UserID] = [dbo].[MST_User].[UserId]
END


--SELECT BY PK PROCEDURE FOR QUIZ TABLE 

--EXEC PR_MST_Quiz_SelectByPK 1
CREATE OR ALTER PROCEDURE [dbo].[PR_MST_Quiz_SelectByPK]
@QuizID INT
AS BEGIN
	SELECT [dbo].[MST_Quiz].[QuizID]
		,[dbo].[MST_Quiz].[QuizName]
		,[dbo].[MST_Quiz].[TotalQuestions]
		,[dbo].[MST_Quiz].[QuizDate]
		,[dbo].[MST_Quiz].[UserID]
		,[dbo].[MST_Quiz].[Created]
		,[dbo].[MST_Quiz].[Modified]
	FROM [dbo].[MST_Quiz]
	WHERE [dbo].[MST_Quiz].[QuizID] = @QuizID
END


--INSERT PROCEDURE FOR QUIZ TABLE

--EXEC PR_MST_Quiz_Insert
CREATE OR ALTER PROCEDURE [dbo].[PR_MST_Quiz_Insert]
@QuizName NVARCHAR(MAX),
@TotalQuestions NVARCHAR(MAX),
@QuizDate DATETIME,
@UserID INT
AS BEGIN 
	INSERT INTO [dbo].[MST_Quiz]
	(
		[dbo].[MST_Quiz].[QuizName]
		,[dbo].[MST_Quiz].[TotalQuestions]
		,[dbo].[MST_Quiz].[QuizDate]
		,[dbo].[MST_Quiz].[UserID]
		,[dbo].[MST_Quiz].[Modified]
	)
	VALUES
	(
		@QuizName
		,@TotalQuestions
		,@QuizDate
		,@UserID 
		,GETDATE()
	)
END


--UPDATE PROCEDURE FOR QUIZ TABLE

--EXEC PR_MST_Quiz_UpdateByPK
CREATE OR ALTER PROCEDURE [dbo].[PR_MST_Quiz_UpdateByPK]
@QuizID INT,
@QuizName NVARCHAR(MAX),
@TotalQuestions NVARCHAR(MAX),
@QuizDate DATETIME,
@UserID INT
AS BEGIN
	UPDATE [dbo].[MST_Quiz]
	SET [dbo].[MST_Quiz].[QuizName]        = @QuizName
		,[dbo].[MST_Quiz].[TotalQuestions] = @TotalQuestions
		,[dbo].[MST_Quiz].[QuizDate]       = @QuizDate
		,[dbo].[MST_Quiz].[UserID]		   = @UserID 
		,[dbo].[MST_Quiz].[Modified]	   = GETDATE()
	WHERE [dbo].[MST_Quiz].[QuizID] = @QuizID
END


--DELETE PROCEDURE FOR QUIZ TABLE

--EXEC PR_MST_Quiz_DeleteByPK
CREATE OR ALTER PROCEDURE [dbo].[PR_MST_Quiz_DeleteByPK]
@QuizID INT
AS BEGIN
	DELETE FROM [dbo].[MST_Quiz]
	WHERE [dbo].[MST_Quiz].[QuizID] = @QuizID
END



--PROCEDURE FOR QUESTIONS TABLE


--SELECT BY ALL PROCEDURE FOR QUESTIONS TABLE

ALTER TABLE MST_Question
ALTER COLUMN CorrectOption INT

--EXEC PR_Question_SelectALL
CREATE OR ALTER PROCEDURE [dbo].[PR_MST_Question_SelectALL]
AS BEGIN
	SELECT [dbo].[MST_Question].[QuestionID]
		,[dbo].[MST_Question].[QuestionText]
		,[dbo].[MST_QuestionLevel].[QuestionLevel]
		,[dbo].[MST_Question].[CorrectOption]
		,[dbo].[MST_Question].[QuestionMarks]
		,[dbo].[MST_Question].[IsActive]
		,[dbo].[MST_Question].[OptionA]
		,[dbo].[MST_Question].[OptionB]
		,[dbo].[MST_Question].[OptionC]
		,[dbo].[MST_Question].[OptionD]
		,[dbo].[MST_Question].[OptionA] +' , '+[dbo].[MST_Question].[OptionB] +' , '+ [dbo].[MST_Question].[OptionC] + ' , '+[dbo].[MST_Question].[OptionD] AS ALL_OPTION
		,[dbo].[MST_Question].[Created]
		,[dbo].[MST_Question].[Modified]
		,[dbo].[MST_Question].[UserID]
		,[dbo].[MST_User].[UserName]
		,[dbo].[MST_QuestionLevel].[QuestionLevelID]
	FROM [dbo].[MST_Question]
	INNER JOIN [dbo].[MST_User] ON [dbo].[MST_Question].[UserID] = [dbo].[MST_User].[UserId]
	INNER JOIN [dbo].[MST_QuestionLevel] ON [dbo].[MST_Question].[QuestionLevelID] = [dbo].[MST_QuestionLevel].[QuestionLevelID]
	ORDER BY [dbo].[MST_Question].[QuestionText]
END

--SELECT BY PK PROCEDURE FOR QUESTIONS TABLE 

--EXEC PR_Question_SelectByPK
CREATE OR ALTER PROCEDURE [dbo].[PR_Question_SelectByPK]
@QuestionID INT
AS BEGIN
	SELECT [dbo].[MST_Question].[QuestionID]
		,[dbo].[MST_Question].[QuestionText]
		,[dbo].[MST_Question].[QuestionLevelID]
		,[dbo].[MST_Question].[CorrectOption]
		,[dbo].[MST_Question].[QuestionMarks]
		,[dbo].[MST_Question].[IsActive]
		,[dbo].[MST_Question].[OptionA]
		,[dbo].[MST_Question].[OptionB]
		,[dbo].[MST_Question].[OptionC]
		,[dbo].[MST_Question].[OptionD]
		,[dbo].[MST_Question].[Created]
		,[dbo].[MST_Question].[Modified]
		,[dbo].[MST_Question].[UserID]
	FROM [dbo].[MST_Question]
	WHERE [dbo].[MST_Question].[QuestionID] = @QuestionID
END

--INSERT PROCEDURE FOR QUESTIONS TABLE

--EXEC PR_Question_Insert
CREATE OR ALTER PROCEDURE [dbo].[PR_Question_Insert]
@QuestionText NVARCHAR(MAX),
@CorrectOption INT,
@QuestionLevelID INT,
@QuestionMarks INT,
@IsActive BIT,
@OptionA NVARCHAR(MAX),
@OptionB NVARCHAR(MAX),
@OptionC NVARCHAR(MAX),
@OptionD NVARCHAR(MAX),
@UserID INT
AS BEGIN
	INSERT INTO [dbo].[MST_Question]
	(
		[dbo].[MST_Question].[QuestionText]
		,[dbo].[MST_Question].[QuestionLevelID]
		,[dbo].[MST_Question].[CorrectOption]
		,[dbo].[MST_Question].[QuestionMarks]
		,[dbo].[MST_Question].[IsActive]
		,[dbo].[MST_Question].[OptionA]
		,[dbo].[MST_Question].[OptionB]
		,[dbo].[MST_Question].[OptionC]
		,[dbo].[MST_Question].[OptionD]
		,[dbo].[MST_Question].[UserID]
		,[dbo].[MST_Question].[Modified]
	)
	VALUES
	(
		@QuestionText,
		@CorrectOption,
		@QuestionLevelID,
		@QuestionMarks,
		@IsActive,
		@OptionA,
		@OptionB,
		@OptionC,
		@OptionD,
		@UserID,
		GETDATE()
	)
END


--UPDATE PROCEDURE FOR QUESTIONS TABLE

--EXEC PR_Question_UpdateByPK
CREATE OR ALTER PROCEDURE [dbo].[PR_Question_UpdateByPK]
@QuestionID INT,
@QuestionText NVARCHAR(MAX),
@CorrectOption INT,
@QuestionLevelID INT,
@QuestionMarks INT,
@IsActive BIT,
@OptionA NVARCHAR(MAX),
@OptionB NVARCHAR(MAX),
@OptionC NVARCHAR(MAX),
@OptionD NVARCHAR(MAX),
@UserID INT
AS BEGIN
	UPDATE [dbo].[MST_Question]
	SET [dbo].[MST_Question].[QuestionText]    = @QuestionText
		,[dbo].[MST_Question].[CorrectOption]   = @CorrectOption
		,[dbo].[MST_Question].[QuestionLevelID] = @CorrectOption
		,[dbo].[MST_Question].[QuestionMarks]   = @CorrectOption
		,[dbo].[MST_Question].[IsActive]	    = @CorrectOption
		,[dbo].[MST_Question].[OptionA]		    = @OptionA
		,[dbo].[MST_Question].[OptionB]		    = @OptionB
		,[dbo].[MST_Question].[OptionC]		    = @OptionC
		,[dbo].[MST_Question].[OptionD]		    = @OptionD
		,[dbo].[MST_Question].[UserID]		    = @UserID
		,[dbo].[MST_Question].[Modified]		= GETDATE()
	WHERE [dbo].[MST_Question].[QuestionID] = @QuestionID
END


--DELETE PROCEDURE FOR QUESTIONS TABLE

--EXEC PR_Questions_DeleteByPK
CREATE OR ALTER PROCEDURE [dbo].[PR_Questions_DeleteByPK]
@QuestionID INT
AS BEGIN
	DELETE FROM [dbo].[MST_Question]
	WHERE [dbo].[MST_Question].[QuestionID] = @QuestionID
END


----PROCEDURE FOR QUESTIONLEVEL TABLE-----


--SELECT BY ALL PROCEDURE FOR QUESTIONLEVEL TABLE 

--EXEC PR_MST_QuestionLevel_SelectALL
CREATE OR ALTER PROCEDURE [dbo].[PR_MST_QuestionLevel_SelectALL]
AS BEGIN
	SELECT  [dbo].[MST_QuestionLevel].[QuestionLevelID]
		,[dbo].[MST_QuestionLevel].[QuestionLevel]
		,[dbo].[MST_QuestionLevel].[UserID]
		,[dbo].[MST_QuestionLevel].[Created]
		,[dbo].[MST_QuestionLevel].[Modified]
		,[dbo].[MST_User].[UserName]
	FROM [dbo].[MST_QuestionLevel]
	INNER JOIN [dbo].[MST_User] ON [dbo].[MST_QuestionLevel].[UserID] = [dbo].[MST_User].[UserId]
	ORDER BY [dbo].[MST_QuestionLevel].[UserID]
END


--SELECT BY PK PROCEDURE FOR QUESTIONLEVEL TABLE 

--EXEC PR_MST_QuestionLevel_SelectByPK
CREATE OR ALTER PROCEDURE  [dbo].[PR_MST_QuestionLevel_SelectByPK]
@QuestionLevelID INT
AS BEGIN
	SELECT [dbo].[MST_QuestionLevel].[QuestionLevelID]
		,[dbo].[MST_QuestionLevel].[QuestionLevel]
		,[dbo].[MST_QuestionLevel].[UserID]
		,[dbo].[MST_QuestionLevel].[Created]
		,[dbo].[MST_QuestionLevel].[Modified]
	FROM [dbo].[MST_QuestionLevel]
	WHERE [dbo].[MST_QuestionLevel].[QuestionLevelID] = @QuestionLevelID
END


--CREATE OR ALTER PROCEDURE [dbo].[PR_MST_QuestionLevel_Select]


--INSERT PROCEDURE FOR QUESTIONLEVEL TABLE

--EXEC PR_MST_QuestionLevel_Insert
CREATE OR ALTER PROCEDURE [dbo].[PR_MST_QuestionLevel_Insert]
@QuestionLevel NVARCHAR(MAX),
@UserID INT
AS BEGIN
	INSERT INTO [dbo].[MST_QuestionLevel]
	(
		[dbo].[MST_QuestionLevel].[QuestionLevel]
		,[dbo].[MST_QuestionLevel].[UserID]
		,[dbo].[MST_QuestionLevel].[Modified]
	)
	VALUES
	(
		@QuestionLevel
		,@UserID
		,GETDATE()
	)
END


--UPDATE PROCEDURE FOR QUESTIONLEVEL TABLE

--EXEC PR_MST_QuestionLevel_UpdateByPK                                        --------------------------------------------------
CREATE OR ALTER PROCEDURE [dbo].[PR_MST_QuestionLevel_UpdateByPK]
@QuestionLevelID INT,
@QuestionLevel NVARCHAR(MAX),
@UserID INT
AS BEGIN
	UPDATE [dbo].[MST_QuestionLevel]
	SET [dbo].[MST_QuestionLevel].[QuestionLevel]	  = @QuestionLevel
		,[dbo].[MST_QuestionLevel].[UserID]			  = @UserID
		,[dbo].[MST_QuestionLevel].[Modified]	      = GETDATE()
	WHERE [dbo].[MST_QuestionLevel].[QuestionLevelID] = @QuestionLevelID
END

----------------------------------------------------------DROPDOWN PROCEDURE FOR QUESTION LEVEL TABLE

CREATE OR ALTER PROCEDURE [dbo].[MST_Question_DropDown]
@QuestionID INT,
@QuestionText NVARCHAR(MAX)
AS BEGIN
	SELECT [dbo].[MST_Question].[QuestionID],
		[dbo].[MST_Question].[QuestionText]
	FROM [dbo].[MST_Question]
END


--DELETE PROCEDURE FOR QUESTIONLEVEL TABLE

--EXEC PR_MST_QuestionLevel_DeleteByPK
CREATE OR ALTER PROCEDURE [dbo].[PR_MST_QuestionLevel_DeleteByPK]
@QuestionLevelID INT
AS BEGIN  
	DELETE FROM [dbo].[MST_QuestionLevel]
	WHERE [dbo].[MST_QuestionLevel].[QuestionLevelID] = @QuestionLevelID
END



----PROCEDURE FOR MST_QUIZWISEQUESTION TABLE

--SELECT BY ALL PROCEDURE FOR MST_QUIZWISEQUESTION TABLE

--EXEC PR_MST__QuizWiseQuestions_SelectByALL
CREATE OR ALTER PROCEDURE [dbo].[PR_MST__QuizWiseQuestions_SelectALL]
AS BEGIN
	SELECT [dbo].[MST_QuizWiseQuestions].[QuizWiseQuestionsID]
		,[dbo].[MST_QuizWiseQuestions].[QuizID]
		,[dbo].[MST_QuizWiseQuestions].[QuestionID]
		,[dbo].[MST_QuizWiseQuestions].[UserID]
		,[dbo].[MST_QuizWiseQuestions].[Created]
		,[dbo].[MST_QuizWiseQuestions].[Modified]
		,[dbo].[MST_User].[UserName]
		,[dbo].[MST_Quiz].[QuizName]
		,[dbo].[MST_Question].[QuestionText]
	FROM [dbo].[MST_QuizWiseQuestions]
	INNER JOIN [dbo].[MST_User] ON [dbo].[MST_QuizWiseQuestions].[UserId] = [dbo].[MST_User].[UserId]
	INNER JOIN [dbo].[MST_Quiz] ON [dbo].[MST_QuizWiseQuestions].[QuizID] = [dbo].[MST_Quiz].[QuizID]
	INNER JOIN [dbo].[MST_Question] ON [dbo].[MST_Question].[QuestionID] = [dbo].[MST_QuizWiseQuestions].[QuestionID]
	ORDER BY [dbo].[MST_Quiz].[QuizName]
END

--SELECT BY PK PROCEDURE FOR MST_QUIZWISEQUESTION TABLE 

--EXEC PR_MST__QuizWiseQuestions_SelectByPK
CREATE OR ALTER PROCEDURE [dbo].[PR_MST__QuizWiseQuestions_SelectByPK]
@QuizWiseQuestionID INT
AS BEGIN
	SELECT [dbo].[MST_QuizWiseQuestions].[QuizWiseQuestionsID]
		,[dbo].[MST_QuizWiseQuestions].[QuizID]
		,[dbo].[MST_QuizWiseQuestions].[QuestionID]
		,[dbo].[MST_QuizWiseQuestions].[UserID]
		,[dbo].[MST_QuizWiseQuestions].[Created]
		,[dbo].[MST_QuizWiseQuestions].[Modified]
	FROM [dbo].[MST_QuizWiseQuestions]
	WHERE [dbo].[MST_QuizWiseQuestions].[QuizWiseQuestionsID] = @QuizWiseQuestionID
END

--INSERT PROCEDURE FOR MST_QUIZWISEQUESTION TABLE

--EXEC PR_MST_QuizWiseQuestions_INSERT
CREATE OR ALTER PROCEDURE [dbo].[PR_MST_QuizWiseQuestions_INSERT]
@QuizID INT,
@QuestionID INT,
@UserID INT
AS BEGIN
	INSERT INTO [dbo].[MST_QuizWiseQuestions]
	(
		[dbo].[MST_QuizWiseQuestions].[QuizID]
		,[dbo].[MST_QuizWiseQuestions].[QuestionID]
		,[dbo].[MST_QuizWiseQuestions].[UserID]
		,[dbo].[MST_QuizWiseQuestions].[Modified]
	)
	VALUES
	(
		@QuizID,
		@QuestionID,
		@UserID,
		GETDATE()
	)
END

--UPDATE PROCEDURE FOR MST_QUIZWISEQUESTION TABLE

--EXEC PR_MST_QuizWiseQuestions_UPDATE
CREATE OR ALTER PROCEDURE [dbo].[PR_MST_QuizWiseQuestions_UPDATE]
@QuizWiseQuestionsID INT,
@QuizID INT,
@QuestionID INT,
@UserID INT
AS BEGIN
	UPDATE [dbo].[MST_QuizWiseQuestions]
	SET [dbo].[MST_QuizWiseQuestions].[QuizID]              = @QuizID
		,[dbo].[MST_QuizWiseQuestions].[QuestionID]	        = @QuestionID
		,[dbo].[MST_QuizWiseQuestions].[UserID]		        = @UserID
		,[dbo].[MST_QuizWiseQuestions].[Modified]	        = GETDATE()
	WHERE [dbo].[MST_QuizWiseQuestions].[QuizWiseQuestionsID] = @QuizWiseQuestionsID
END

--DROPDOWN PROCEDURE FOR QUIZWISE QUESTION TABLE

--EXEC MST_Question_DropDown
CREATE OR ALTER PROCEDURE [dbo].[MST_Question_DropDown]
@QuestionID INT,
@QuestionText NVARCHAR(MAX)
AS BEGIN
	SELECT [dbo].[MST_Question].[QuestionID],
		[dbo].[MST_Question].[QuestionText]
	FROM [dbo].[MST_Question]
	ORDER BY [dbo].[MST_Question].[QuestionText]
END

--DROPDOWN PROCEDURE FOR QUIZ TABLE

--EXEC MST_Quiz_DropDown
CREATE OR ALTER PROCEDURE [dbo].[MST_Quiz_DropDown]
@QuizID INT,
@QuizName NVARCHAR(MAX)
AS BEGIN
	SELECT [dbo].[MST_Quiz].[QuizID],
		[dbo].[MST_Quiz].[QuizName]
	FROM [dbo].[MST_Quiz]
	ORDER BY [dbo].[MST_Quiz].[QuizName]
END

--DELETE PROCEDURE FOR MST_QUIZWISEQUESTION TABLE

--EXEC PR_MST__QuizWiseQuestions_DELETE
CREATE OR ALTER PROCEDURE [dbo].[PR_MST_QuizWiseQuestions_DELETE]
@QuizWiseQuestionsID INT
AS BEGIN
	DELETE FROM [dbo].[MST_QuizWiseQuestions]
	WHERE [dbo].[MST_QuizWiseQuestions].[QuizWiseQuestionsID] = @QuizWiseQuestionsID
END