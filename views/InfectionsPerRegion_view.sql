DROP VIEW IF EXISTS dbo.Infections_Per_Region;
GO

CREATE VIEW Infections_Per_Region AS
	SELECT DISTINCT P.Region, (SELECT DISTINCT COUNT(T.PESEL) FROM Tests T 
		GROUP BY T.Result HAVING T.Result='Positive') Infections FROM People P;
GO
