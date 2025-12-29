-- SQL Server (T-SQL) Solution for Not Boring Moives
/* Approach 1 */
SELECT *
FROM Cinema AS c
WHERE c.description <> 'boring'
AND c.id % 2 = 1
ORDER BY c.rating DESC;

