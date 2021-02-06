/*
DROP PROC IF EXISTS dbo.Quarantine
GO
*/

CREATE PROC dbo.Quarantine

@Start_Date DATE,
@End_Date DATE,
@Address VARCHAR(50),
@City VARCHAR(30),
@PESEL VARCHAR(11),
@Sanepid_Station_Address VARCHAR(50),
@Sanepid_Station_City VARCHAR(30)

AS

INSERT Quarantined_People(PESEL, Sanepid_Station_Address, Sanepid_Station_City)
VALUES(@PESEL, @Sanepid_Station_Address, @Sanepid_Station_City)

INSERT Quarantine_Details(Start_Date, End_Date, Address, City, PESEL)
VALUES(@Start_Date, @End_Date, @Address, @City, @PESEL)

GO