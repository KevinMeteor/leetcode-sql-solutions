
# Customers Who Never Order

## 🔍 Problem Summary
Write a solution to find all customers who never order anything.

Return the result table in any order.

---

# ✅ 解法 1：Baseline Solution（直覺）

### ✔ 思路
以 Customer table 為主合併 Orders table，
再將沒有訂單的客人名稱篩選出.

### ✔ 主要技巧
- LEFT JOIN / RIGHT JOIN
- WHERE o.id IS NULL: 篩選掉合併報表後 id 為 NULL 者.

### ✔ Time Complexity: O(N + M) 
where N is the number of rpw of the Orders table,
and M is the number of rpw of the Customers table.

### ✔ Space Complexity: O(1) 


---

# ✅ 解法 2：程式語意與題目較接近(利用 EXISTS)

### ✔ 思路
以 Customer table 為，將沒有訂單的客人名稱篩選出.

### ✔ 主要技巧
- NOT EXISTS: 判斷子查詢的結果有沒有回傳資料，若沒有則執行查詢中的結果
- SELECT 1: 回傳一列資料


### ✔ Time Complexity: O(N * M)
where N is the number of rpw of the Orders table,
and M is the number of rpw of the Customers table.

### ✔ Space Complexity: O(1) 


---

# 🚫 常見錯誤
- NOT IN Trap
如果篩選變數存在任何 NULL，則篩選結果會顯示全部不符合.


---
<!--  -->
<!-- # 🧠 思想誤區
- Thinking SQL executes row-by-row  
- Assuming window functions are O(1)  
- Believing subqueries are always slower   -->

<!-- --- -->
<!-- 
# 🧪 面試追問
1. What if tables are huge (100M rows)?
2. How would you index this schema?
3. Can you rewrite using window functions?
4. How does the query planner optimize this case? -->

<!-- --- -->
