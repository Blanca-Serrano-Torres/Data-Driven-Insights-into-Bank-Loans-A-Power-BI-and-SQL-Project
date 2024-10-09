--Dashboard Comparisions--

---1.Monthly Trends by Issue Date(Line Chart)---
SELECT 
   EXTRACT(MONTH FROM issue_date) AS Month_Number,
   TO_CHAR(issue_date, 'Month') AS Month_Name,
   COUNT(id) AS Total_Loan_Applications,
   SUM(loan_amount) AS Total_Funded_Amount,
   SUM(total_payment) AS Tota_Received_Amount

FROM "Bank Loan DB"
GROUP BY EXTRACT(MONTH FROM issue_date), TO_CHAR(issue_date, 'Month')
ORDER BY EXTRACT(MONTH FROM issue_date), TO_CHAR(issue_date, 'Month') 

---2.Regional Analysis by State(Filled Map)---
SELECT 
   address_state,
   COUNT(id) AS Total_Loan_Applications,
   SUM(loan_amount) AS Total_Funded_Amount,
   SUM(total_payment) AS Tota_Received_Amount

FROM "Bank Loan DB"
GROUP BY address_state
ORDER BY SUM(loan_amount) DESC

---3.Loan term Analysis(Donut Chart)---
SELECT 
   term,
   COUNT(id) AS Total_Loan_Applications,
   SUM(loan_amount) AS Total_Funded_Amount,
   SUM(total_payment) AS Tota_Received_Amount

FROM "Bank Loan DB"
GROUP BY term
ORDER BY term DESC

---4.Employee Length Analysis(Bar Chart)---
SELECT 
   emp_length,
   COUNT(id) AS Total_Loan_Applications,
   SUM(loan_amount) AS Total_Funded_Amount,
   SUM(total_payment) AS Tota_Received_Amount

FROM "Bank Loan DB"
GROUP BY emp_length
ORDER BY emp_length

---5.Loan Purpose Breakdown (Bar Chart)---
SELECT 
   purpose,
   COUNT(id) AS Total_Loan_Applications,
   SUM(loan_amount) AS Total_Funded_Amount,
   SUM(total_payment) AS Tota_Received_Amount

FROM "Bank Loan DB"
GROUP BY purpose
ORDER BY COUNT(id) DESC

---6.Home Ownership Analysis(Tree Map)---
SELECT 
   home_ownership,
   COUNT(id) AS Total_Loan_Applications,
   SUM(loan_amount) AS Total_Funded_Amount,
   SUM(total_payment) AS Tota_Received_Amount

FROM "Bank Loan DB"
GROUP BY home_ownership
ORDER BY COUNT(id) DESC