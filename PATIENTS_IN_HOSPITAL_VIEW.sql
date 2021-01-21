USE COVID19;
GO

IF OBJECT_ID('Patients_in_Hospital') IS NOT NULL
	DROP VIEW Patients_in_Hospital;
GO

CREATE VIEW [Patients_in_Hospital] AS
	SELECT H.Facility_Name , H.Address ,(SELECT Count(*) FROM Hospitalized_Patients HP
	GROUP BY  HP.Facility_Name
	HAVING HP.Facility_Name=H.Facility_Name) AS PATIENTS_PER_HOSPITAL  FROM  Hospitals H;
GO