SELECT TOP 1 salary AS SecondHighestSalary
FROM (
    SELECT DISTINCT salary, DENSE_RANK() OVER (ORDER BY salary DESC) rk
    FROM Employee
) t
WHERE rk = 2;