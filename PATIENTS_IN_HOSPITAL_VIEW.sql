USE COVID19;
GO

DROP VIEW IF EXISTS [dbo].[Patients_in_Hospital];
GO

CREATE VIEW [Patients_in_Hospital] AS
	SELECT H.Facility_Name , H.Address ,(SELECT Count(*) FROM Hospitalized_Patients HP
	GROUP BY  HP.Facility_Name
	HAVING HP.Facility_Name=H.Facility_Name) AS PATIENTS_PER_HOSPITAL  FROM  Hospitals H;
GO