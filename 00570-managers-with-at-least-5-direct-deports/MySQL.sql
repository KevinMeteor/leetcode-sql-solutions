-- MySQL Solution for Managers with at Least 5 Direct Reports

/* Approach 1 */
SELECT name 
FROM Employee 
WHERE id IN (
    SELECT managerId 
    FROM Employee 
    GROUP BY managerId 
    HAVING COUNT(managerId) >= 5);

 
/* Approach 2 */
SELECT e.name
FROM Employee AS e 
INNER JOIN Employee AS m ON e.id=m.managerId 
GROUP BY m.managerId 
HAVING COUNT(m.managerId) >= 5

select e1.name
from Employee as e1
inner join Employee as e2 on e1.id=e2.managerId 
group by e2.managerId 
having count(e2.managerId) >= 5


 
/* Approach 3 */
-- https://leetcode.com/problems/managers-with-at-least-5-direct-reports/solutions/6559564/step-by-step-guide-why-join-in-detailed-dmqlt
SELECT e.name  
FROM Employee e  
JOIN  
    (  
        SELECT managerId  
        FROM Employee  
        GROUP BY managerId  
        HAVING COUNT(*) >= 5  
    ) temp  
    ON e.id = temp.managerId;  