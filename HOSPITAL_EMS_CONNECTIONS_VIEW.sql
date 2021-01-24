USE COVID19;
GO

DROP VIEW IF EXISTS [dbo].[Hospital_EMS_Connections];
GO

CREATE VIEW [Hospital_EMS_Connections] 
AS
	SELECT H.Facility_Name,H.City,E.EMS_Address AS EMS_Address From Hospitals H
	INNER JOIN EMS_Hospitals E ON E.Hospital_Facility_Name=H.Facility_Name AND E.Hospital_City=H.City 
	INNER JOIN EMS_Details D ON D.Address = E.EMS_Address AND D.City = E.EMS_City
GO