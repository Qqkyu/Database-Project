USE COVID19;
GO

DROP FUNCTION IF EXISTS [dbo].[CHECK_TESTRESULT];
GO


CREATE FUNCTION CHECK_TESTRESULT (@PESEL varchar)
RETURNS Varchar
AS
-- Sprawdza czy pacjent by� testowany, a je�eli by� jaki jest wynik testu
BEGIN
	DECLARE @TST varchar;
	IF (SELECT MAX(T.Test_Date) FROM Tests T WHERE T.Refferal_ID=@PESEL) IS NULL
		SET @TST = 'Pacjent nie by� testowany'
	ELSE
		SET @TST = (SELECT TE.Result FROM Tests TE WHERE TE.Test_Date=(SELECT MAX(T.Test_Date) FROM Tests T WHERE T.Refferal_ID=@PESEL))
	RETURN @TST;
END;