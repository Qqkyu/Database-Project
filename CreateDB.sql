IF DB_ID('TestDB') IS NOT NULL
  DROP DATABASE TestDB;
GO

CREATE DATABASE TestDB;
GO

USE TestDB;
GO

CREATE TABLE Hospitals
(
  Facility_Name VARCHAR(50) NOT NULL,
  City VARCHAR(30) NOT NULL,
  Region VARCHAR(30) NOT NULL,
  Address VARCHAR(50) NOT NULL,
  Contact_Number VARCHAR(20) NOT NULL,
  PRIMARY KEY (Facility_Name, City)
);
GO

CREATE TABLE Hospital_Details
(
  Available_Respirators INT NOT NULL,
  Available_Beds INT NOT NULL,
  Infections_Diseases_Hospital BIT NOT NULL,
  Facility_Name VARCHAR(50) NOT NULL,
  City VARCHAR(30) NOT NULL,
  PRIMARY KEY (Facility_Name, City),
  FOREIGN KEY (Facility_Name, City) REFERENCES Hospitals(Facility_Name, City) ON DELETE CASCADE ON UPDATE CASCADE
);
GO

CREATE TABLE Sanitary_Epidemiological_Stations
(
  Address VARCHAR(50) NOT NULL,
  Subservient_Region VARCHAR(30) NOT NULL,
  Contact_Number VARCHAR(20) NOT NULL,
  City VARCHAR(30) NOT NULL,
  Postal_Code VARCHAR(6) NOT NULL,
  PRIMARY KEY (Address, City)
);
GO

CREATE TABLE Emergency_Medical_Services
(
  Address VARCHAR(50) NOT NULL,
  City VARCHAR(30) NOT NULL,
  PRIMARY KEY (Address, City)
);
GO

CREATE TABLE EMS_Hospitals
(
  Hospital_Facility_Name VARCHAR(50) NOT NULL,
  Hospital_City VARCHAR(30) NOT NULL,
  EMS_Address VARCHAR(50) NOT NULL,
  EMS_City VARCHAR(30) NOT NULL,
  PRIMARY KEY (Hospital_Facility_Name, Hospital_City, EMS_Address, EMS_City),
  FOREIGN KEY (Hospital_Facility_Name, Hospital_City) REFERENCES Hospitals(Facility_Name, City) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (EMS_Address, EMS_City) REFERENCES Emergency_Medical_Services(Address, City) ON DELETE CASCADE ON UPDATE CASCADE
);
GO

CREATE TABLE EMS_Details
(
  Available_Ambulances INT NOT NULL,
  Available_Helicopters INT NOT NULL,
  Address VARCHAR(50) NOT NULL,
  City VARCHAR(30) NOT NULL,
  PRIMARY KEY (Address, City),
  FOREIGN KEY (Address, City) REFERENCES Emergency_Medical_Services(Address, City) ON DELETE CASCADE ON UPDATE CASCADE
);
GO

CREATE TABLE Testing_Facilities
(
  Address VARCHAR(50) NOT NULL,
  City VARCHAR(30) NOT NULL,
  Postal_Code VARCHAR(6) NOT NULL,
  Contact_Number INT NOT NULL,
  PRIMARY KEY (Address, City)
);
GO

CREATE TABLE Clinics
(
  Address VARCHAR(50) NOT NULL,
  City VARCHAR(30) NOT NULL,
  Name VARCHAR(50) NOT NULL,
  Postal_Code VARCHAR(6) NOT NULL,
  Contact_Number VARCHAR(20) NOT NULL,
  PRIMARY KEY (Address, City)
);
GO

CREATE TABLE Vaccination_Facilities
(
  Available_Vaccines INT NOT NULL,
  Address VARCHAR(50) NOT NULL,
  City VARCHAR(30) NOT NULL,
  Name VARCHAR(50) NOT NULL,
  PRIMARY KEY (Address, City)
);
GO

