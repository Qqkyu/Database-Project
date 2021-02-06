/*
DROP PROC IF EXISTS dbo.AddPatientCard;
GO
*/

CREATE PROC dbo.AddPatientCard

@Chronic_Diseases VARCHAR(100),
@Blood_Type VARCHAR(10),
@Condition VARCHAR(30),
@PESEL VARCHAR(11)

AS

INSERT INTO Patients_Card(Chronic_Diseases, Blood_Type, Condition, PESEL)
VALUES(@Chronic_Diseases, @Blood_Type, @Condition, @PESEL)

GO