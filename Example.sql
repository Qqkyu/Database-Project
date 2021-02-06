INSERT INTO Clinics VALUES ('testowa 12','Białystok','Klinika1','42-450','512342121')
DELETE FROM People WHERE People.Address='Białystok'
INSERT INTO People VALUES ('Białystok','00303001594','Podlesie','Maciej','Trapez','1997-03-12','134125123','41-340','testowa 12','Białystok'),
 ('Białystok','12321094512','Podlesie','Marek','Towarek','1997-10-30','75425123','41-340','testowa 12','Białystok'),
 ('Białystok','01235432341','Podlesie','Michał','Żbik','1967-12-12','210682123','41-340','testowa 12','Białystok'),
 ('Białystok','32985314123','Podlesie','Miłosz','Taczka','1915-06-30','59315632','41-340','testowa 12','Białystok')
INSERT INTO Hospitals VALUES ('Szpital Zakazny','Białystok','Losowa 15','123123123')
INSERT INTO Hospital_Details VALUES(50,50,'TRUE','Szpital Zakazny','Białystok')
INSERT INTO Hospitals VALUES ('Szpital Dzieciecy','Kraków','Janna 15','1412341233')
INSERT INTO Hospital_Details VALUES(40,10,'FALSE','Szpital Dzieciecy','Kraków')
INSERT INTO Testing_Facilities VALUES ('Świętej Anny 12','Białystok','43-312',12312312)
INSERT INTO Sanitary_Epidemiological_Stations VALUES ('Lokalna 5','Podlesie',1231421,'Białystok','41-350')
DELETE FROM Tests WHERE Tests.Refferal_ID = 12
INSERT INTO Tests VALUES ('Done','Positive','2020-12-14',12,'Świętej Anny 12','Białystok','testowa 12','Białystok','00303001594')
--Funkcja zwraca szpitale do ktorych moze zostac przyjety nasz pacjent o danym kodzie PESEL
SELECT * FROM dbo.AVAILABLE_HOSPITALS(12321094512)
-- Widok zwraca tabelę z ilością zakażonych(pozytywnych testów) w każdym województwie
SELECT * FROM INFECTIONS_PER_REGION
-- Widok zwraca tabelę z wszystkimi szpitalami oraz ich aktualnym stanem respiratorów i wolnych łóżek
SELECT * FROM HospitalsInRegion
-- Widok zwraca tabelę z poszczególnymi jednostkami pogotowia przypisanymi do odpowiednich szpitali
SELECT * FROM Hospital_EMS_Connections
-- Widok zwraca tabelę z informacjami o zakwalifikowaniu się każdego zarejerstrowanego pacjenta do szczepienia
SELECT * FROM ELIGIBILITY
-- Procedura przyjmuje pacjenta do wolnych szpitali w jego rejonie przy użyciu jego kodu PESEL
 EXEC AddPatient(12321094512)


 SELECT * FROM Hospital_Details
 SELECT * FROM Hospitals
 SELECT * FROM People
 SELECT * FROM Testing_Facilities
 SELECT * FROM Tests
 SELECT * FROM Quarantined_People
 SELECT * FROM Quarantine_Details
