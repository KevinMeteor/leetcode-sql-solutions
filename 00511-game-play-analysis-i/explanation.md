
# Game Play Analysis I

## 🔍 Problem Summary
Find the first login date for each player.


---

# ✅ 解法 1：Baseline Solution（直覺）

### ✔ 主要技巧
- Grouping

### ✔ 思路
1. Use GROUP BY player_id to group each player.
2. Use MIN(event_date) to find players' first login date.
3. Rename the results of 2. as first_login.

### ✔ Time Complexity: O(N * logM) 
where N is the number of rows and M is the number of unique players.

### ✔ Space Complexity: O(M) 
Return grouped results.

---

# ✅ 解法 2：最佳化解(利用 LEFT JOIN)

### ✔ 思路
1. Self-join
2. 關鍵條件：尋找 a1 日期"更早"的 a2 資料
3. 只保留那些找不到"更早"記錄的 a1 資料

### ✔ 主要技巧
- LEFT JOIN
- WHERE a2.event_date IS NULL(): 
LEFT JOIN 的特性是，如果 ON 條件找不到匹配的行，a2 的所有欄位（包括 event_date）都將是 NULL。


### ✔ Time Complexity: O(N^2)
where N is the number of rows. Due to the self-join operation.

### ✔ Space Complexity: O(1) 
for the output.

---



<!-- 
# 🧠 思想誤區
- Thinking SQL executes row-by-row  
- Assuming window functions are O(1)  
- Believing subqueries are always slower   -->

<!-- ---

# 🧪 面試追問
1. What if tables are huge (100M rows)?
2. How would you index this schema?
3. Can you rewrite using window functions?
4. How does the query planner optimize this case?

--- -->
