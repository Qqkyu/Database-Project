/*
DROP PROC IF EXISTS dbo.AddPatient;
GO
*/

CREATE PROC dbo.AddPatient

@PESEL VARCHAR(11)

AS

INSERT INTO dbo.Hospitalized_Patients(PESEL, Facility_Name, City)
SELECT TOP 1 @PESEL, H.Facility_Name, H.City FROM dbo.AVAILABLE_HOSPITALS(@PESEL) H 
WHERE Available_Beds > 0
ORDER BY NEWID()
GO
