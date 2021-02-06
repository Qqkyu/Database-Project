DROP VIEW IF EXISTS dbo.Patients_in_Hospital;
GO

CREATE VIEW Patients_in_Hospital AS
	SELECT H.Facility_Name, H.Address, (SELECT Count(*) FROM Hospitalized_Patients HP
	GROUP BY HP.Facility_Name
	HAVING HP.Facility_Name = H.Facility_Name) AS Patients_Per_Hospital FROM Hospitals H;
GO
