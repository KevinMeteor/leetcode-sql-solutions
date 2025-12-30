-- SQL Server (T-SQL) Solution for Immediate Food Delivery II
/* Approach 1 */
WITH first AS (
    SELECT
        d1.customer_id,
        d1.order_date,
        d1.customer_pref_delivery_date,
        ROW_NUMBER() OVER (
            PARTITION BY d1.customer_id
            ORDER BY d1.order_date ASC
        ) AS rn
    FROM Delivery AS d1
)
SELECT
    ROUND(
        AVG(
            CASE
                WHEN order_date = customer_pref_delivery_date THEN 1.0
                ELSE 0.0
            END
        ) * 100,
        2
    ) AS immediate_percentage
FROM first
WHERE rn = 1;

/* Approach 2: MSSQL 無法使用 WHERE (customer_id, order_date) IN ( ... ) */ 
/* 因此，改用 JOIN */
SELECT
    ROUND(
        AVG(
            CASE
                WHEN d.order_date = d.customer_pref_delivery_date THEN 1.0
                ELSE 0.0
            END
        ) * 100,
        2
    ) AS immediate_percentage
FROM Delivery AS d
JOIN (
    SELECT customer_id, MIN(order_date) AS first_order
    FROM Delivery
    GROUP BY customer_id
) AS f
ON d.customer_id = f.customer_id
AND d.order_date = f.first_order;

/* Approach 3 */
SELECT
    ROUND(
        AVG(
            CASE
                WHEN d1.order_date = d1.customer_pref_delivery_date THEN 1.0
                ELSE 0.0
            END
        ) * 100,
        2
    ) AS immediate_percentage
FROM Delivery d1
WHERE NOT EXISTS (
    SELECT 1
    FROM Delivery d2
    WHERE d2.customer_id = d1.customer_id
      AND d2.order_date < d1.order_date
);
