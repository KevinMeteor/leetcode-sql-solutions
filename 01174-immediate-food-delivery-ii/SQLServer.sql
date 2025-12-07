WITH first_order AS(
 SELECT customer_id, MIN(order_date) AS first_date
 FROM Delivery GROUP BY customer_id
)
SELECT ROUND(
    AVG(CASE WHEN d.order_date = d.customer_pref_delivery_date THEN 1 ELSE 0 END) * 100.0
,2) AS immediate_percentage
FROM Delivery d
JOIN first_order f ON d.customer_id = f.customer_id AND d.order_date = f.first_date;