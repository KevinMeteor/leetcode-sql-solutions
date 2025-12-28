-- SQL Server (T-SQL) Solution for Department Highest Salary
/* Approch 1 */
SELECT an.dname Department, an.ename Employee, an.salary Salary 
FROM(
    SELECT d.name AS dname,
           e.name AS ename,
           e.salary AS salary,
           RANK() OVER(PARTITION BY d.name ORDER BY e.salary DESC) AS 'rank'
    FROM Employee AS e
    JOIN Department AS d
    ON e.departmentId = d.id
) AS an
WHERE an.rank =1;


/* Approch 2 */
SELECT
    
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM Employee AS e
JOIN Department AS d
  ON e.departmentId = d.id
WHERE NOT EXISTS (
    SELECT 1
    FROM Employee AS e2
    WHERE e2.departmentId = e.departmentId
      AND e2.salary > e.salary
);
