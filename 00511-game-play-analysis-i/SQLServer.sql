-- SQL Server (T-SQL) Solution for Game Play Analysis I
/* Approach  1 */
SELECT a.player_id,
       MIN(a.event_date) AS　first_login
FROM Activity AS a
GROUP BY player_id;

/* Approach  2 */
SELECT a1.player_id, 
       a1.event_date AS first_login
FROM Activity AS a1
LEFT JOIN Activity AS a2
ON a1.player_id = a2.player_id
AND a1.event_date > a2.event_date
WHERE a2.event_date IS NUll;