-- Create database
:r <path>/Database-Project/CreateDB.sql
GO

-- Create functions
:r <path>/Database-Project/functions/ActiveSanepidQuarantines.sql
:r <path>/Database-Project/functions/AvailableBeds.sql
:r <path>/Database-Project/functions/AvailableHospitals.sql
:r <path>/Database-Project/functions/CheckTestResult.sql
:r <path>/Database-Project/functions/GetContactNumber.sql
GO

-- Create stored procedures
:r <path>/Database-Project/stored procedures/AddClinic.sql
:r <path>/Database-Project/stored procedures/AddPatient.sql
:r <path>/Database-Project/stored procedures/AddPatientCard.sql
:r <path>/Database-Project/stored procedures/AddPerson.sql
:r <path>/Database-Project/stored procedures/AddSanepid.sql
:r <path>/Database-Project/stored procedures/AddTestingFacility.sql
:r <path>/Database-Project/stored procedures/AddVaccinationFacility.sql
:r <path>/Database-Project/stored procedures/BackupDatabase.sql
:r <path>/Database-Project/stored procedures/DischargePatient.sql
:r <path>/Database-Project/stored procedures/MakeEligibleForVaccination.sql
:r <path>/Database-Project/stored procedures/Quarantine.sql
GO

-- Create triggers
:r <path>/Database-Project/triggers/AutoCreateQuarantineDetails.sql
:r <path>/Database-Project/triggers/AutoGeneratePatientsCard.sql
:r <path>/Database-Project/triggers/AutoQuarantine.sql
:r <path>/Database-Project/triggers/MakeBedAvailable.sql
:r <path>/Database-Project/triggers/Occupybed.sql
GO

-- Create views
:r <path>/Database-Project/views/Eligibility.sql
:r <path>/Database-Project/views/HospitalsEMSConnections.sql
:r <path>/Database-Project/views/HospitalsInRegion.sql
:r <path>/Database-Project/views/InfectionsPerRegion.sql
:r <path>/Database-Project/views/PatientsInHospital.sql
GO
