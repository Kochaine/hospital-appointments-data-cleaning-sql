# hospital-appointments-data-cleaning-sql
SQL project demonstrating end-to-end data cleaning and preprocessing of hospital appointment records, covering missing values, date formatting, text standardization, and data normalization. 

 Hospital Appointments Data Cleaning (SQL Project)

This project showcases a comprehensive SQL-based data cleaning workflow applied to a hospital appointments dataset. The aim is to prepare raw data for analysis by handling common issues such as missing values, inconsistent formats, duplicates, and noisy text data.

 Dataset Description

The dataset simulates hospital appointment records and includes the following columns:

- Patient_ID
- Name
- Gender
- Date_of_Birth
- Appointment_Date
- Doctor_Name
- Department
- Appointment_Status
- Billing_Amount
- Phone_Number
- Address

 Objectives

- Identify and handle missing data
- Detect and remove duplicates
- Standardize categorical variables (e.g., gender, appointment status)
- Clean date fields (`Date_of_Birth`, `Appointment_Date`) with multiple formats
- Normalize billing amounts (remove currency symbols and convert to numeric)
- Clean and format phone numbers
- Clean and trim address fields

 SQL Scripts Included

| Script Name                         | Description                                                   |
|------------------------------------|---------------------------------------------------------------|
| `01_data_exploration.sql`          | Basic exploration, missing values, and duplicate check        |
| `02_gender_cleaning.sql`           | Standardize gender values                                     |
| `03_date_of_birth_cleaning.sql`    | Convert and clean multiple DOB formats                        |
| `04_appointment_date_cleaning.sql` | Normalize and clean appointment date formats                  |
| `05_status_cleaning.sql`           | Clean and standardize appointment statuses                    |
| `06_billing_amount_cleaning.sql`   | Convert and clean billing amounts                             |
| `07_phone_number_cleaning.sql`     | Remove non-digits, validate, and format phone numbers         |
| `08_address_cleaning.sql`          | Clean whitespace and commas in address fields                 |

 Tools Used

- MySQL
- SQL queries

 Final Output

A cleaned version of the `hospital_appointments` table with:

- Consistent formats for dates, gender, and status
- Numeric billing amounts
- Formatted phone numbers
- Cleaned address strings
- Backup columns retained where needed


