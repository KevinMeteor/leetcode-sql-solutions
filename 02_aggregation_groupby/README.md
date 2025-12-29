# Aggregation & GROUP BY

Aggregation queries are where business logic usually starts to matter.

Small mistakes in `GROUP BY` or denominator definition can lead
to misleading metrics, even if the SQL runs without errors.

Problems in this section focus on:
- Choosing the right aggregation level
- Handling duplicates and NULL values
- Writing metrics that actually reflect the question being asked

This category is especially relevant for reporting and KPI-related work.
