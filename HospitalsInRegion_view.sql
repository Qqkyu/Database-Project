DROP VIEW IF EXISTS dbo.HospitalsInRegion;
GO

CREATE VIEW HospitalsInRegion AS
	SELECT * FROM Hospitals H ORDER BY Region DESC;
GO
