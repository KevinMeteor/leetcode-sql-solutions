-- MySQL Solution for Customers Who Never Order

/* Approach 1-1 */
SELECT c.name AS Customers
FROM Customers  AS c
LEFT JOIN Orders AS o
  ON c.id = o.customerId
WHERE o.id IS NULL;

/* Approach 1-2 */
SELECT c.name AS Customers
FROM Orders AS o
RIGHT JOIN Customers AS c
  ON o.customerId = c.id
WHERE o.id IS NULL;

/* Approach 2 */
SELECT c.name AS Customers
FROM Customers AS c
WHERE NOT EXISTS (
    SELECT 1
    FROM Orders AS o
    WHERE o.customerId = c.id
);

