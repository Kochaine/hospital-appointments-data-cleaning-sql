-- Clean appointment dates
ALTER TABLE hospital_appointments ADD COLUMN Appointment_Cleaned DATE;

UPDATE hospital_appointments
SET Appointment_Cleaned = 
    CASE
        WHEN Appointment_Date REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$' THEN STR_TO_DATE(Appointment_Date, '%Y-%m-%d')
        WHEN Appointment_Date REGEXP '^[0-9]{2}/[0-9]{2}/[0-9]{4}$' THEN STR_TO_DATE(Appointment_Date, '%d/%m/%Y')
        WHEN Appointment_Date REGEXP '^[0-9]{2}-[0-9]{2}-[0-9]{4}$' THEN STR_TO_DATE(Appointment_Date, '%d-%m-%Y')
        ELSE NULL
    END
WHERE Appointment_Cleaned IS NULL;
