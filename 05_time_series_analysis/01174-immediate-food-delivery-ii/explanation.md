# Immediate Food Delivery II

## 🔍 Problem Summary
If the customer's preferred delivery date is the same as the order date, then the order is called immediate; otherwise, it is called scheduled.

The first order of a customer is the order with the earliest order date that the customer made. It is guaranteed that a customer has precisely one first order.

Write a solution to find the percentage of immediate orders in the first orders of all customers, rounded to 2 decimal places.


---

# ✅ 解法 1：Baseline Solution（直覺、可讀性高、穩定）

### ✔ 思路
題目要求計算每位客戶第一筆訂單中立即配送（`order_date=customer_pref_delivery_date`）比例，
1. 因此，先篩選出客戶第一筆訂單，並命作 first table.
2. 接續 first table，再將 `order_date=customer_pref_delivery_date` 者設為 1.0(建議需有小數)，
其他不相等者為 0.0，並依此計算平均後乘 100 換算為 2 位小數(單位: 百分比).

### ✔ 主要技巧
1. 利用 `ROW_NUMBER()` -> 每人第一筆 / 最新一筆 / 排名，本題用以排序 `order_date`

```
ROW_NUMBER() OVER (
    PARTITION BY customer_id
    ORDER BY order_date ASC
)
```

2. 將 `order_date = customer_pref_delivery_date` 挑出並計算平均數

```
AVG(CASE WHEN order_date = customer_pref_delivery_date THEN 1.0 ELSE 0.0 END)
```

3. `WHERE rn = 1` -> 只保留第一筆訂單

### ✔ Time Complexity: $O(N * \log{N})$ 
where $N$ is the number of row of the `Delivery` table.

### ✔ Space Complexity: $O(N)$
where $N$ is the number of row of the `Delivery` table.

---

# ✅ 解法 2：較為效率的解(利用`MIN`、`GROUP BY`)

### ✔ 思路
1. Identify the first (earliest) order per customer.
2. Check if that first order was immediate.
3. Calculate the percentage of such immediate orders over all first orders.

### ✔ 主要技巧
- `MIN`
- `GROUP BY`
- `AVG(order_date = customer_pref_delivery_date)` -> MySQL 環境中 Boolean 會被隱式轉成 1 / 0，但在 MSSQL Boolean 不是數值，還是需要多一步驟使用 `CASE WNEN`.
- `(customer_id, order_date) IN (...)` -> 將子查詢結果用集合(Set)方式比對，在 MySQL 環境中有支援，但在 MSSQL 不支援，且須事前確認 `(customer_id, order_date)` 唯一性.

### ✔ Time Complexity: $O(N)$
where $N$ is the number of row of the `Delivery` table.

### ✔ Space Complexity: $O(C)$
where $C$ is the number of the unique `(customer_id, first_order_date)`, i.e. the number of distinct customers.

---

# ✅ 解法 3：進階 SQL（利用`NOT EXISTS`）

### ✔ 思路
- 不存在一筆更早的訂單屬於同一個 customer -> 第一筆訂單.

### ✔ 主要技巧
- `NOT EXISTS(...AND d2.order_date < d1.order_date)` -> 

```
WHERE NOT EXISTS (
    SELECT 1
    FROM Delivery AS d2
    WHERE d2.customer_id = d1.customer_id
      AND d2.order_date < d1.order_date 
);
```

### ✔ Time Complexity: $O(N * \log{N})$
where $N$ is the number of row of the `Delivery` table.

### ✔ Space Complexity: $O(1)$



---

# 🚫 常見錯誤
- `ORDER BY` 後用錯 `ASC` 與 `DESC`


---
<!-- 
# 🧠 思想誤區
- Thinking SQL executes row-by-row  
- Assuming window functions are O(1)  
- Believing subqueries are always slower  

---

# 🧪 面試追問
1. What if tables are huge (100M rows)?
2. How would you index this schema?
3. Can you rewrite using window functions?
4. How does the query planner optimize this case?

--- -->
