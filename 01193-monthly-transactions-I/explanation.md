
# Monthly Transactions I

## 🔍 Problem Summary
Find for each month and country, the number of transactions and their total amount, the number of approved transactions and their total amount.

Return the result table in any order.


---

# ✅ 解法 1：Count / Sum transaction by group (month, country).

### ✔ 思路
1. Convert each transaction date into a 'YYYY-MM' format to represent the month.
2. Group rows by (month, country) so every month-country pair is aggregated.
3. Count approved transactions using a CASE expression.
4. Sum solely approved transactions amounts using CASE WHEN or IF expansion.

### ✔ 主要技巧
- Conditional aggregation: SUM(CASE WHEN ... THEN value ELSE 0 END) rather than COUNT
- GROUP BY
- FORMAT 轉換: CONVERT()


### ✔ Time Complexity: O(N) 
where N is the number of rows in the Transactions table.

### ✔ Space Complexity: O(M)
where M is the number of unique (month, country) pairs..

---

<!-- # ✅ 解法 2：DATEDIFF

### ✔ 主要技巧
- DATEDIFF: DATEDIFF(date1, date2) = date1 − date2, i.e. The end date must come first，但可讀性較低
- Hash aggregation
- Window functions  

### ✔ Time Complexity: O(N) 
掃描 Activity 表一次.

### ✔ Space Complexity: O(U) 
where U is daily unique users. -->
---

 
# 🧠 思想誤區
- MySQL & MSSQL 對照說明
1. LEFT(trans_date, 7) <--> CONVERT(char(7), trans_date, 120)
2. IF(condition, 1, 0) <--> CASE WHEN
3. SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END)

---

<!-- # 🧪 面試追問
1. What if tables are huge (100M rows)?
2. How would you index this schema?
3. Can you rewrite using window functions?
4. How does the query planner optimize this case? -->

--- -->
