WITH mx AS(
 SELECT departmentId, MAX(salary) mxs FROM Employee GROUP BY departmentId
)
SELECT d.name AS Department, e.name AS Employee, e.salary AS Salary
FROM Employee e
JOIN mx ON e.departmentId = mx.departmentId AND e.salary = mx.mxs
JOIN Department d ON e.departmentId = d.id;