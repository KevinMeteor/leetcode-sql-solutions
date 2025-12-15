
# Rank Scores

## 🔍 Problem Summary
(High-level restatement of the problem in natural language.)

---

# ✅ 解法 1：Baseline Solution（直覺）

### ✔ 思路
(Explain intuitive approach.)

### ✔ Time Complexity
O(N log N) / O(N + M) depending on JOIN / sort.

### ✔ Space Complexity
O(1) / O(N) depending on window function or join buffers.

---

# ✅ 解法 2：最佳化解（利用索引、JOIN、Window Function)

### ✔ 主要技巧
- Index-aware join
- Hash aggregation
- Window functions  

### ✔ Time Complexity
O(N log N) or O(N) depending on DB optimizer.

### ✔ Space Complexity
O(min(N, M)) for hash or window frames.

---

# ✅ 解法 3：進階 SQL（子查詢、CTE、分析函數）

(Explain alternative formulation.)

---

# ⚙️ 效能分析（Time / Space Complexity）
- With index: O(N + M)
- Without index: potentially O(N × M)
- Window function requires O(N log N) due to sorting.

---

# 🚫 常見錯誤
- Wrong join direction  
- Using subqueries without index  
- Off-by-one mistakes in date difference  
- Misuse of GROUP BY  

---

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

---
