/*
DROP PROC IF EXISTS dbo.AddClinic;
GO
*/

CREATE PROC dbo.AddClinic

@Address VARCHAR(50),
@City VARCHAR(30),
@Name VARCHAR(50),
@Postal_Code VARCHAR(6),
@Contact_Number VARCHAR(20)

AS

INSERT INTO Clinics(Address, City, Name, Postal_Code, Contact_Number)
VALUES(@Address, @City, @Name, @Postal_Code, @Contact_Number)

GO