-- DROP TRIGGER [IF EXISTS] dbo.OccupyBed;
IF OBJECT_ID ('OccupyBed', 'TR') IS NOT NULL  
   DROP TRIGGER dbo.OccupyBed;
GO;       
CREATE TRIGGER dbo.OccupyBed
ON Hospitalized_Patients
AFTER INSERT
AS
BEGIN
	DECLARE @Fac_name AS varchar(30)
	Declare @Fac_city AS varchar(30)
	SELECT @Fac_name = [Facility_Name] FROM inserted
	SELECT @Fac_city = [City] FROM inserted
	UPDATE Hospital_Details
	SET Available_Beds=Available_Beds-1
	WHERE Facility_Name=@Fac_city AND City=@Fac_city
END
