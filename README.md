# Credit and Debit Data Analysis Using SQL

This project performs comprehensive financial transaction analysis using SQL on a dataset containing credit and debit transactions across multiple banks and branches. The analysis utilizes SQL Views, KPIs, and Stored Procedures to generate automated, dynamic insights.

## Objective

The objective of this project is to analyze bank transaction data and generate insights such as:

- Total credit and debit amounts
- Net transaction performance
- Bank-wise and branch-wise comparison
- Credit-to-debit ratio
- Automated reporting with stored procedures

## Tech Stack

- MySQL
- SQL Views
- SQL Aggregations
- SQL Stored Procedures

---

# Dataset Description

The dataset consists of detailed financial transactions involving multiple banks, customers, and branches. It includes credits, debits, balances, and various transaction-related attributes.

## Dataset Structure

- Total Columns: 12  
- Total Records: 100000  

## Column Description

| Column Name          | Description |
|----------------------|-------------|
| **Customer_ID**      | Unique identifier for each customer (UUID format). |
| **Customer_Name**    | Name of the customer performing the transaction. |
| **Account_Number**   | Customer’s bank account number. |
| **Transaction_Date** | Date of the transaction in DD-MM-YYYY format. |
| **Transaction_Type** | Indicates whether the transaction is Credit or Debit. |
| **Amount**           | Transaction amount in INR. |
| **Balance**          | Account balance after the transaction. |
| **Description**      | Description or purpose of the transaction (e.g., Bonus Payment, Online Shopping). |
| **Branch**           | Bank branch from which the transaction occurred. |
| **Transaction_Method** | Method used (Credit Card, Debit Card, Bank Transfer). |
| **Currency**         | Transaction currency (INR). |
| **Bank_Name**        | Name of the bank where the transaction took place. |


---

# SQL Views and Insights

---

## 1. KPIs View

### Output Summary

| Total_Credit_Amount | Total_Debit_Amount | Credit_To_Debit_Ratio | Net_Transaction_Amount |
|---------------------|--------------------|------------------------|------------------------|
| 127.6 M             | 127.29 M           | 1.002                  | 318.12 K              |

### Insight

- Credit and debit amounts are almost equal, showing balanced transaction activity.
- A credit-to-debit ratio slightly above 1 indicates marginally higher credit volume.
- Net positive transaction value reflects healthy liquidity.

---

## 2. Bank_Comparision View

### Output Summary

| Bank_Name              | Transaction_Count | Net_Transaction_Amount |
|------------------------|-------------------|-------------------------|
| State Bank of India    | 16.71 K           | 741.43 K               |
| ICICI Bank             | 16.73 K           | 730.37 K               |
| Axis Bank              | 16.78 K           | 687.70 K               |
| Kotak Mahindra Bank    | 16.76 K           | 622.03 K               |
| HDFC Bank              | 16.39 K           | 248.91 K               |
| Punjab National Bank   | 16.64 K           | -683.14 K              |

### Insight

- SBI, ICICI, Axis, and Kotak are the top-performing banks.
- PNB shows a large negative net transaction value, indicating higher debit outflow.
- HDFC Bank shows positive but comparatively lower performance.

---

## 3. Branch_Comparision View

### Output Summary

| Branch                | Transaction_Count | Net_Transaction_Amount |
|-----------------------|-------------------|-------------------------|
| East Branch           | 16.73 K           | 1465.76 K              |
| City Center Branch    | 16.72 K           | 319.14 K               |
| Downtown Branch       | 16.63 K           | 167.30 K               |
| Main Branch           | 16.78 K           | 159.80 K               |
| North Branch          | 16.50 K           | 144.64 K               |
| Suburban Branch       | 16.65 K           | 90.68 K                |

### Insight

- East Branch is the top-performing branch by a wide margin.
- City Center and Downtown branches show steady performance.
- Suburban and North Branches need improvement.

---

## 4. Bank_Details View

### Output Summary

| Bank_Name             | Total_Credit_Amount | Total_Debit_Amount | Net_Transaction |
|----------------------|----------------------|----------------------|------------------|
| ICICI Bank           | 21.45 M             | 21.08 M             | 374.16 K         |
| Kotak Mahindra Bank  | 21.58 M             | 21.25 M             | 329.83 K         |
| State Bank of India  | 21.43 M             | 21.16 M             | 260.82 K         |
| Axis Bank            | 21.42 M             | 21.28 M             | 141.24 K         |
| HDFC Bank            | 20.99 M             | 20.88 M             | 109.25 K         |
| Punjab National Bank | 20.73 M             | 21.63 M             | -897.17 K        |

### Insight

- ICICI Bank leads overall performance.
- Kotak, SBI, and Axis also maintain good financial standings.
- PNB shows consistently poor performance and needs strategic action.

---

# Stored Procedures and Insights

## 5. Procedure: GetBankReportByName

### Example: HDFC Bank

| Bank_Name  | Total_Credit_Amount | Total_Debit_Amount | Net_Transaction |
|------------|----------------------|----------------------|------------------|
| HDFC Bank  | 20.99 M              | 20.88 M              | 109.25 K         |

### Insight

- HDFC Bank maintains stable operations but with a modest net profit.

---

## 6. Procedure: GetBankBranchReport

### Example: ICICI Bank – Main Branch

| Bank_Name  | Branch       | Total_Credit_Amount | Total_Debit_Amount | Credit_To_Debit_Ratio | Net_Transaction_Amount |
|------------|--------------|----------------------|----------------------|------------------------|-------------------------|
| ICICI Bank | Main Branch  | 3.7 M                | 3.62 M               | 1.022                  | 81.29 K                 |

### Insight

- The branch performs well but significantly below the top-performing East Branch.

---

# Overall Business Conclusions

1. Most banks show stable and balanced credit-debit activity.
2. Punjab National Bank is underperforming and needs strategic review.
3. East Branch outperforms all other branches by a large margin.
4. ICICI Bank is the strongest performer based on overall net value.
5. HDFC Bank is stable but operates on relatively thin margins.

---

# Suggestions for Improvement

## For Banks

- Punjab National Bank should review loan recovery processes and reduce debit outflow.
- HDFC Bank should increase credit inflow or optimize debit expenses.
- High-performing banks should focus on improving weaker branches.

## For Branches

- Suburban, North, and Main Branches should focus on customer acquisition and high-value accounts.
- Strategies used by East Branch can be replicated across other branches to improve performance.




