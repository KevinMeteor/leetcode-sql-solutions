-- SQL Server (T-SQL) Solution for User Activity
/* Approach 1 */
SELECT a.activity_date AS day,
       COUNT(DISTINCT a.user_id)AS active_users
FROM Activity AS a
WHERE a.activity_date BETWEEN DATEADD(day, -30, '2019-07-28')
                       AND '2019-07-28'
GROUP BY a.activity_date;

/* Approach 2 */
SELECT activity_date AS day,
       COUNT(DISTINCT a.user_id) AS active_users
FROM Activity AS a
WHERE a.activity_date <= '2019-07-27'
AND DATEDIFF(DAY, a.activity_date, '2019-07-27') <= 29
GROUP BY a.activity_date;