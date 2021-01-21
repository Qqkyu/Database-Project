USE COVID19;
GO

IF OBJECT_ID('dbo.AVAILABLE_BEDS') IS NOT NULL
	DROP FUNCTION dbo.AVAILABLE_BEDS
GO

CREATE FUNCTION AVAILABLE_BEDS (@HSPN varchar,@HSPC varchar)
RETURNS int
AS
-- Zwraca iloœæ dostêpnych ³ó¿ek dla danego szpitala, wykorzystywana przy PLACE_PATIENT
BEGIN
	DECLARE @BDS int;
	SET @BDS = (SELECT HD.Available_Beds FROM Hospital_Details HD WHERE HD.Facility_Name=@HSPN AND HD.City=@HSPC)
	RETURN @BDS;
END;