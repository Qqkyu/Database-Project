DROP VIEW IF EXISTS dbo.HospitalsInRegion;
GO

CREATE VIEW HospitalsInRegion AS
	SELECT H.Facility_Name , H.Address , HD.Available_Beds , Hd.Available_Respirators ,HD.Infections_Diseases_Hospital FROM Hospitals H
	JOIN Hospital_Details HD ON HD.Facility_Name = H.Facility_Name 
	ORDER BY H.Region DESC;
GO
