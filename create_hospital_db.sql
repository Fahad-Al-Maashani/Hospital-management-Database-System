-- Simple sql code for hospital management database system for patients. 
-- Drop existing tables if they exist
DROP TABLE IF EXISTS MedicalRecords;
DROP TABLE IF EXISTS Appointments;
DROP TABLE IF EXISTS Doctors;
DROP TABLE IF EXISTS Patients;

-- Create Patients table
CREATE TABLE IF NOT EXISTS Patients (
    PatientID INT PRIMARY KEY,
    Name VARCHAR(100),
    DateOfBirth DATE,
    ContactInfo VARCHAR(150)
);

-- Create Doctors table
CREATE TABLE IF NOT EXISTS Doctors (
    DoctorID INT PRIMARY KEY,
    Name VARCHAR(100),
    Specialty VARCHAR(50),
    ContactInfo VARCHAR(150)
);

-- Create Appointments table
CREATE TABLE IF NOT EXISTS Appointments (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATETIME,
    Reason VARCHAR(255),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- Create MedicalRecords table
CREATE TABLE IF NOT EXISTS MedicalRecords (
    RecordID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    VisitDate DATETIME,
    Diagnosis VARCHAR(255),
    Treatment VARCHAR(255),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- Insert sample data into Patients table
INSERT INTO Patients (PatientID, Name, DateOfBirth, ContactInfo)
VALUES (1, 'John Doe', '1990-05-15', 'john.doe@example.com'),
       (2, 'Jane Smith', '1985-03-22', 'jane.smith@example.com');

-- Insert sample data into Doctors table
INSERT INTO Doctors (DoctorID, Name, Specialty, ContactInfo)
VALUES (1, 'Dr. Alice Johnson', 'Cardiology', 'alice.johnson@hospital.com'),
       (2, 'Dr. Bob Brown', 'Neurology', 'bob.brown@hospital.com');

-- Insert sample data into Appointments table
INSERT INTO Appointments (AppointmentID, PatientID, DoctorID, AppointmentDate, Reason)
VALUES (1, 1, 1, '2024-12-15 10:00:00', 'Routine Checkup'),
       (2, 2, 2, '2024-12-16 14:00:00', 'Headache');

-- Insert sample data into MedicalRecords table
INSERT INTO MedicalRecords (RecordID, PatientID, DoctorID, VisitDate, Diagnosis, Treatment)
VALUES (1, 1, 1, '2024-12-15 10:30:00', 'Healthy', 'No Treatment Needed'),
       (2, 2, 2, '2024-12-16 14:30:00', 'Migraine', 'Pain Relief Medication');

-- Select data from Patients table
SELECT * FROM Patients;

-- Select appointments for a specific patient
SELECT * FROM Appointments WHERE PatientID = 1;

-- Select medical records for a specific doctor
SELECT * FROM MedicalRecords WHERE DoctorID = 2;
