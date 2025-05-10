-- Backup and clean DOB
ALTER TABLE hospital_appointments ADD COLUMN date_of_birth_bup VARCHAR(50);
UPDATE hospital_appointments SET date_of_birth_bup = Date_of_Birth;

ALTER TABLE hospital_appointments ADD COLUMN DOB_cleaned DATE;

-- Convert multiple DOB formats
UPDATE hospital_appointments 
SET DOB_cleaned = STR_TO_DATE(Date_of_Birth, '%d/%m/%Y') 
WHERE Date_of_Birth REGEXP '^[0-9]{2}/[0-9]{2}/[0-9]{4}$';

UPDATE hospital_appointments 
SET DOB_cleaned = STR_TO_DATE(Date_of_Birth, '%m/%d/%Y') 
WHERE Date_of_Birth REGEXP '^[0-9]{2}/[0-9]{2}/[0-9]{4}$' AND DOB_cleaned IS NULL;

UPDATE hospital_appointments
SET DOB_cleaned = 
    CASE
        WHEN Date_of_Birth REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$' THEN Date_of_Birth
        WHEN Date_of_Birth REGEXP '^[0-9]{2}-[0-9]{2}-[0-9]{4}$' THEN STR_TO_DATE(Date_of_Birth, '%m-%d-%Y')
        ELSE NULL
    END
WHERE DOB_cleaned IS NULL;
