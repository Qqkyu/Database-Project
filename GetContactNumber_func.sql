DROP FUNCTION IF EXISTS [dbo].[GetContactNumber];
GO

CREATE FUNCTION GetContactNumber (@PESEL varchar)
RETURNS Varchar
AS
-- Zwraca numer do Pacjenta zadanego Peselem
BEGIN
	DECLARE @TEL varchar;
	SELECT @TEL = P.Telephone_number FROM People P WHERE @PESEL = P.PESEL
	RETURN @TEL;
END;