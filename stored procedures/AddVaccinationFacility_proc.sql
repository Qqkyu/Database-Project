/*
DROP PROC IF EXISTS dbo.AddVaccinationFacility;
GO
*/

CREATE PROC dbo.AddVaccinationFacility

@Available_Vaccines INT,
@Address VARCHAR(50),
@City VARCHAR(30),
@Name VARCHAR(50)

AS

INSERT INTO Vaccination_Facilities(Available_Vaccines, Address, City, Name)
VALUES(@Available_Vaccines, @Address, @City, @Name)

GO