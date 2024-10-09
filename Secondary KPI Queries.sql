--Secondary KPI Queries--
SELECT loan_status from "Bank Loan DB"

--PERFORMING LOANS--
---1. Performing_loan_percentage---
SELECT 
   (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END)*100)
   /
   COUNT(id) AS Performing_Loan_percentage
FROM "Bank Loan DB"

---2. Performing_loan---
SELECT COUNT (id) AS Performing_Loan_Applications FROM "Bank Loan DB"
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

---3.Performing_Loan_Funded_Amount---
SELECT SUM(loan_amount) AS Performing_Loan_Funded_Amount FROM "Bank Loan DB"
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

---4.Performing_Loan_Total_Received_Amount---
SELECT SUM(total_payment) AS Performing_Loan_Total_Received_Amount FROM "Bank Loan DB"
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

--NON-PERFORMING LOANS (NPLs)--
---1. Non_Performing_loan_percentage---
SELECT 
  (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END)*100)
  /
  COUNT(id) AS Non_Performing_Loan_Percentage 
FROM "Bank Loan DB"

---2. Non_Performing_loan---
SELECT COUNT(id) AS Non_Performing_loan FROM "Bank Loan DB"
WHERE loan_status = 'Charged Off'

---3.Non_Performing_Loan_Funded_Amount---
SELECT SUM(loan_amount) AS Non_Performing_Loan_Funded_Amount FROM "Bank Loan DB"
WHERE loan_status = 'Charged Off' 

---4.Non_Performing_Loan_Total_Received_Amount---
SELECT SUM(total_payment) AS Non_Performing_Loan_Total_Received_Amount FROM "Bank Loan DB"
WHERE loan_status = 'Charged Off'

--LOAN STATUS--
SELECT 
    loan_status,
	COUNT(id) AS Total_Loan_Applications,
	SUM(total_payment) AS Total_Amount_Received,
	SUM(loan_amount) AS Total_Funded_Amount,
	AVG(int_rate * 100) AS Interest_Rate,
	AVG(dti*100) AS DTI
 FROM 
    "Bank Loan DB"
 GROUP BY 
     loan_status

SELECT 
     loan_status,
	 SUM(total_payment) AS MTD_Total_Amount_received,
	 SUM(loan_amount) AS MTD_Total_Funded_Amount

  FROM 
  "Bank Loan DB"
  WHERE
  EXTRACT(MONTH FROM issue_date) = 12
  GROUP BY loan_status