SELECT CAST(
    COUNT(DISTINCT a1.player_id) *1.0 /
    (SELECT COUNT(DISTINCT player_id) FROM Activity)
AS DECIMAL(5,2)) AS fraction
FROM Activity a1
JOIN Activity a2 ON a1.player_id = a2.player_id
WHERE DATEDIFF(day, a1.event_date, a2.event_date) = 1;