CREATE TRIGGER dbo.AutoCreateQuarantineDetails
ON Quarantined_People
AFTER INSERT
AS
BEGIN
	INSERT INTO Quarantine_Details
	SELECT GETDATE(), DATEADD(week,2,GETDATE()),P.Address , P.Clinic_City,QP.PESEL FROM inserted QP
	JOIN People P ON QP.PESEL=P.PESEL
END
