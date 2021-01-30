-- DROP TRIGGER [IF EXISTS] dbo.AutoQuarantine;
IF OBJECT_ID ('dbo.AutoQuarantine', 'TR') IS NOT NULL  
   DROP TRIGGER dbo.AutoQuarantine;
GO;   
CREATE TRIGGER dbo.AutoQuarantine
ON Tests
AFTER INSERT
AS
BEGIN
	DECLARE @TestVariable AS VARCHAR(30)
	SELECT @TestVariable = [Result] FROM inserted
	IF(@TestVariable = 'Negative')
		INSERT INTO Quarantined_People
		SELECT I.PESEL, P.Region , (SELECT TOP 1 SE.Address FROM Sanitary_Epidemiological_Stations ORDER BY NEWID()) FROM People P
		JOIN inserted I ON P.PESEL=I.PESEL
		JOIN Sanitary_Epidemiological_Stations SE ON SE.Subservient_Region=P.Region
END
