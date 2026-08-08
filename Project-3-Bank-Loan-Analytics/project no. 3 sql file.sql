CREATE DATABASE BANKING;
USE BANKING;
CREATE TABLE BANK_LOANS (
    customer_id VARCHAR(50),
    age INT,
    occupation_status VARCHAR(100),
    years_employed INT,
    annual_income decimal,
    credit_score int,
    credit_history_years INT,
    savings_assets decimal,
    current_debt decimal,
    type_of_loan VARCHAR(100),
    loan_amount decimal,
    interest_rate decimal,
    loan_status varchar(100)
);
ALTER TABLE bank_loans
ADD COLUMN loan_purpose VARCHAR(100) AFTER type_of_loan;
USE banking;

ALTER TABLE bank_loans
MODIFY COLUMN loan_status VARCHAR(20);

USE banking;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cleaned banking loan dataset final copy.csv'
INTO TABLE bank_loans
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
    customer_id,
    age,
    occupation_status,
    years_employed,
    annual_income,
    credit_score,
    credit_history_years,
    savings_assets,
    current_debt,
    type_of_loan,
    loan_purpose,
    loan_amount,
    interest_rate,
    loan_status
);

SELECT COUNT(*) AS total_records
FROM bank_loans;

SELECT *
FROM bank_loans
LIMIT 10;

USE banking;

SELECT COUNT(*) AS total_customers
FROM bank_loans;


DESCRIBE bank_loans;

SELECT COUNT(*) AS total_customers
FROM bank_loans;
SELECT SUM(loan_amount) AS total_loan_amount
FROM bank_loans;

SELECT ROUND(AVG(loan_amount), 2) AS average_loan_amount
FROM bank_loans;

SELECT ROUND(AVG(interest_rate), 2) AS average_interest_rate
FROM bank_loans;

SELECT ROUND(AVG(credit_score), 2) AS average_credit_score
FROM bank_loans;

SELECT
    loan_status,
    COUNT(*) AS total_loans
FROM bank_loans
GROUP BY loan_status;

SELECT
    loan_status,
    SUM(loan_amount) AS total_loan_amount
FROM bank_loans
GROUP BY loan_status;

SELECT
    type_of_loan,
    COUNT(*) AS total_loans
FROM bank_loans
GROUP BY type_of_loan
ORDER BY total_loans DESC;

SELECT
    type_of_loan,
    ROUND(AVG(loan_amount), 2) AS average_loan_amount
FROM bank_loans
GROUP BY type_of_loan
ORDER BY average_loan_amount DESC;

SELECT
    loan_purpose,
    COUNT(*) AS total_loans
FROM bank_loans
GROUP BY loan_purpose
ORDER BY total_loans DESC;

SELECT
    occupation_status,
    ROUND(AVG(annual_income), 2) AS average_income
FROM bank_loans
GROUP BY occupation_status
ORDER BY average_income DESC;

SELECT
    occupation_status,
    ROUND(AVG(loan_amount), 2) AS average_loan_amount
FROM bank_loans
GROUP BY occupation_status
ORDER BY average_loan_amount DESC;

SELECT
    CASE
        WHEN credit_score < 600 THEN 'Poor'
        WHEN credit_score < 700 THEN 'Fair'
        WHEN credit_score < 800 THEN 'Good'
        ELSE 'Excellent'
    END AS credit_category,
    COUNT(*) AS total_customers
FROM bank_loans
GROUP BY credit_category
ORDER BY total_customers DESC;

SELECT
    CASE
        WHEN age < 30 THEN 'Under 30'
        WHEN age < 40 THEN '30-39'
        WHEN age < 50 THEN '40-49'
        WHEN age < 60 THEN '50-59'
        ELSE '60+'
    END AS age_group,
    ROUND(AVG(loan_amount), 2) AS average_loan_amount
FROM bank_loans
GROUP BY age_group
ORDER BY average_loan_amount DESC;

SELECT
    COUNT(*) AS low_credit_customers
FROM bank_loans
WHERE credit_score < 600;

SELECT
    COUNT(*) AS high_debt_customers
FROM bank_loans
WHERE current_debt > 50000;

SELECT
    customer_id,
    loan_amount,
    type_of_loan,
    loan_status
FROM bank_loans
ORDER BY loan_amount DESC
LIMIT 10;






