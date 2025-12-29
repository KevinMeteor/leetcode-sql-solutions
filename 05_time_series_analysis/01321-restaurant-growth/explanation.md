# Restaurant Growth

## 🔍 Problem Summary
Compute the moving average of how much the customer paid in a seven days window (i.e., current day + 6 days before). `average_amount` should be rounded to two decimal places.

Return the result table ordered by `visited_on` in ascending order.

---

# ✅ 解法 1：Baseline Solution（直覺）

### ✔ 思路
1. 先將每天金額加總

2. 再做 7 天滑動視窗

### ✔ 主要技巧
1. `BETWEEN` 表示「7 天視窗」
`d2.visited_on BETWEEN d1.visited_on - 6 AND d1.visited_on`

2. `HAVING COUNT = 7`（LeetCode 關鍵）
`HAVING COUNT(d2.visited_on) = 7`
為確保連續 7 天都有資料，篩選並排除前 6 天沒有資料的日期

### ✔ Time Complexity: $O(N)$ 
where $N$ is the number of dates.

### ✔ Space Complexity: $O(D)$
where $D$ is the number of non-complicated date.

---

# ✅ 解法 2：最佳化解(Window Function)

### ✔ 思路
1. 做 7 天將滑動視窗
2. 每 7 天做一次加總計算


### ✔ 主要技巧
- `SUM(...) OVER(...)`
- `RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW`
定義 7 天 WINDOW

- `RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW`
對每一個 visited_on = t，納入 [t-6, t] 共 7 天內所有資料

- `DATEDIFF()`
計算取第一天的日期差距，並選有前 7 天的日期.
<!-- 
### ✔ Time Complexity
O(N log N) or O(N) depending on DB optimizer.

### ✔ Space Complexity
O(min(N, M)) for hash or window frames. -->

---

# ✅ 解法 3：進階 SQL（ROWS-based, Recommended，沒有子查詢 MIN、不用 `DISTINCT`）


---

# ⚙️ 效能分析（Time / Space Complexity）
- With index: O(N + M)
- Without index: potentially O(N × M)
- Window function requires O(N log N) due to sorting.

---

# 🚫 常見錯誤
- 日期不包含連續 7 天
- 日期若本身非連續日期有些查詢方式容易出錯
- MS SQL Server 沒有 INTERVAL
- MS SQL Server 不支援時間型 RANGE
- MS SQL Server: AVG(int) -> int / int -> 整數平均，所以計算小數須先把數值轉換為小數格式

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
4. How does the query planner optimize this case?

--- -->
