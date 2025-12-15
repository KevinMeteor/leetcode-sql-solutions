
# Game Play Analysis IV

## 🔍 Problem Summary
Compute fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places.

---

# ✅ 解法 1：INNER JOIN（直覺、可讀）

### ✔ 思路
1. Get first logged in day.
2. Return #of users that logged in two consecutive days.
3. Get the total count of users.


### ✔ Time Complexity: O(N^2) 


### ✔ Space Complexity: O(N)  


---

# ✅ 解法 2：EXISTS(最佳、可讀)

### ✔ 思路
1. Lock to first login day.
2. Check existence of next-day login.
3. Compute fraction.

### ✔ 主要技巧
- EXISTS


### ✔ Time Complexity: O(N^2) 
with index on (player_id, event_date).
1. O(N^2) for worse case without index
2. O(N) for average case with index

### ✔ Space Complexity: O(1) 
不產生中間結果.
---

# ✅ 解法 3：WITH（SQL Server (T-SQL)）

### ✔ 思路
1. Get first logged in day.
2. Return #of users that logged in two consecutive days.
3. Get the total count of users.

---

### ✔ Time Complexity: O(N^2) 
1. O(N^2) for worse case without index
2. O(N) for average case with index

### ✔ Space Complexity: O(P)  
where P is the number of unique player(P ≤ N).


---

# 🚫 常見錯誤
- ROUND() 在 T-SQL 會整數除法，需乘上 1.0 確保為浮點數.
- CTE 只能有一個 WITH，多個 CTE 要用逗號隔開，不要寫成兩個或多個 WITH.
- 計算 fracction 的分母不應 GROUP BY，因為會產生多列查詢而非單一 scalar.

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
4. How does the query planner optimize this case? -->

---
