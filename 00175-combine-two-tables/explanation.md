# Combine Two Tables


## 🔍 Problem Summary
Write a solution to report the first name, last name, city, and state of each person in the Person table. If the address of a personId is not present in the Address table, report null instead.

Return the result table in any order.


# ✅ 解法 1：Signed Aggregation(最直觀)

### ✔ 思路
Person 為主表（一定要出現）；
Address 為輔表（若有對應的 personId 就連接，沒有就 NULL）

### ✔ 主要技巧
- LEFT JOIN

### ✔ Time Complexity: O(N+M) 
where N is the number of rows in the Person table and m is the number of rows in the Address table matching with personId.

### ✔ Space Complexity: O(N+M)
where N is the number of rows in the Person table and m is the number of rows in the Address table matching with personId.




# 🧠 思想誤區
- 使用 INNER JOIN: 沒有 Address 的 Person 會被排除，不合題目要求