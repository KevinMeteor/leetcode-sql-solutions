-- SQL Server (T-SQL) Solution for User Activity
/* Approach 1 */
SELECT
    query_name,
    ROUND(SUM(quality) / COUNT(*), 2) AS quality,
    ROUND(SUM(poor) * 100.0 / COUNT(*), 2) AS poor_query_percentage /* 100.0 避免整數乘法 */ 
FROM (
    SELECT
        query_name,
        CAST(rating AS decimal(10, 2)) / position AS quality, /* CAST(rating AS decimal) 因 AVG / SUM 不吃小數 */ 
        CASE
            WHEN rating < 3 THEN 1
            ELSE 0
        END AS poor
    FROM Queries
) AS q
GROUP BY query_name;


/* Approach 2 */
SELECT
    query_name,
    ROUND(
        AVG(CAST(rating AS decimal(10,2)) / position),
        2
    ) AS quality,
    ROUND(
        AVG(CASE WHEN rating < 3 THEN 1.0 ELSE 0.0 END) * 100,
        2
    ) AS poor_query_percentage
FROM Queries
GROUP BY query_name;
