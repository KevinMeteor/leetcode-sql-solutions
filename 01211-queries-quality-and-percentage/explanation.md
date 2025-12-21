
# Queries Quality and Percentage

## 🔍 Problem Summary
We define query quality as:

The average of the ratio between query rating and its position.

We also define poor query percentage as:

The percentage of all queries with rating less than 3.

Write a solution to find each query_name, the quality and poor_query_percentage.

Both quality and poor_query_percentage should be rounded to 2 decimal places.

Return the result table in any order.



---

# ✅ 解法 1： Subquery with Aggregation

### ✔ 思路


### ✔ 主要技巧
- Subquery 
- GROUP BY


### ✔ Time Complexity: O(N) 
where N is the number of query records.

### ✔ Space Complexity: O(M + K)
where M is the subquery result and k is the number of unique query names in the final result.

---

# ✅ 解法 2：DATEDIFF

### ✔ 主要技巧
- IF 
- CASE WHEN
- 1.0 / 0.0: 強制轉 decimal
- 先轉 decimal 再計算 AVG


### ✔ Time Complexity: O(N) 
where N is the number of query records.

### ✔ Space Complexity: O(N) 

---



# 🧠 思想誤區
- MySQL 有 IF()，但 MSSQL 沒有 IF。所以比較安全的寫法為 CASE... WHEN... THEN...
- MySQL AVG() 不會吃掉小數，但 MSSQL 的 AVG() 會吃掉掉小數，所以建議使用
1. CAST(rating AS decimal(10, 2)) / position 或
2. rating * 1.0 / position 
3. CASE WHEN rating < 3 THEN 1.0 ELSE 0.0 END

---

<!-- # 🧪 面試追問
1. What if tables are huge (100M rows)?
2. How would you index this schema?
3. Can you rewrite using window functions?
4. How does the query planner optimize this case? -->

--- -->
