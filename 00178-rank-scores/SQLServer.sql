-- SQL Server (T-SQL) Solution for Rank Scores
/* Approach 1 */
SELECT score, 
       DENSE_RANK() OVER (ORDER BY score DESC) AS rank
FROM Scores;

