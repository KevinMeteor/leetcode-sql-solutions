
# Managers with at Least 5 Direct Reports

## 🔍 Problem Summary
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| department  | varchar |
| managerId   | int     |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table indicates the name of an employee, their department, and the id of their manager.
If managerId is null, then the employee does not have a manager.
No employee will be the manager of themself.

Compute fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places.
Write a solution to find managers with at least five direct reports.

Return the result table in any order.

The result format is in the following example.

 

# ✅ 解法 1：INNER JOIN（直覺、可讀）

### ✔ 思路
1. 先選出 managerId >= 5 的 managerId 
2. 再重所有人中選出 managerId 對應的 id 下的 name

SELECT name 
FROM Employee 
WHERE id IN (
    SELECT managerId 
    FROM Employee 
    GROUP BY managerId 
    HAVING COUNT(managerId) >= 5)

### ✔ 主要技巧
- GROUP BY
- HAVING 

### ✔ Time Complexity: O(N) or O(N^2)
= 若 IN 轉成 hash set → O(N)
= 最壞（無優化） → O(N^2)

### ✔ Space Complexity: O(N) 


---

# ✅ 解法 2：INNER JOIN

### ✔ 思路
1. 子查詢，以子表為主收尋特定指定條件，輸出 key 值
2. 外層查，以 key 值再收尋父表，得出結果


SELECT e1.name
FROM Employee AS e1 
INNER JOIN Employee AS e2 ON e1.id=e2.managerId 
GROUP BY e2.managerId 
HAVING COUNT(e2.managerId) >= 5

### ✔ 主要技巧
- INNER JOIN
- GROUP BY
- HAVING

# 🚫 常見錯誤
1. GROUP BY、HAVING 後接資料表設定錯，應選擇 e2.
2. 沒下屬的 manager 本來就不會符合條件，所以 LEFT JOIN 沒意義，但會讓語意變模糊.


### ✔ Time Complexity: O(N) or O(N^2)
JOIN：
= 有 index → O(N)
= 無 index → Nested loop → O(N^2)

GROUP BY：O(N)

### ✔ Space Complexity: O(N) 

---

# ✅ 解法 3：JOIN(先篩選，再 JOIN)

SELECT e.name  
FROM Employee e  
JOIN  
    (  
        SELECT managerId  
        FROM Employee  
        GROUP BY managerId  
        HAVING COUNT(*) >= 5  
    ) temp  
    ON e.id = temp.managerId;  

### ✔ 思路
1. 如果資料量大，先篩選掉非重要資料列是影響查詢速度的關鍵，
所以先篩選，再 JOIN .

---

### ✔ Time Complexity: O(N) or O(N^2)
子查詢 GROUP BY：O(N)

JOIN：
= 有 index → O(N)
= 無 index → Nested loop → O(N^2)



### ✔ Space Complexity: O(N) 



---

<!-- # 🚫 常見錯誤
- ROUND() 在 T-SQL 會整數除法，需乘上 1.0 確保為浮點數.
- CTE 只能有一個 WITH，多個 CTE 要用逗號隔開，不要寫成兩個或多個 WITH.
- 計算 fracction 的分母不應 GROUP BY，因為會產生多列查詢而非單一 scalar. -->

<!-- --- -->
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

<!-- --- -->
