/*
DROP PROC IF EXISTS dbo.AddSanepid
GO
*/

CREATE PROC dbo.AddSanepid

@Address VARCHAR(50),
@Subservient_Region VARCHAR(30),
@Contact_Number VARCHAR(20),
@City VARCHAR(30),
@Postal_Code VARCHAR(6)

AS

INSERT Sanitary_Epidemiological_Stations(Address, Subservient_Region, Contact_Number, City, Postal_Code)
VALUES(@Address, @Subservient_Region, @Contact_Number, @City, @Postal_Code)

GO