-- SQL Server (T-SQL) Solution for Game Play Analysis IV

/* ... */
WITH ft AS(
SELECT player_id, 
       MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id
),
next_day AS(
SELECT f.player_id
FROM ft AS f
INNER JOIN Activity AS a
ON f.player_id = a.player_id
AND DATEDIFF(DAY, f.first_login, a.event_date) = 1
)

SELECT 
    ROUND(1.0 * COUNT(DISTINCT n.player_id) / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM ft as f 
LEFT JOIN next_day AS n 
ON f.player_id = n.player_id