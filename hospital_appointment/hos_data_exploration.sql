-- View first 10 rows
SELECT * FROM hospital_appointments LIMIT 10;

-- Check for missing values
SELECT 
    SUM(Name IS NULL) AS missing_name, 
    SUM(Gender IS NULL) AS missing_gender,
    SUM(Date_of_Birth IS NULL) AS missing_birth,
    SUM(Appointment_Date IS NULL) AS missing_Appointmentdate,
    SUM(Doctor_Name IS NULL) AS missing_DoctorName,
    SUM(Department IS NULL) AS missing_dept,
    SUM(Appointment_Status IS NULL) AS missing_Appointment_Status,
    SUM(Billing_Amount IS NULL) AS missing_Billing_Amount,
    SUM(Phone_Number IS NULL) AS missing_Phone_Number, 
    SUM(Address IS NULL) AS missing_address
FROM hospital_appointments;

-- Check for duplicate entries
SELECT 
    Patient_ID, Name, Gender, Date_of_Birth, Appointment_Date, Doctor_Name, 
    COUNT(*) AS duplicates 
FROM hospital_appointments 
GROUP BY Patient_ID, Name, Gender, Date_of_Birth, Appointment_Date, Doctor_Name 
HAVING COUNT(*) > 1;
