USE [Address]
GO
/****** Object:  StoredProcedure [dbo].[PR_LOC_City_SelectByPK]    Script Date: 08-06-2025 11:32:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PR_LOC_City_SelectByPK]
    @CityID INT
AS
BEGIN
    SELECT CityID, CityName, StateID, CountryID, CityCode
    FROM City
    WHERE CityID = @CityID
END