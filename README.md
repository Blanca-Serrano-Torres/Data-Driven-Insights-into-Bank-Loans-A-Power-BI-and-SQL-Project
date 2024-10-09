# Data-Driven-Insights-into-Bank-Loans-A-Power-BI-and-SQL-Project

## Project Overview
The Bank Loan Report project focuses on creating comprehensive dashboards to monitor and assess a bank's lending activities. These reports provide insights into key loan-related metrics, including loan applications, disbursements, repayments, and risk management indicators.

Note: This project is a guided project based on the tutorial from the Data Tutorials YouTube channel. You can watch the full tutorial here: Bank Loan Report Tutorial.

## SQL Queries
The project includes SQL queries for extracting and analyzing data from the bank_loan_data table. Key query categories include:

  1. KPI Calculations

  - Total loan applications (MTD, PMTD)
  - Total funded amount
  - Total amount received
  - Average interest rate
  - Average DTI

  2. Loan Performance Analysis

  - Performing loan vs. Non-Perfroming loan metrics
  - Loan status breakdown

  3. Demographic and Loan Characteristic Analysis

  - Analysis by month, state, term, employee length, purpose, and home ownership

### Key Performance Indicators (KPIs)

  - Total Loan Applications
  - Total Funded Amount
  - Total Amount Received
  - Average Interest Rate
  - Debt-to-Income (DTI) Ratio
  - Performing loan vs. Non-Perfroming Loan Percentages

### SQL Query Examples 

    -- Total Loan Applications
    SELECT COUNT(id) AS Total_Applications FROM bank_loan_data

    -- MTD Total Funded Amount
    SELECT SUM(loan_amount) AS Total_Funded_Amount 
    FROM bank_loan_data
    WHERE MONTH(issue_date) = 12

    -- Average Interest Rate
    SELECT AVG(int_rate)*100 AS Avg_Int_Rate FROM bank_loan_data

    -- Loan Status Breakdown
    SELECT
        loan_status,
        COUNT(id) AS LoanCount,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        AVG(int_rate * 100) AS Interest_Rate,
        AVG(dti * 100) AS DTI
    FROM bank_loan_data
    GROUP BY loan_status

 ## Power BI Dashboard Breakdown

 ### Key Performance Indicators (KPIs) 
 
 1. Total Loan Applications
    
    - Displays the total number of loan applications
    - Includes Month-to-Date (MTD) and Month-over-Month (MOM) comparisons

 2. Total Funded Amount

    - Shows the total amount of loans funded
    - MTD value: $54.0M
    - MOM percentage change: 13.0%

 3. Total Amount Received

    - Indicates the total payments received from borrowers
    - Overall value: $473.1M
    - MTD value: $58.1M
    - MOM percentage change: 15.8%

 4. Average Interest Rate

    - Displays the average interest rate across all loans
    - MTD value: 12.4%
    - MOM percentage change: 3.5%

5. Average DTI (Debt-to-Income Ratio)

  - Shows the average DTI ratio for borrowers
  - Current value: 13.3%
  - MOM percentage change: 13.7%

### Visualizations

 1. Total Amount Received by Month

  - Line chart showing the trend of total amount received across months
  - X-axis: Months (Jan to Dec)
  - Y-axis: Total amount received

 2. Total Funded Amount by State

  - Filled map visualization of the United States
  - Color intensity represents the total funded amount for each state

  3. Total Amount Received by Term

  - Donut chart comparing 36-month and 60-month loan terms
  - Segments represent the proportion of total amount received for each term

 4. Total Amount Received by Purpose

  - Bar chart showing total amount received categorized by loan purpose
  - X-axis: Loan purposes (e.g., debt consolidation, home improvement)
  - Y-axis: Total amount received

 5. Total Amount Received by Home Ownership

  - Tree map visualization
  - Size and color of rectangles represent the total amount received for different home ownership categories (e.g., MORTGAGE, RENT, OWN)

### Additional Features

  - Grade Filter: Allows users to filter data based on loan grades
  - Measure Selector: Enables switching between different measures (e.g., Total Amount Received, Total Funded Amount)
  - Navigation: Tabs for Summary, Overview, and Details views

### Details Dashboard
The details dashboard provides a granular view of individual loan data.

### Data Grid
Columns include:

  - Loan ID
  - Purpose
  - Home Ownership
  - Grade and Sub Grade
  - Issue Date
  - Funded Amount
  - Interest Rate
  - Installment
  - Amount Received

This comprehensive dashboard allows users to analyze loan performance from various angles, including geographical distribution, loan purposes, terms, and borrower characteristics. The interactive nature of Power BI enables users to drill down into specific data points and apply filters for more focused analysis.
