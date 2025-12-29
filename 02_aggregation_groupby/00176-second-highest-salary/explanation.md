
# Second Highest Salary


## 🔍 Problem Summary
Write a solution to find the second highest distinct salary from the Employee table. If there is no second highest salary, return null (return None in Pandas), i.e., High-level restatement of the problem in natural language.


---

# ✅ 解法 1：Baseline Solution（利用 DENSE_RANK()、Scalar Subquery）

### ✔ 思路
使用 DENSE_RANK() 排名，但如果沒有第二高的 salary 不會回傳值，但題目需要回傳 null，因此加入 Scalar Subquery.

### ✔ 主要技巧
- DENSE_RANK()
- Scalar Subquery: 分為
1. 內層查詢，找 rn=2，若找不到，則回傳 null.
2. 外層查詢 SELECT (subquery)，一定回傳一列，為 null 或 salary.
- MAX() or TOP 1: 
保證 Scalar subquery 一定要「只回傳一個值」


### ✔ Time Complexity:O(N log N) 
depending on DENSE_RANK().

### ✔ Space Complexity:O(N) 
depending on subquery.

---

# ✅ 解法 2： 技巧較難(利用 DENSE_RANK()、LEFT JOIN)

### ✔ 主要技巧
- DENSE_RANK()
- (SELECT 1): 確保至少一列
- LEFT JOIN 失敗時 -> salary = null
- MAX(null) -> null

### ✔ Time Complexity:O(N log N) 
depending on DENSE_RANK().

### ✔ Space Complexity: O(N) 
depending on r table.

---

# 🚫 常見錯誤 
- 不能在 MSSQL 用 LIMIT，但可以改用 OFFSET … FETCH 或 DENSE_RANK() 解 Top-N queries.

MySQL              : LIMIT / OFFSET
SQL Server         : TOP / OFFSET FETCH



---

# 🧠 思想誤區
- 沒有注意要如果第二高的 salary 需要顯示 null

---

<!-- # 🧪 面試追問
1. What if tables are huge (100M rows)?
2. How would you index this schema?
3. Can you rewrite using window functions?
4. How does the query planner optimize this case? -->

---
