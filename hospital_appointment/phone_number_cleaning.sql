-- Clean and format phone numbers
ALTER TABLE hospital_appointments ADD COLUMN new_phonenumber VARCHAR(20); 

UPDATE hospital_appointments 
SET new_phonenumber = REGEXP_REPLACE(Phone_Number, '[^0-9]', '');

UPDATE hospital_appointments 
SET new_phonenumber = NULL 
WHERE LENGTH(new_phonenumber) > 15;

ALTER TABLE hospital_appointments ADD COLUMN Phone_Formatted VARCHAR(30);

UPDATE hospital_appointments
SET Phone_Formatted = 
  CASE 
    WHEN LENGTH(new_phonenumber) = 10 THEN CONCAT('+44 ', new_phonenumber)
    WHEN LENGTH(new_phonenumber) BETWEEN 11 AND 15 THEN CONCAT('+', new_phonenumber)
    ELSE NULL
  END
WHERE new_phonenumber IS NOT NULL;
