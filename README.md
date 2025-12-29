# SQL Data Analytics Portfolio

This repository showcases my SQL skills for Data Analyst roles, 
with a focus on solving real-world analytical and business problems.

Rather than emphasizing algorithmic difficulty, 
the queries in this project demonstrate how SQL is used for:
- KPI reporting
- Financial aggregation
- User behavior analysis
- Time-based trend analysis

---

## 🧠 Core SQL Skills

- Multi-table JOINs and subqueries
- Aggregation and KPI calculation
- Window functions (ROW_NUMBER, RANK)
- Time-based analysis (monthly metrics)
- Translating business questions into SQL logic

---

## 📂 Project Files

- **MySQL.sql**  
  SQL solutions written in MySQL syntax

- **SQLServer.sql**  
  Equivalent solutions adapted for SQL Server (T-SQL)

- **explanation.md**  
  Business context and analytical explanation for selected queries

---

## 📊 Business-Oriented Case Examples

### Monthly Transaction Analysis
Aggregates transaction counts and approved amounts by month and country.  
Common real-world use cases:
- Financial reporting
- Operational dashboards
- Management summaries

### Capital Gain / Loss Calculation
Calculates profit and loss from buy and sell transaction records.  
Common real-world use cases:
- Trading PnL reports
- Investment performance tracking

### User Activity & Retention Analysis
Analyzes user behavior using window functions.  
Common real-world use cases:
- Product usage analysis
- Retention and churn metrics

---

## 🛠 SQL Dialects

This project includes solutions in:
- **MySQL**
- **SQL Server (T-SQL)**

Queries are adapted to account for syntax differences 
such as date handling and conditional aggregation.

---

## 🎯 Why This Repository

This portfolio is designed to reflect how SQL is actually used in Data Analyst roles:
- Queries prioritize readability and maintainability
- Business logic is clearly documented
- Solutions are interview-ready and explainable

---

## 📎 Notes

- SQL files include comments describing the analytical purpose
- Selected queries are explained in `explanation.md`
- Problems are chosen to reflect common analytics scenarios


---

## 📁 Folder Structure
leetcode-sql-solutions-main/
│
├─ README.md                        
├─ .gitignore
├─ .git
├─ .vscode/                       
│
├─ 01_basic_select_join/
│   ├─ README.md
│   ├─ 00175-combine-two-tables/
│   │   ├─ explanation.md
│   │   ├─ MySQL.sql
│   │   └─ SQLServer.sql
│   ├─ 00178-rank-scores/
│   │   ├─ explanation.md
│   │   ├─ MySQL.sql
│   │   └─ SQLServer.sql
│   ├─ 00181-employees-earning-more-than-their-managers/
│   │   ├─ explanation.md
│   │   ├─ MySQL.sql
│   │   └─ SQLServer.sql
│   ├─ 00570-managers-with-at-least-5-direct-reports/
│   │   ├─ explanation.md
│   │   ├─ MySQL.sql
│   │   └─ SQLServer.sql
│   └─ 00620-not-boring-movies/
│       ├─ explanation.md
│       ├─ MySQL.sql
│       └─ SQLServer.sql
│
├─ 02_aggregation_groupby/
│   ├─ README.md
│   ├─ 00176-second-highest-salary/
│   │   ├─ explanation.md
│   │   ├─ MySQL.sql
│   │   └─ SQLServer.sql
│   ├─ 01193-monthly-transactions-i/
│   │   ├─ explanation.md
│   │   ├─ MySQL.sql
│   │   └─ SQLServer.sql
│   ├─ 01211-queries-quality-and-percentage/
│   │   ├─ explanation.md
│   │   ├─ MySQL.sql
│   │   └─ SQLServer.sql
│   └─ 01393-capital-gain-or-loss/
│       ├─ explanation.md
│       ├─ MySQL.sql
│       └─ SQLServer.sql
│
├─ 03_subquery_anti_join/
│   ├─ README.md
│   └─ 00183-customers-who-never-order/
│       ├─ explanation.md
│       ├─ MySQL.sql
│       └─ SQLServer.sql
│
├─ 04_window_functions/
│   ├─ README.md
│   ├─ 00184-department-highest-salary/
│   │   ├─ explanation.md
│   │   ├─ MySQL.sql
│   │   └─ SQLServer.sql
│   ├─ 00185-department-top-three-salaries/
│   │   ├─ explanation.md
│   │   ├─ MySQL.sql
│   │   └─ SQLServer.sql
│   ├─ 00550-game-play-analysis-iv/
│   │   ├─ explanation.md
│   │   ├─ MySQL.sql
│   │   └─ SQLServer.sql
│   └─ 01141-user-activity/
│       ├─ explanation.md
│       ├─ MySQL.sql
│       └─ SQLServer.sql
│
├─ 05_time_series_analysis/
│   ├─ README.md
│   ├─ 00197-rising-temperature/
│   │   ├─ explanation.md
│   │   ├─ MySQL.sql
│   │   └─ SQLServer.sql
│   ├─ 00511-game-play-analysis-i/
│   │   ├─ explanation.md
│   │   ├─ MySQL.sql
│   │   └─ SQLServer.sql
│   ├─ 01174-immediate-food-delivery-ii/
│   │   ├─ explanation.md
│   │   ├─ MySQL.sql
│   │   └─ SQLServer.sql
│   └─ 01321-restaurant-growth/
│       ├─ explanation.md
│       ├─ MySQL.sql
│       └─ SQLServer.sql
