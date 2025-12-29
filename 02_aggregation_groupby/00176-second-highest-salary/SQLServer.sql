-- SQL Server (T-SQL) Solution for Second Highest Salary
/* Approach 1 */
SELECT
    (
        SELECT MAX(salary) /* TOP 1 也可以 */
        FROM (
            SELECT
                salary,
                DENSE_RANK() OVER (ORDER BY salary DESC) AS rn
            FROM Employee
        ) t
        WHERE rn = 2
    ) AS SecondHighestSalary;

/* Approach 2 */
WITH r AS (
    SELECT
        salary,
        DENSE_RANK() OVER (ORDER BY salary DESC) AS rn
    FROM Employee
)
SELECT
    MAX(r.salary) AS SecondHighestSalary
FROM (SELECT 1 AS dummy) d
LEFT JOIN r
    ON r.rn = 2;



