-- DROP TRIGGER [IF EXISTS] dbo.AutoGeneratePatientsCard;
IF OBJECT_ID ('AutoGeneratePatientsCard', 'TR') IS NOT NULL  
   DROP TRIGGER dbo.AutoGeneratePatientsCard0;
GO;       
CREATE TRIGGER dbo.AutoGeneratePatientsCard
ON Hospitalized_Patients
AFTER INSERT
AS
BEGIN
	EXEC dbo.AddPatientCard
END
