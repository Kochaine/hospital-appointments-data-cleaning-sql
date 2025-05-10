-- Clean Address column
ALTER TABLE hospital_appointments ADD COLUMN cleaned_address VARCHAR(250); 

UPDATE hospital_appointments 
SET cleaned_address = TRIM(REPLACE(REPLACE(Address, '  ', ' '), ',', ''));
