-- Clean Billing Amounts
ALTER TABLE hospital_appointments ADD COLUMN Billing_Amount_New DECIMAL(10, 2);

UPDATE hospital_appointments
SET Billing_Amount_New = CAST(REPLACE(REPLACE(Billing_Amount, '$', ''), ',', '') AS DECIMAL(10, 2))
WHERE Billing_Amount NOT IN ('N/A') AND Billing_Amount REGEXP '^[\\$]?[0-9,.]+$';

UPDATE hospital_appointments 
SET Billing_Amount_New = 0
WHERE Billing_Amount_New IS NULL;
