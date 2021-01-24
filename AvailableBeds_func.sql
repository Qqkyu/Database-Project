USE COVID19;
GO

DROP FUNCTION IF EXISTS [dbo].[AVAILABLE_BEDS]; Dzia�a w SLQS2016 wzywy�
GO

CREATE FUNCTION AVAILABLE_BEDS (@HSPN varchar,@HSPC varchar)
RETURNS int
AS
-- Zwraca ilo�� dost�pnych ��ek dla danego szpitala, wykorzystywana przy PLACE_PATIENT
BEGIN
	DECLARE @BDS int;
	SET @BDS = (SELECT HD.Available_Beds FROM Hospital_Details HD WHERE HD.Facility_Name=@HSPN AND HD.City=@HSPC)
	RETURN @BDS;
END;