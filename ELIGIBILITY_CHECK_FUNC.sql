USE COVID19;
GO

IF OBJECT_ID('dbo.ELIGIBILITY_CHECK') IS NOT NULL
	DROP FUNCTION dbo.ELIGIBILITY_CHECK
GO

CREATE FUNCTION ELIGIBILITY_CHECK (@PESEL varchar)
RETURNS BIT
AS
-- Checks patient's eligibility for the covid vaccine
BEGIN
	DECLARE @el bit;
	SELECT @el = v.Eligibility FROM Vaccination_Details v
	WHERE v.PESEL=@PESEL
		IF (@el IS NULL)
		SET @el = 0
	RETURN @el;
END;