DROP TRIGGER IF EXISTS dbo.AutoQuarantine;
GO;

CREATE TRIGGER dbo.AutoQuarantine
ON Tests
AFTER INSERT
AS
	DECLARE @TestVariable AS VARCHAR(30)
	SELECT @TestVariable = i.Result FROM inserted i
	IF(@TestVariable = 'Positive')
		INSERT INTO Quarantined_People
			SELECT I.PESEL, SE.Address , (SELECT TOP 1 SE.City FROM Sanitary_Epidemiological_Stations ORDER BY NEWID()) FROM People P
			JOIN inserted I ON P.PESEL=I.PESEL
			Join Sanitary_Epidemiological_Stations SE ON SE.Subservient_Region=P.Region
