-- MySQL Solution for Restaurant Growth
/* Approach 1 */
-- # 以每天為單位加總
WITH daily AS (
    SELECT
        visited_on,
        SUM(amount) AS daily_amount
    FROM Customer
    GROUP BY visited_on
)

-- # 計算移動平均
SELECT
    d1.visited_on,
    SUM(d2.daily_amount) AS amount,
    ROUND(SUM(d2.daily_amount) / 7., 2) AS average_amount
FROM daily AS d1
INNER JOIN daily AS d2
  ON d2.visited_on BETWEEN DATE_SUB(d1.visited_on, INTERVAL 6 DAY)
                       AND d1.visited_on
GROUP BY d1.visited_on
HAVING COUNT(d2.visited_on) = 7
ORDER BY d1.visited_on ASC;

/* Approach 2 */
SELECT visited_on, 
       amount, 
       average_amount 
FROM (SELECT DISTINCT visited_on, SUM(amount) OVER
 (ORDER BY visited_on RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW) AS amount,
  ROUND(SUM(amount) OVER (ORDER BY visited_on RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW)/7. ,2)
   AS average_amount
FROM Customer) AS whole_totals
WHERE DATEDIFF(visited_on, (SELECT MIN(visited_on) FROM Customer)) >= 6

/* Approach 3 */
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
        ROUND(
            AVG(daily_amount) OVER (
                ORDER BY visited_on
                ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
            ),
            2
        ) AS average_amount,
        ROW_NUMBER() OVER (ORDER BY visited_on) AS rn
    FROM daily
)
SELECT visited_on, amount, average_amount
FROM w
WHERE rn >= 7
ORDER BY visited_on;
