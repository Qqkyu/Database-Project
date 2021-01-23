USE COVID19;
GO

DROP VIEW IF EXISTS [dbo].[ELIGIBILITY]; Dzia³a w SLQS2016 wzywy¿
GO

CREATE VIEW [ELIGIBILITY] AS
	SELECT Name,Surname,V.Eligibility From People P
	INNER JOIN Vaccination_Details V ON V.PESEL=P.PESEL;
GO