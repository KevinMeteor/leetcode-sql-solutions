-- SQL Server (T-SQL) Solution for Monthly Transactions I
/* Approach 1 */
SELECT 
    CONVERT(char(7), trans_date) AS month,
    country,
    count(*) AS trans_count,
    SUM(
        CASE 
            WHEN state='approved' THEN 1.0
            ELSE 0.0
        END
    ) AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(
        CASE 
            WHEN state='approved' THEN amount
            ELSE 0.0
        END
    ) AS approved_total_amount
FROM Transactions
GROUP BY CONVERT(char(7), trans_date), country;


