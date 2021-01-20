/*
DROP PROC IF EXISTS dbo.AddTestingFacility
GO
*/

CREATE PROC dbo.AddTestingFacility

@Address VARCHAR(50),
@City VARCHAR(30),
@Postal_Code VARCHAR(6),
@Contact_Number INT

AS

INSERT INTO Testing_Facilities(Address, City, Postal_Code, Contact_Number)
VALUES(@Address, @City, @Postal_Code, @Contact_Number)

GO