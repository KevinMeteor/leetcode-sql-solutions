-- MySQL Solution for Rising Temperature
/* Aproach 1 */
SELECT w1.id
FROM Weather AS w1, Weather AS w2
WHERE w1.temperature - w2.temperature > 0
AND DATEDIFF(w1.recordDate, w2.recordDate) = 1;

/* Aproach 2 */
SELECT w1.id
FROM Weather as w1
JOIN Weather as w2
  ON w1.recordDate = w2.recordDate + INTERVAL 1 DAY
WHERE w1.temperature > w2.temperature;

/* Aproach 3 */
SELECT today.id
FROM Weather AS today
WHERE EXISTS (
    SELECT 1
    FROM Weather AS yesterday
    WHERE today.temperature > yesterday.temperature
    AND today.recordDate = yesterday.recordDate + INTERVAL 1 DAY
);



