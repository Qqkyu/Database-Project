CREATE TRIGGER dbo.AutoCreateQuarantineDetails
ON Quarantined_People
AFTER INSERT
AS
BEGIN
	INSERT INTO Quarantine_Details
	SELECT GETDATE(), QP.PESEL , CAST(DATEADD(week,2,GETDATE())as DATE),P.Address , P.Clinic_City FROM inserted QP
	JOIN People P ON QP.PESEL=P.PESEL
END