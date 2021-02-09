/*
DROP PROC IF EXISTS dbo.DischargePatient;
GO
*/

CREATE PROC dbo.DischargePatient

@PESEL VARCHAR(11)

AS

BEGIN TRANSACTION
	DELETE FROM Hospitalized_Patients WHERE PESEL = @PESEL
COMMIT;