-- simplified placeholder; real solution uses rolling sum
SELECT visited_on, SUM(amount) AS amount,
CAST(SUM(amount)/7.0 AS DECIMAL(10,2)) AS average_amount
FROM Customer GROUP BY visited_on;