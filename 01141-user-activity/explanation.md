
# User Activity

## 🔍 Problem Summary
Find the daily active user count for a period of 30 days ending on 2019-07-27 (inclusive).

A user is considered active on a day if they performed at least one activity from: ('open_session', 'end_session', 'scroll_down', 'send_message')


---

# ✅ 解法 1：BETWEEN

### ✔ 思路
Use BETWEEN and notice that the date is used because BETWEEN operator is inclusive, that is both of the begin and the end are included.

### ✔ 主要技巧
- BETWEEN: 直接比日期值，且包含起訖點，可讀性高
- COUNT(DISTINCT ) & GROUP BY
- DATE_SUB()

### ✔ Time Complexity: O(N) 
掃描 Activity 表一次.

### ✔ Space Complexity: O(U)
where U is daily unique users.

---

# ✅ 解法 2：DATEDIFF

### ✔ 主要技巧
- DATEDIFF: DATEDIFF(date1, date2) = date1 − date2, i.e. The end date must come first，但可讀性較低
- Hash aggregation
- Window functions  

### ✔ Time Complexity: O(N) 
掃描 Activity 表一次.

### ✔ Space Complexity: O(U) 
where U is daily unique users.
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
