DROP VIEW IF EXISTS dbo.Eligibility;
GO

CREATE VIEW Eligibility AS
	SELECT Name, Surname, V.Eligibility From People P
	INNER JOIN Vaccination_Details V ON V.PESEL = P.PESEL;
GO
