# Subquery & Anti-Join Patterns

Queries that ask for “what is missing” are more common than they seem.

This section focuses on anti-join patterns such as `NOT EXISTS`,
which are frequently used to detect data gaps, incomplete records,
or exclusion rules in real datasets.

These problems helped me better understand:
- Why `LEFT JOIN ... IS NULL` can be risky
- How `EXISTS` behaves with large tables
- How query intent affects performance and correctness
