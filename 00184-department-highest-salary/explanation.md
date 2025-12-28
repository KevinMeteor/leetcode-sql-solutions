
# Department Highest Salary

## 🔍 Problem Summary
Write a solution to find employees who have the highest salary in each of the departments.

Return the result table in any order.



---

# ✅ 解法 1：Baseline Solution(利用 RANK)

### ✔ 思路
先將 Employee table & Department table 以 JOIN 合併，
再計算各部門內的薪資排名，並取出各部門中薪資的第一名.


### ✔ 主要技巧
- Window Function
- PARTITION BY d.name: 部門內分組
- ORDER BY e.salary DESC: 依據薪資排序
- an.rank = 1: 取第一名
- 若同部門有 多人並列最高薪 --> 全部列出

### ✔ Time Complexity: $O(N * log N)$
where N is the number of row of the Employee table.

### ✔ Space Complexity:$O(N)$
where N is the number of row of the Employee table.

---

# ✅ 解法 2：最佳化解(利用 NOT EXISTS)

### ✔ 思路
找「不存在同部門、薪資比我更高的人」的員工

 
### ✔ 主要技巧
- NOT EXISTS
- JOIN

### ✔ Time Complexity: $O(N ^ 2)$ if without index, $O(N * \log{N})$ if with index.
where N is the number of row of the Employee table.

### ✔ Space Complexity: $O(1)$

$O(N * \log{N})$
$O(N * \logN)$
$O(N * logN)$
$O(N logN)$

---

# ⚙️ 效能分析（Time / Space Complexity）

| 解法             | Time（無 index） | Time（有 index） | Space    |
| -------------- | ------------- | ------------- | -------- |
| `DENSE_RANK()` | $O(N * log N)$    | $O(N * log N)$    | $O(N)$     |
| `MAX + JOIN`   | $O(N * log N)$    | $O(N)$            | $O(N)$     |
| `NOT EXISTS`   | ❌ $O(N^2)$       | ✅ $O(N)$        | $O(1)$ |


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
