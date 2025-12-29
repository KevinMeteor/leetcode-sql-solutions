-- MySQL Solution for Department Top Three Salaries
/* Approach 1 */
WITH e2 AS(
SELECT 
    d.name AS Department,
    e.name AS Employee,
    e.salary AS salary,
    DENSE_RANK() OVER (PARTITION BY d.name ORDER BY e.salary DESC) AS "rnk" /* RANK() 不合 */
FROM Employee AS e
JOIN Department AS d
  ON e.departmentId=d.id
)

SELECT e2.Department, e2.Employee, e2.Salary
FROM e2
WHERE e2.rnk <= 3;

/* Approach 2 */
SELECT 
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM Employee AS e
JOIN Department AS d
  ON e.departmentId=d.id
WHERE NOT EXISTS(
    SELECT 1
    FROM Employee AS e2
    WHERE e2.departmentId=e.departmentId
      AND e2.salary>e.salary
    GROUP BY e2.departmentId
    HAVING COUNT(DISTINCT e2.salary) >= 3
);