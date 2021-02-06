DROP TRIGGER IF EXISTS dbo.AutoGeneratePatientsCard;

GO;       
CREATE TRIGGER dbo.AutoGeneratePatientsCard
ON Hospitalized_Patients
AFTER INSERT
AS
BEGIN
	EXEC dbo.AddPatientCard @PESEL = inserted.PESEL
END
