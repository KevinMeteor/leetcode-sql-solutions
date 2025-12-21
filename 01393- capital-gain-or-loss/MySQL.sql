-- MySQL Solution for Capital Gain/Loss

/* Approach 1 */
SELECT stock_name,
       SUM(IF(operation='Buy', -1.0 * price, +1.0 * price)) AS capital_gain_loss
FROM Stocks
GROUP BY stock_name


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
