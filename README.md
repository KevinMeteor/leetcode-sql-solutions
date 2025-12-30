# SQL Data Analytics Portfolio

This repository is a curated SQL portfolio designed for **Data Analyst roles**.

Instead of focusing on algorithmic puzzles, the queries here reflect
how SQL is actually used in analytics work — turning business questions
into clear, maintainable, and explainable queries.

The problems are organized by **SQL patterns commonly used in real projects**,
such as reporting, KPI calculation, user behavior analysis, and time-based metrics.

---

## 🔍 What This Portfolio Demonstrates

- Translating business questions into SQL logic
- Writing readable and maintainable analytical queries
- Handling edge cases such as duplicates, NULLs, and missing records
- Adapting SQL logic across different database dialects

---

## 🧠 Core SQL Skills

- Multi-table JOINs and subqueries  
- Aggregation and KPI calculation  
- Window functions (`ROW_NUMBER`, `RANK`, `DENSE_RANK`)  
- Time-based analysis (day-over-day, monthly metrics)  
- Business-oriented query design  

---

## 📂 Repository Structure (By SQL Pattern)

Each section focuses on a specific SQL pattern frequently used in analytics work.

- **[01_basic_select_join](./01_basic_select_join)**  
  Fundamental querying and join logic.  
  *Building correct joins before solving complex problems.*

- **[02_aggregation_groupby](./02_aggregation_groupby)**  
  Aggregation and KPI-style queries.  
  *Common patterns for reporting, metrics, and summaries.*

- **[03_subquery_anti_join](./03_subquery_anti_join)**  
  Anti-join and exclusion logic using `EXISTS` / `NOT EXISTS`.  
  *Finding missing records and handling data gaps safely.*

- **[04_window_functions](./04_window_functions)**  
  Analytical queries using window functions.  
  *Ranking, top-N per group, and user behavior analysis.*

- **[05_time_series_analysis](./05_time_series_analysis)**  
  Time-based and trend analysis.  
  *Day-over-day comparison, retention-style logic, and growth metrics.*

Each problem folder contains:
- `explanation.md` — analytical reasoning and business context  
- `MySQL.sql` — solution in MySQL syntax  
- `SQLServer.sql` — equivalent solution in SQL Server (T-SQL)

---

## 📊 Selected Business-Oriented Examples

### Monthly Transaction Analysis  
Aggregates transaction counts and approved amounts by month and country.  
Typical use cases:
- Financial reporting  
- Operational dashboards  
- Management summaries  

### Capital Gain / Loss Calculation  
Computes realized profit and loss from buy/sell transaction records.  
Typical use cases:
- Trading PnL reports  
- Investment performance tracking  

### User Activity & Retention Analysis  
Uses window functions to analyze user behavior over time.  
Typical use cases:
- Product usage analysis  
- Retention and churn metrics  

---

## 🛠 SQL Dialects

Solutions are provided in:
- **MySQL**
- **SQL Server (T-SQL)**

Queries are adapted to account for syntax differences,
particularly in date handling and conditional aggregation.

---

## 🎯 Why This Repository

This portfolio is intentionally structured to reflect **real Data Analyst work**:

- Queries prioritize clarity over cleverness  
- Business logic is explicitly documented  
- Each solution is interview-ready and explainable  

Rather than showcasing how many problems were solved,
the focus is on **how problems are approached and communicated**.

---

## 📎 Notes

- SQL files include comments explaining analytical intent  
- `explanation.md` documents design choices and trade-offs  
- Problems are selected to mirror common analytics scenarios  

---


📌 **This repository is actively maintained and intended for interview discussion.**

---

This portfolio is prepared for:
- Data Analyst
- Business Intelligence Analyst
- Analytics Engineer
- Entry / Mid-level Data Scientist (SQL-heavy roles)

---

## 📬 About Me

- Background: Statistics / Finance / Cost Analysis
- Interested in: Data analytics, business insights, SQL optimization
- GitHub: https://github.com/KevinMeteor