CREATE TABLE People
(
  Address VARCHAR(50) NOT NULL,
  PESEL VARCHAR(11) NOT NULL,
  Region VARCHAR(30) NOT NULL,
  Name VARCHAR(30) NOT NULL,
  Surname VARCHAR(30) NOT NULL,
  Date_of_Birth DATE NOT NULL,
  Telephone_number VARCHAR(20) NOT NULL,
  Postal_Code VARCHAR(6) NOT NULL,
  Clinic_Address VARCHAR(50) NOT NULL,
  Clinic_City VARCHAR(30) NOT NULL,
  PRIMARY KEY (PESEL),
  FOREIGN KEY (Clinic_Address, Clinic_City) REFERENCES Clinics(Address, City) ON DELETE CASCADE ON UPDATE CASCADE
);
GO

CREATE TABLE Quarantined_People
(
  PESEL VARCHAR(11) NOT NULL,
  Sanepid_Station_Address VARCHAR(50) NOT NULL,
  Sanepid_Station_City VARCHAR(30) NOT NULL,
  PRIMARY KEY (PESEL),
  FOREIGN KEY (PESEL) REFERENCES People(PESEL) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (Sanepid_Station_Address, Sanepid_Station_City) REFERENCES Sanitary_Epidemiological_Stations(Address, City) ON DELETE CASCADE ON UPDATE CASCADE
);
GO

CREATE TABLE Hospitalized_Patients
(
  PESEL VARCHAR(11) NOT NULL,
  Facility_Name VARCHAR(50) NOT NULL,
  City VARCHAR(30) NOT NULL,
  PRIMARY KEY (PESEL),
  FOREIGN KEY (PESEL) REFERENCES People(PESEL) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (Facility_Name, City) REFERENCES Hospitals(Facility_Name, City) ON DELETE CASCADE ON UPDATE CASCADE
);
GO

CREATE TABLE Tests
(
  Status VARCHAR(30) NOT NULL,
  Result VARCHAR(30) NOT NULL,
  Test_Date DATE NOT NULL,
  Refferal_ID INT NOT NULL,
  Testing_Facility_Address VARCHAR(50),
  Testing_Facility_City VARCHAR(30),
  Address VARCHAR(50),
  City VARCHAR(30),
  PESEL VARCHAR(11) NOT NULL,
  PRIMARY KEY (Refferal_ID),
  FOREIGN KEY (Testing_Facility_Address, Testing_Facility_City) REFERENCES Testing_Facilities(Address, City) ON DELETE SET NULL ON UPDATE CASCADE,
  FOREIGN KEY (Address, City) REFERENCES Clinics(Address, City) ON DELETE SET NULL ON UPDATE CASCADE,
  FOREIGN KEY (PESEL) REFERENCES People(PESEL) ON DELETE CASCADE ON UPDATE CASCADE
);
GO

CREATE TABLE Patient_Card
(
  Chronic_Diseases VARCHAR(100) NOT NULL,
  Blood_Type VARCHAR(10) NOT NULL,
  Condition VARCHAR(30) NOT NULL,
  PESEL VARCHAR(11) NOT NULL,
  PRIMARY KEY (PESEL),
  FOREIGN KEY (PESEL) REFERENCES Hospitalized_Patients(PESEL) ON DELETE CASCADE ON UPDATE CASCADE
);
GO

CREATE TABLE Quarantine_Details
(
  Start_Date DATE NOT NULL,
  End_Date DATE NOT NULL,
  Address VARCHAR(50) NOT NULL,
  City VARCHAR(30) NOT NULL,
  PESEL VARCHAR(11) NOT NULL,
  PRIMARY KEY (Start_Date, PESEL),
  FOREIGN KEY (PESEL) REFERENCES Quarantined_People(PESEL) ON DELETE CASCADE ON UPDATE CASCADE
);
GO

CREATE TABLE Vaccination_Details
(
  Series INT,
  Visit_Date DATE,
  Eligibility BIT NOT NULL,
  PESEL VARCHAR(11) NOT NULL,
  Vaccination_Facility_Address VARCHAR(50),
  Vaccination_Facility_City VARCHAR(30),
  PRIMARY KEY (PESEL),
  FOREIGN KEY (PESEL) REFERENCES People(PESEL) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (Vaccination_Facility_Address, Vaccination_Facility_City) REFERENCES Vaccination_Facilities(Address, City) ON DELETE SET NULL ON UPDATE CASCADE
);
GO
