USE COVID19;
GO

IF OBJECT_ID('dbo.ELIGIBILITY') IS NOT NULL
	DROP VIEW dbo.ELIGIBILITY;
GO

CREATE VIEW [ELIGIBILITY] AS
	SELECT Name,Surname,V.Eligibility From People P
	INNER JOIN Vaccination_Details V ON V.PESEL=P.PESEL;
GO