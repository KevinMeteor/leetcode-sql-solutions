-- MySQL Solution for User Activity

/* Approach 1 */
SELECT
    query_name,
    ROUND(SUM(quality) / COUNT(*), 2) AS quality, /* 平均 quality */
    ROUND(SUM(poor) / COUNT(*) * 100, 2) AS poor_query_percentage /* poor query 百分比 */
FROM (
    SELECT
        query_name,
        rating / position AS quality, /* 內層子查詢：逐筆計算 */
        CASE
            WHEN rating < 3. THEN 1 /* 除數有小數點，避免後續 rating / position 變成整數除法 */ 
            ELSE 0
        END AS poor
    FROM Queries
) AS q
GROUP BY query_name;


/* Approach 2-1 */
SELECT q.query_name,
       ROUND(
            AVG(q.rating * 1.0 / q.position),
            2
        )  AS quality, /* q.rating * 1.0 避免後面變成整數除法 */
       ROUND(
            AVG(IF(q.rating < 3, 1.0, 0.0)) * 100, 
            2
        ) AS poor_query_percentage
FROM Queries as q
GROUP BY q.query_name



/* Approach 2-2 */
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
