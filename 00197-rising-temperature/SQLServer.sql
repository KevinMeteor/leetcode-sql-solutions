-- SQL Server (T-SQL) Solution for Rising Temperature

/* ... */
select today.id
from weather as yesterday
cross join weather as today
where today.temperature - yesterday.temperature > 0
and datediff(day, yesterday.recordDate, today.recordDate) = 1