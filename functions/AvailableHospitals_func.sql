DROP FUNCTION IF EXISTS [dbo].[Available_Hospitals]; 
GO

CREATE FUNCTION Available_Hospitals(@PESEL varchar)
	RETURNS TABLE
	AS
	RETURN(
	SELECT H.Facility_Name,H.City,H.Address, H.Contact_Number FROM Hospitals H
	INNER JOIN People P ON H.Region=P.Region AND H.Region=P.Region
	WHERE P.PESEL=@PESEL AND dbo.AVAILABLE_BEDS(H.Address,H.City) > 0
)
GO
