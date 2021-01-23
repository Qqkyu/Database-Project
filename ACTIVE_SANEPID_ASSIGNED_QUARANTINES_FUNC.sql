USE COVID19;
GO

DROP FUNCTION IF EXISTS [dbo].[ACTIVE_SANEPID_ASSIGNED_QUARANTINES]; Dzia�a w SLQS2016 wzywy�
GO

CREATE FUNCTION ACTIVE_SANEPID_ASSIGNED_QUARANTINES (@SNPD_A varchar,@SNPD_C varchar)
RETURNS TABLE
AS
-- Funkcja zwraca wszystkie bierz�ce kwarantanny zarz�dzone przez dan� jednostk� sanepidu
RETURN(
	SELECT QD.PESEL,QD.Start_Date,QD.End_Date FROM Sanitary_Epidemiological_Stations T
	JOIN Quarantined_People QP ON T.Address=QP.Sanepid_Station_Address AND T.City=QP.Sanepid_Station_City
	JOIN Quarantine_Details QD ON QP.PESEL=QD.PESEL
	WHERE T.Address = @SNPD_A AND T.City = @SNPD_C AND QD.End_Date<GETDATE()
)
GO