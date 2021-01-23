USE COVID19;
GO

DROP VIEW IF EXISTS [dbo].[INFECTIONS_PER_REGION]; Dzia�a w SLQS2016 wzywy�
GO

CREATE VIEW [INFECTIONS_PER_REGION] AS
	SELECT DISTINCT P.Region, (SELECT DISTINCT COUNT(T.PESEL) FROM Tests T 
								GROUP BY T.Result HAVING T.Result='Positive') Infections FROM People P
;
GO