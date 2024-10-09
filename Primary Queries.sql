--1.Total Loan Applications--
SELECT COUNT(id) AS 
Total_Loan_Applications 
FROM "Bank Loan DB";

SELECT COUNT(id)  AS 
PMTD_Total_Loan_Applications 
FROM "Bank Loan DB"
WHERE EXTRACT(MONTH FROM 
issue_date) = 11;

SELECT COUNT(id)  AS 
MTD_Total_Loan_Applications 
FROM "Bank Loan DB"
WHERE EXTRACT(MONTH FROM 
issue_date) = 12;

--MoM(Mont-over-Month)metric--
--(MTD-PMTD)/PMTD--

WITH PMTD AS (
    SELECT COUNT(id) AS PMTD_Total_Loan_Applications
    FROM "Bank Loan DB"
    WHERE EXTRACT(MONTH FROM issue_date) = 11
),
MTD AS (
    SELECT COUNT(id) AS MTD_Total_Loan_Applications
    FROM "Bank Loan DB"
    WHERE EXTRACT(MONTH FROM issue_date) = 12
)
SELECT 
    (MTD.MTD_Total_Loan_Applications - PMTD.PMTD_Total_Loan_Applications) / PMTD.PMTD_Total_Loan_Applications::float AS Metric
FROM 
    MTD, PMTD;
	
--2.Total Funded Amount--
SELECT SUM(loan_amount) AS 
Total_Funded_Amount 
FROM "Bank Loan DB";

---PMTD---
SELECT SUM(loan_amount) AS 
PMTD_Total_Funded_Amount 
FROM "Bank Loan DB"
WHERE EXTRACT(MONTH FROM issue_date) = 11;

---MTD---
SELECT SUM(loan_amount) AS 
MTD_Total_Funded_Amount 
FROM "Bank Loan DB"
WHERE EXTRACT(MONTH FROM issue_date) = 12;

--3.Total Amount Received--
SELECT SUM(total_payment)AS
Total_Amount_Received 
FROM "Bank Loan DB";

---PMTD---
SELECT SUM(total_payment)AS
MTD_Total_Amount_Received 
FROM "Bank Loan DB"
WHERE EXTRACT(MONTH FROM issue_date) = 11;

---MTD---
SELECT SUM(total_payment)AS
MTD_Total_Amount_Received 
FROM "Bank Loan DB"
WHERE EXTRACT(MONTH FROM issue_date) = 12;

--4.Average Interest Rate--
SELECT ROUND(CAST(AVG(int_rate) AS NUMERIC),4) *100 AS
Average_Interest_Rate 
FROM "Bank Loan DB";

---PMTD---
SELECT ROUND(CAST(AVG(int_rate) AS NUMERIC), 4) *100 AS
PMTD_Average_Interest_Rate 
FROM "Bank Loan DB"
WHERE EXTRACT(MONTH FROM issue_date) = 11;

---MTD---
SELECT ROUND(CAST(AVG(int_rate)AS NUMERIC), 4) * 100 AS
MTD_Average_Interest_Rate 
FROM "Bank Loan DB"
WHERE EXTRACT(MONTH FROM issue_date) = 12;

--5.Average Debt-to-Income Ratio--
SELECT ROUND(CAST(AVG(dti)AS NUMERIC), 4) * 100 AS
Average_Debt_To_Income_Ratio
FROM "Bank Loan DB";

---PMTD---
SELECT ROUND(CAST(AVG(dti)AS NUMERIC), 4) * 100 AS
PMTD_Average_Debt_To_Income_Ratio
FROM "Bank Loan DB"
WHERE EXTRACT(MONTH FROM issue_date) = 11;

---MTD---
SELECT ROUND(CAST(AVG(dti)AS NUMERIC), 4) * 100 AS
MTD_Average_Debt_To_Income_Ratio
FROM "Bank Loan DB"
WHERE EXTRACT(MONTH FROM issue_date) = 12;

