-- MySQL Solution for Game Play Analysis IV

/* Approach 1 */
WITH first_login AS (
    SELECT player_id, 
           MIN(event_date) AS first_day
    FROM Activity
    GROUP BY player_id
)

SELECT
    ROUND(
        COUNT(DISTINCT f.player_id) /
        (SELECT COUNT(DISTINCT player_id) FROM Activity),
        2
    ) AS fraction
FROM first_login AS f
Inner JOIN Activity AS a
  ON f.player_id = a.player_id
 AND a.event_date = f.first_day + INTERVAL 1 DAY;

 
/* Approach 2 */
SELECT
    ROUND(
        COUNT(DISTINCT a.player_id) /
        (SELECT COUNT(DISTINCT player_id) FROM Activity),
        2
    ) AS fraction
FROM Activity AS a
WHERE a.event_date = (
    SELECT MIN(event_date)
    FROM Activity
    WHERE player_id = a.player_id
)
AND EXISTS (
    SELECT 1
    FROM Activity AS b
    WHERE b.player_id = a.player_id
      AND b.event_date = a.event_date + INTERVAL 1 DAY
);

 
/* Approach 3 */
SELECT
    a.player_id,
    a.event_date,
    DATE_SUB(b.first_login, INTERVAL 1 DAY) AS day_before_first_login
FROM
    Activity a
JOIN (
    SELECT player_id, MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
) b ON a.player_id = b.player_id;