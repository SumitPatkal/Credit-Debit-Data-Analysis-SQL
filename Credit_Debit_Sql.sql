-- ------------------------------------------------- Kpi Cards--------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------Combined KPI Views----------------------------------------------------------------------------------------------------------

CREATE VIEW KPIs AS
SELECT 
    CONCAT(ROUND(SUM(CASE WHEN Transaction_Type = 'Credit' THEN Amount ELSE 0 END) / 1000000, 2), ' M') AS Total_Credit_Amount,
    CONCAT(ROUND(SUM(CASE WHEN Transaction_Type = 'Debit' THEN Amount ELSE 0 END) / 1000000, 2), ' M') AS Total_Debit_Amount,
    ROUND(SUM(CASE WHEN Transaction_Type = 'Credit' THEN Amount ELSE 0 END) /
        SUM(CASE WHEN Transaction_Type = 'Debit' THEN Amount ELSE 0 END), 3) AS Credit_To_Debit_Ratio,
    CONCAT(ROUND((SUM(CASE WHEN Transaction_Type = 'Credit' THEN Amount ELSE 0 END) - SUM(CASE WHEN Transaction_Type = 'Debit' THEN Amount ELSE 0 END)) / 1000, 2),' K') AS Net_Transaction_Amount
FROM credit_debit;

select * from kpis;

-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
 -- --------------------------------------------------------- Bank Wise Transactions views------------------------------------------------------------------------------------------------------
 
create view Bank_Comparision
as
select Bank_Name, 
	   concat(cast(round(count(Transaction_Method)/1000,2) as char),' K') as Transaction_Count,
	   concat(ROUND((sum(case when Transaction_Type = "Credit" then Balance else 0 end) -
		     sum( case when Transaction_Type = "Debit" then Balance else 0 end)) /1000,2), ' K') as Net_Transaction_Amount
from credit_debit
group by Bank_Name
order by Net_Transaction_Amount desc;

select * from Bank_Comparision;

-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- ---------------------------------------------------------Branch wise Transactions Views--------------------------------------------------------------------------------------------------------------------------------------------------------------- 

create view Branch_Comparision
as
select Branch, 
	   concat(cast(round(count(Transaction_Method)/1000,2) as char),' K') as Transaction_Count,
        round((sum(case when Transaction_Type = "Credit" then Balance else 0 end) -
		     sum( case when Transaction_Type = "Debit" then Balance else 0 end)) /1000,2) as Net_Transaction_Amount
from credit_debit
group by Branch
order by Net_Transaction_Amount desc;

select * from Branch_Comparision;

-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

 -- ----------------------------------------------------------------------Bank_Details Views---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 CREATE VIEW Bank_Details AS
SELECT 
    Bank_Name,
   CONCAT(ROUND(SUM(CASE WHEN Transaction_Type = 'Credit' THEN Amount ELSE 0 END) / 1000000, 2), ' M') AS Total_Credit_Amount,
    CONCAT(ROUND(SUM(CASE WHEN Transaction_Type = 'Debit' THEN Amount ELSE 0 END) / 1000000, 2), ' M') AS Total_Debit_Amount,
     CONCAT(ROUND((SUM(CASE WHEN Transaction_Type = 'Credit' THEN Amount ELSE 0 END)-SUM(CASE WHEN Transaction_Type = 'Debit' THEN Amount ELSE 0 END)) /1000,2 ),'K')  AS Net_Transaction
FROM credit_debit
GROUP BY Bank_Name
order by Net_Transaction Desc;

select * from Bank_Details; 

-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- --------------------------------------------------------- Stored procedure BankReportByName input bank name -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DELIMITER //
CREATE PROCEDURE GetBankReportByName(
    IN bank_input VARCHAR(100)
)
BEGIN
    SELECT 
        Bank_Name,
        CONCAT(ROUND(SUM(CASE WHEN Transaction_Type = 'Credit' THEN Amount ELSE 0 END) / 1000000, 2), ' M'
        ) AS Total_Credit_Amount,
        CONCAT(ROUND(SUM(CASE WHEN Transaction_Type = 'Debit' THEN Amount ELSE 0 END) / 1000000, 2), ' M') AS Total_Debit_Amount,
        CONCAT(ROUND((
                SUM(CASE WHEN Transaction_Type = 'Credit' THEN Amount ELSE 0 END) -
                SUM(CASE WHEN Transaction_Type = 'Debit' THEN Amount ELSE 0 END)) / 1000, 2), ' K') AS Net_Transaction
    FROM credit_debit
    WHERE Bank_Name = bank_input
    GROUP BY Bank_Name;
END //
DELIMITER ;

CALL GetBankReportByName('HDFC Bank');

-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- --------------------------------------------------------- Stored procudure Bank & Branch wise Report -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DELIMITER //

CREATE PROCEDURE GetBankBranchReport(
    IN bank_input VARCHAR(100),
    IN branch_input VARCHAR(100)
)
BEGIN
    SELECT Bank_Name,Branch,
    CONCAT(ROUND(SUM(CASE WHEN Transaction_Type = 'Credit' THEN Amount ELSE 0 END) / 1000000, 2), ' M') AS Total_Credit_Amount,
    CONCAT(ROUND(SUM(CASE WHEN Transaction_Type = 'Debit' THEN Amount ELSE 0 END) / 1000000, 2), ' M') AS Total_Debit_Amount,
    ROUND(SUM(CASE WHEN Transaction_Type = 'Credit' THEN Amount ELSE 0 END) / SUM(CASE WHEN Transaction_Type = 'Debit' THEN Amount ELSE 0 END), 3) AS Credit_To_Debit_Ratio,
    CONCAT(ROUND((SUM(CASE WHEN Transaction_Type = 'Credit' THEN Amount ELSE 0 END) - SUM(CASE WHEN Transaction_Type = 'Debit' THEN Amount ELSE 0 END)) / 1000, 2),' K') AS Net_Transaction_Amount
FROM credit_debit
    WHERE Bank_Name = bank_input
      AND Branch = branch_input
      Group by Bank_Name,Branch;
END //

DELIMITER ;

CALL GetBankBranchReport('ICICI Bank', 'Main Branch');
