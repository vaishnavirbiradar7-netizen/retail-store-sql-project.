SQL Portfolio project

## Sample Output
   [Project running successfully in MySQL Workbench](project-running-screenshot.png)

## What this project demonstrates

- **Database design**: normalized schema with primary/foreign keys, constraints, and indexes
- **DML**: realistic sample data across 6 related tables
- **Querying**: `SELECT`, `WHERE`, `ORDER BY`, `GROUP BY`, `HAVING`
- **Joins**: `INNER JOIN`, `LEFT JOIN` across multiple tables
- **Subqueries**: nested and correlated queries
- **CTEs**: `WITH` clauses for readable, multi-step logic
- **Window functions**: `RANK()`, running totals with `SUM() OVER()`
- **Views**: a reusable `customer_order_summary` view
- **Stored procedures**: a parameterized procedure to fetch order details
- **CASE statements**: customer segmentation logic

## Entity-Relationship Overview

```
categories ──┬──< products ──┬──< order_items >── orders >── customers
             │                │                        │
             │                │                        └──< employees
```

- One **category** has many **products**
- One **product** can appear in many **order_items**
- One **order** has many **order_items** (line items)
- One **customer** places many **orders**
- One **employee** processes many **orders**

## Files

| File | Purpose |
|---|---|
| `01_schema.sql` | Creates the database and all 6 tables with constraints & indexes |
| `02_sample_data.sql` | Inserts realistic sample data (8 categories, 20 products, 15 customers, 4 employees, 30 orders, 38 order line items) |
| `03_analysis_queries.sql` | 15 business questions answered with SQL, ordered from basic → advanced |

## How to run

1. Install MySQL (or MySQL Workbench / any MySQL-compatible client).
2. Run the files **in order**:
   ```bash
   mysql -u root -p < 01_schema.sql
   mysql -u root -p < 02_sample_data.sql
   mysql -u root -p < 03_analysis_queries.sql
   ```
   Or just open each file in MySQL Workbench and execute top to bottom.

**Using PostgreSQL instead?** Two changes needed in `01_schema.sql`:
- Replace `AUTO_INCREMENT` with `SERIAL` (or `GENERATED ALWAYS AS IDENTITY`)
- Remove the `USE retail_store;` lines and instead `\c retail_store` after creating the DB
- In `03_analysis_queries.sql`, replace `DATE_FORMAT(order_date, '%Y-%m')` with `TO_CHAR(order_date, 'YYYY-MM')`, and rewrite the stored procedure using PL/pgSQL syntax (or skip it — everything else works as-is).


## Possible extensions "what we can add"

- A `payments` table to track payment method and transaction status
- A `returns` table for handling product returns/refunds
- Triggers to auto-update `stock_quantity` when an order is placed
- A `discounts`/`coupons` table and logic to apply them
- Partitioning the `orders` table by year for performance at scale
