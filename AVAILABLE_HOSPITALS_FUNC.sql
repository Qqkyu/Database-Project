USE COVID19;
GO

DROP FUNCTION IF EXISTS [dbo].[AVAILABLE_HOSPITALS]; Dzia³a w SLQS2016 wzywy¿
GO

CREATE FUNCTION AVAILABLE_HOSPITALS(@PESEL varchar)
	RETURNS TABLE
	AS
	RETURN(
	SELECT H.Facility_Name,H.City,H.Address, H.Contact_Number FROM Hospitals H
	INNER JOIN People P ON H.Region=P.Region AND H.Region=P.Region
	WHERE P.PESEL=@PESEL AND dbo.AVAILABLE_BEDS(H.Address,H.City) > 0
)
GO

