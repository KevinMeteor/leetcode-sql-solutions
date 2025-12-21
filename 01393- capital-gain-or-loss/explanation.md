
# Capital Gain/Loss


## 🔍 Problem Summary
(stock_name, operation_day) is the primary key (combination of columns with unique values) for this table.
The operation column is an ENUM (category) of type ('Sell', 'Buy').

Each row of this table indicates that the stock which has stock_name had an operation on the day operation_day with the price.
It is guaranteed that each 'Sell' operation for a stock has a corresponding 'Buy' operation in a previous day. It is also guaranteed that each 'Buy' operation for a stock has a corresponding 'Sell' operation in an upcoming day.
 

Write a solution to report the Capital gain/loss for each stock.

The Capital gain/loss of a stock is the total gain or loss after buying and selling the stock one or many times.

Return the result table in any order.

---

# ✅ 解法 1：Signed Aggregation(最直觀、快速)

### ✔ 思路
Using signed aggregation by mapping Buy operations to negative prices and Sell operations to positive prices.

| 功能   | MySQL          | MSSQL                |
| ----   | -------------- | -------------------- |
| 條件表達 | `IF()`         | `CASE WHEN`          |
| 浮點保留 | `-1.0 * price` | `-1.0 * price`       |
| 條件加總 | `SUM(IF(...))` | `SUM(CASE WHEN ...)` |


### ✔ 主要技巧
- Conditional aggregation: SUM(CASE WHEN ... THEN value ELSE 0 END) or IF()
- GROUP BY

### ✔ Time Complexity: O(N) 
where N is the number of rows in the Stocks table.

### ✔ Space Complexity: O(S)
where S is the number of the unique stock_name.

---

# ✅ 解法 2：UNION ALL

### ✔ 思路
分別分出兩種交易 Sell & Buy 的表，並 Union 起來成為新的表，
轉成同一種「signed price」，再加總金額。

1. Buy  -> -price => AS new_price
2. Sell -> +price => AS new_price
3. SUM(new_price)

### ✔ 主要技巧
- UNION ALL

### ✔ Time Complexity: O(N) 
where N is the number of rows in the Stocks table.

### ✔ Space Complexity: O(N) 
where N is the number of rows in the new table after UNION ALL.

---



<!-- # 🧠 思想誤區
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
