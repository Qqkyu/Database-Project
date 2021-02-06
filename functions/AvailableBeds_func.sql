DROP FUNCTION IF EXISTS [dbo].[Available_Beds];
GO

CREATE FUNCTION Available_Beds(@HSPN varchar,@HSPC varchar)
RETURNS int
AS
BEGIN
	DECLARE @BDS int;
	SET @BDS = (SELECT HD.Available_Beds FROM Hospital_Details HD WHERE HD.Facility_Name=@HSPN AND HD.City=@HSPC)
	RETURN @BDS;
END;
