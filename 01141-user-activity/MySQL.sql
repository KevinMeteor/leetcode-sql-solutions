-- MySQL Solution for User Activity

/* Approach 1 */
SELECT activity_date AS day,
       COUNT(DISTINCT user_id) AS active_users
FROM Activity 
WHERE activity_date BETWEEN DATE_SUB('2019-07-27', INTERVAL 29 DAY)
                        AND '2019-07-27'
  AND activity_type IN (
        'open_session',
        'end_session',
        'scroll_down',
        'send_message'
      )
GROUP BY activity_date;


/* Approach 2 */
SELECT 
    activity_date AS day, 
    COUNT(DISTINCT user_id) AS active_users
FROM 
    Activity
WHERE 
    DATEDIFF('2019-07-27', activity_date) < 30 AND DATEDIFF('2019-07-27', activity_date)>=0
GROUP BY 1