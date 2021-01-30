DROP FUNCTION IF EXISTS [dbo].[Check_Test_Result];
GO


CREATE FUNCTION Check_Test_Result(@PESEL varchar)
RETURNS Varchar
AS
BEGIN
	DECLARE @TST varchar;
	IF (SELECT MAX(T.Test_Date) FROM Tests T WHERE T.Refferal_ID=@PESEL) IS NULL
		SET @TST = 'Pacjent nie by³ testowany'
	ELSE
		SET @TST = (SELECT TE.Result FROM Tests TE WHERE TE.Test_Date=(SELECT MAX(T.Test_Date) FROM Tests T WHERE T.Refferal_ID=@PESEL))
	RETURN @TST;
END;
