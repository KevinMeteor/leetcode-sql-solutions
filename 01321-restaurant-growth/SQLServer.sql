-- SQL Server (T-SQL) Solution for Restaurant Growth
Approach 1: Self JOIN (SQL Server)

WITH daily AS (
    SELECT
        visited_on,
        SUM(amount) AS daily_amount
    FROM Customer
    GROUP BY visited_on
)
SELECT
    d1.visited_on,
    SUM(d2.daily_amount) AS amount,
    ROUND(SUM(d2.daily_amount) / 7.0, 2) AS average_amount
FROM daily d1
JOIN daily d2
  ON d2.visited_on BETWEEN DATEADD(DAY, -6, d1.visited_on)
                       AND d1.visited_on
GROUP BY d1.visited_on
HAVING COUNT(*) = 7
ORDER BY d1.visited_on;


-- Approach 3: Window Function (ROWS-based) - SQL Server

WITH daily AS (
    SELECT
        visited_on,
        SUM(amount) AS daily_amount
    FROM Customer
    GROUP BY visited_on
),
w AS (
    SELECT
        visited_on,
        SUM(daily_amount) OVER (
            ORDER BY visited_on
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS amount,
        CAST(
            ROUND(
                AVG(CAST(daily_amount AS decimal(10,2))) OVER (
                    ORDER BY visited_on
                    ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
                ),
                2
            ) AS decimal(10,2)
        ) AS average_amount,
        ROW_NUMBER() OVER (ORDER BY visited_on) AS rn
    FROM daily
)
SELECT
    visited_on,
    amount,
    average_amount
FROM w
WHERE rn >= 7
ORDER BY visited_on;

