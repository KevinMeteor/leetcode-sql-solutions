-- SQL Server (T-SQL) Solution for Capital Gain/Loss
/* Approach 1 */
SELECT stock_name,
       SUM(
        CASE 
            WHEN operation='Buy' THEN -1.0 * price
            ELSE +1.0 * price
        END
    ) AS capital_gain_loss
FROM Stocks
GROUP BY stock_name;

/* Approach 2 */
SELECT
    stock_name,
    SUM(new_price) AS capital_gain_loss
FROM (
    SELECT stock_name, -price AS new_price
    FROM Stocks
    WHERE operation = 'Buy'
    UNION ALL
    SELECT stock_name, +price AS new_price
    FROM Stocks
    WHERE operation = 'Sell'
) AS t
GROUP BY stock_name;
