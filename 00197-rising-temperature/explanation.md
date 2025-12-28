# Rising Temperature

## 🔍 Problem Summary
Write a solution to find all dates' id with higher temperatures compared to its previous dates (yesterday).

Return the result table in any order.

---

# ✅ 解法 1：Baseline Solution（直覺）

### ✔ 主要技巧
- `DATEDIFF `
- CROSS JOIN

### ✔ 思路
1. Join the `Weather` table by itself, nameing table 1 as `w1` and table 2 as `w2`.
2. Use WHERE clause to select the rows that the temperature of `w1` is greater than the temperature of `w2`.
3. Like 2., add a condition in WHERE clause using `DATEDIFF` function to determine whether the `recordDates` are consecutive.

### ✔ Time Complexity: $O(N^2)$
where $N$ isthe number of weather days. The self join operation 
compares recordDate with each other.

### ✔ Space Complexity: $O(K)$
where $K$ is the number of dates with higher temperature than yesterday.
The output stores the matchind record IDs solely.

---

# ✅ 解法 2：類似解法 1，改利用 `INTERVAL *  DAY`

<!-- ### ✔ 主要技巧
- Index-aware join
- Hash aggregation
- Window functions  

### ✔ Time Complexity
O(N log N) or O(N) depending on DB optimizer.

### ✔ Space Complexity
O(min(N, M)) for hash or window frames. -->

---

# ✅ 解法 3：`EXISTS`
Utilize `EXISTS` function to find  today's `ids` that today's temperature is greater than yesterday's.

---
### ✔ 主要技巧
- `EXISTS`
- Semi-Join

### ✔ 思路
1. `EXISTS`
Use `EXISTS` clause to filter yje results which are based ona conditon difined in a subquery.
a. If the subquery returns any rows, than the condition is true.
b. If the subquery no returns any rows, than the condition is false.

2. `SELECT 1 FROM Weather AS yesterday`
There is a subquery filtering a constant value 1.

a. `SELECT 1`/ `SELECT *` / `SELECT 'x'`: 功能一樣，因為 `EXISTS` 不看內容.

```
SELECT ...
FROM table1
WHERE EXISTS (
    SELECT 1
    FROM table2
    WHERE 條件
);
```


### ✔ Time Complexity: $O(N)$
where $N$ is the number of row of Weather table.

### ✔ Space Complexity: $O(1)$
for EXISTS function.


---

# 🚫 `EXISTS` V.S. `IN`

- `EXISTS` 更安全

| 問題         | `IN`         | `EXISTS` |
| --------     | ---------- | ------ |
| 子查詢 NULL   | ❌ 會出錯或結果怪  | ✅ 安全   |
| 大資料量      | ❌ 可能產生巨大集合 | ✅ 逐列判斷 |
| 語意          | 值比較        | 存在性判斷  |


---

<!-- # 🧠 思想誤區
- Thinking SQL executes row-by-row  
- Assuming window functions are O(1)  
- Believing subqueries are always slower   -->

<!-- --- -->

<!-- # 🧪 面試追問
1. What if tables are huge (100M rows)?
2. How would you index this schema?
3. Can you rewrite using window functions?
4. How does the query planner optimize this case? -->

<!-- --- -->
