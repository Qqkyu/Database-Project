/*
DROP PROC IF EXISTS dbo.AddPerson;
GO
*/

CREATE PROC dbo.AddPerson

@Address VARCHAR(50),
@PESEL VARCHAR(11),
@Region VARCHAR(30),
@Name VARCHAR(30),
@Surname VARCHAR(30),
@Date_of_Birth DATE,
@Telephone_number VARCHAR(20),
@Postal_Code VARCHAR(6),
@Clinic_Address VARCHAR(50),
@Clinic_City VARCHAR(30)

AS

INSERT INTO People(Address, PESEL, Region, Name, Surname, Date_of_Birth, Telephone_number, Postal_Code, Clinic_Address, Clinic_City)
VALUES(@Address, @PESEL, @Region, @Name, @Surname, @Date_of_Birth, @Telephone_number, @Postal_Code, @Clinic_Address, @Clinic_City)

GO