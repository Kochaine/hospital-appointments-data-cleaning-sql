-- Clean Appointment Status
ALTER TABLE hospital_appointments ADD COLUMN appointment_statuscleaned VARCHAR(20);

UPDATE hospital_appointments 
SET appointment_statuscleaned = TRIM(UPPER(Appointment_Status))
WHERE Appointment_Status IS NOT NULL;

-- Normalize values
UPDATE hospital_appointments 
SET appointment_statuscleaned = 'ATTENDED'
WHERE appointment_statuscleaned IN ('ATTENDED', 'ATTNDED');

UPDATE hospital_appointments 
SET appointment_statuscleaned = 'CANCELED'
WHERE appointment_statuscleaned IN ('CANCELED', 'CANCELLED');

UPDATE hospital_appointments 
SET appointment_statuscleaned = 'MISSED'
WHERE appointment_statuscleaned IN ('MISSED','MISS');
