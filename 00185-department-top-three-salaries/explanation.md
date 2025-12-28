
# Department Top Three Salaries

## 🔍 Problem Summary
A company's executives are interested in seeing who earns the most money in each of the company's departments. A **high earner** in a department is an employee who has a salary in the **top three unique** salaries for that department.

Write a solution to find the employees who are high earners in each of the departments.

Return the result table in any order.

---

# ✅ 解法 1：Baseline Solution（程式可讀性高）

### ✔ 思路
延續第 00184 題，再但改取各部門薪資前三名.

### ✔ 主要技巧
- DENSE_RANK()

### ✔ Time Complexity: $O(N * \log{N})$
where N is the number of row of the Employee table.

### ✔ Space Complexity: $O(N)$
where N is the number of row of the Employee table.

---

# ✅ 解法 2：最佳化解(利用索引、JOIN、Window Function)

### ✔ 思路
延續第 00184 題，再增加條件取各部門薪資前三名.

### ✔ 主要技巧
- NOT EXISTS 
- JOIN
- GROUP BY

### ✔ Time Complexity: $O(N ^ 2)$ if without index, $O(N * \log{N})$ if with index.
where N is the number of row of the Employee table.

### ✔ Space Complexity: $O(1)$



<!-- --- -->


<!-- # ⚙️ 效能分析（Time / Space Complexity）
- With index: O(N + M)
- Without index: potentially O(N × M)
- Window function requires O(N log N) due to sorting. -->

---

# 🚫 常見錯誤
- RANK() v.s. DENSE_RANK()
1. 本題需要取各部門中前三高薪資者，但有相同薪資造成排名重複的問題，
因此，在選用 RANK() / DENSE_RANK() 需特別小心.

2. RANK() / DENSE_RANK() 功能主要差異為 
RANK() 若遇到相同排名，下一號會跳號(不符合本題取前三名需求)；而
DENSE_RANK() 若遇到相同排名，下一號會號下一號會不會跳號(符合本題取前三名需求).

例如：

| salary | RANK() | DENSE_RANK() |
| ------ | ------ | ------------ |
| 100    | 1      | 1          |
| 100    | 1      | 1          |
| 90     | 3 ❌   | 2          |
| 80     | 4 ❌   | 3          |


- ROW_NUMBER() 本題更不可使用 

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
