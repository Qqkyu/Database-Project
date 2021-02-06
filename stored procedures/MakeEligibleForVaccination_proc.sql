/*
DROP PROC IF EXISTS dbo.MakeEligibleForVaccination
GO
*/

CREATE PROC dbo.MakeEligibleForVaccination

@PESEL VARCHAR(11)

AS

UPDATE Vaccination_Details
SET Eligibility = 1
WHERE PESEL = @PESEL

GO