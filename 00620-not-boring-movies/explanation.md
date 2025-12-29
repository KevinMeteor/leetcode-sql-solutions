# Not Boring Movies

## 🔍 Problem Summary
Write a solution to report the movies with an odd-numbered ID and a description that is not "boring".
Return the result table ordered by rating in descending order.

---

# ✅ 解法 1：Baseline Solution（直覺）

### ✔ 主要技巧
- module operator: `id % 2 = 1`
- `ORDER BY (DESC)`

### ✔ 思路
1. Exclude rows where description is "boring".
2. Use the module operator `id % 2 = 1` to  keep only movies with odd IDs.
3. Sort the results by `ORDER BY rating DESC` to prioritize higher-rated movies.
4. Return the filtered and sorted result set.

### ✔ Time Complexity: $O(N * \log{N})$ 
where $N$ is the number of rows. The filtering operations are $O(N)$, but the sorting operation dominates with $O(N * \log{N})$ complexity.

### ✔ Space Complexity: $O(M) $
where $M$ is the number of rows that match the filter criteria. The result set stores all matching rows.

---

# ✅ 解法 2：類似解法 1，但改用 MOD 替代 module operator: `id % 2 = 1`

### ✔ 思路
同上.

### ✔ 主要技巧
- MOD (P.S. MySQL 有 MOD function，但 MS-SQL 沒有)
- `ORDER BY (DESC)`

### ✔ Time Complexity: $O(N * \log{N})$ 
where $N$ is the number of rows. The filtering operations are $O(N)$, but the sorting operation dominates with $O(N * \log{N})$ complexity.

### ✔ Space Complexity: $O(M)$
where $M$ is the number of rows that match the filter criteria. The result set stores all matching rows.
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
