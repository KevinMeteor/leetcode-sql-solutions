
# Rank Scores

## 🔍 Problem Summary
Write a solution to find the rank of the scores. The ranking should be calculated according to the following rules:

- The scores should be ranked from the highest to the lowest.
- If there is a tie between two scores, both should have the same ranking.
- After a tie, the next ranking number should be the next consecutive integer value. In other words, there should be no holes between ranks.

Return the result table ordered by score in descending order.

---

# ✅ 解法 1：Baseline Solution（直覺）

### ✔ 思路
直接利用  DENSE_RANK() 排名.

### ✔ 主要技巧
- DENSE_RANK()


### ✔ Time Complexity: O(N log N)
where N is the row of the Scores table.

### ✔ Space Complexity: O(N)
where N is the row of the Scores table.


---
# 🧠 思想誤區
- ROW_NUMBER()、RANK()、DENSE_RANK() 適用情境比較

| Function       | 同分是否相同名次 | 是否跳號 | 名次是否唯一 | 常見用途      |
| -------------- | -------- | ---- | ------ | --------- |
| `ROW_NUMBER()` | ❌ 否      | ❌ 否  | ✅ 是    | 排序後取第 N 筆 |
| `RANK()`       | ✅ 是      | ✅ 是  | ❌ 否    | 比賽名次（有並列） |
| `DENSE_RANK()` | ✅ 是      | ❌ 否  | ❌ 否    | 排行榜（不跳號）  |

- ROW_NUMBER()、RANK()、DENSE_RANK() Time / Space Complexity 比較
三者的 Complexity 相同，主要是差在功能性.

| Function       | Time       | Space | 原因 |
| -------------- | ---------- | ----- | --  |
| `ROW_NUMBER()` | O(N log N) | O(N)  | 排序 |
| `RANK()`       | O(N log N) | O(N)  | 排序 |
| `DENSE_RANK()` | O(N log N) | O(N)  | 排序 |


<!-- --- -->
<!--
 # 🚫 常見錯誤
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

---
