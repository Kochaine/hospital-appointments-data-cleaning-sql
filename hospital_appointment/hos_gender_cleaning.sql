-- Add and populate standardized gender column
ALTER TABLE hospital_appointments ADD COLUMN New_Gender VARCHAR(10);

UPDATE hospital_appointments 
SET New_Gender = CASE 
    WHEN LOWER(Gender) IN ('f', 'female') THEN 'Female'
    WHEN LOWER(Gender) IN ('m', 'male') THEN 'Male'
    ELSE 'Unknown'
END;

-- Verify cleaned values
SELECT DISTINCT New_Gender FROM hospital_appointments;
