/*
DROP PROC IF EXISTS dbo.AddVaccination;
GO
*/

CREATE PROC dbo.AddVaccination

@Series INT,
@Visit_Date DATE,
@Eligibility BIT,
@PESEL VARCHAR(11),
@Vaccination_Facility_Address VARCHAR(50),
@Vaccination_Facility_City VARCHAR(30)

AS

INSERT INTO Vaccination_Details(Series, Visit_Date, Eligibility, PESEL, Vaccination_Facility_Address, Vaccination_Facility_City)
VALUES(@Series, @Visit_Date, @Eligibility, @PESEL, @Vaccination_Facility_Address, @Vaccination_Facility_City)

GO