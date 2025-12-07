SELECT visited_on,
SUM(amount) AS amount,
ROUND(SUM(amount)/7,2) AS average_amount
FROM (
  SELECT visited_on, amount,
  ROW_NUMBER() OVER(ORDER BY visited_on) rn
  FROM Customer
) t
GROUP BY visited_on
HAVING COUNT(*)=1;