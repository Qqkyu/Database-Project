-- DROP PROC [IF EXISTS] dbo.RemovePatient;
IF OBJECT_ID ('RemovePatient') IS NOT NULL  
   DROP PROC dbo.RemovePatient;
GO;
CREATE PROC dbo.RemovePatient
@PESEL varchar(30)
AS
BEGIN TRANSACTION
	DELETE FROM Hospitalized_Patients WHERE PESEL=@PESEL
COMMIT;