# ecommerce-customer-behavior-revenue-analysis
E-commerce customer behavior and revenue analysis using MySQL, SQL, Power BI, and DAX with synthetic data.
# E-commerce Customer Behavior & Revenue Analysis

## Project Overview

This project analyzes customer purchasing behavior, sales revenue, order trends, and payment performance for an Indian e-commerce business using **MySQL, SQL, Power BI, and DAX**.

The objective is to transform transactional data into meaningful business insights that help understand customer engagement, revenue performance, repeat purchases, and payment success.

## Business Objectives

- Analyze total revenue and order performance.
- Identify high-performing products and product categories.
- Understand customer purchasing patterns and repeat purchases.
- Evaluate average order value and payment success rate.
- Analyze revenue trends and identify opportunities for business improvement.
- Build an interactive Power BI dashboard to support data-driven decision-making.

## Tools & Technologies

- **MySQL:** Relational database design and data storage.
- **SQL:** Joins, aggregate functions, subqueries, CTEs, and data validation.
- **Power BI:** Interactive dashboards and business reporting.
- **DAX:** KPI calculations and analytical measures.
- **Power Query:** Data cleaning, transformation, and preparation.
- **Excel:** Data inspection and validation.

## Database Schema

The project uses six relational tables:

| Table | Description |
|---|---|
| `customers` | Customer details and registration information |
| `categories` | Product category information |
| `products` | Product names, categories, and prices |
| `orders` | Order dates, customers, and order statuses |
| `order_items` | Products, quantities, and item-level order values |
| `payments` | Payment methods, amounts, and payment statuses |

Primary and foreign key relationships connect customers, orders, products, order items, and payments.

## Key Performance Indicators (KPIs)

The Power BI dashboard tracks five key performance indicators to evaluate sales performance and customer behavior:

1. **Total Orders:** Total number of orders placed.
2. **Total Customers:** Number of distinct customers who placed orders.
3. **Completed Revenue:** Total revenue generated from completed orders.
4. **Average Order Value (AOV):** Average completed-order revenue per eligible order.
5. **Return Rate:** Percentage of orders or items returned, based on the return definition used in the analysis.

## SQL Analysis

SQL is used to:

- Create relational tables and define primary and foreign keys.
- Insert and validate transactional records.
- Join multiple tables to analyze customer purchases and revenue.
- Use aggregate functions to calculate sales and order metrics.
- Apply subqueries and CTEs to solve business questions.
- Identify repeat customers and high-performing products.
- Analyze order statuses and payment success.
- Check for duplicate records, missing values, invalid relationships, and inconsistent amounts.

## Power BI Dashboard

The interactive dashboard includes analysis of:

- Revenue, total orders, average order value, repeat purchase rate, and payment success rate.
- Revenue trends over time.
- Revenue by product category.
- Top-performing products.
- Customer purchasing behavior.
- Order status distribution.
- Payment methods and payment status.
- Interactive slicers for relevant dates, categories, and order statuses.

## Business Questions Answered

1. How much revenue does the business generate?
2. How does revenue change over time?
3. Which products and categories contribute the most revenue?
4. How many customers make repeat purchases?
5. What is the average order value?
6. Which payment methods are most frequently used?
7. What proportion of payment attempts are successful?
8. Which areas offer opportunities to improve business performance?

## Business Value

The analysis helps identify revenue drivers, understand customer loyalty, evaluate payment performance, and prioritize products and categories for further investigation.
## Project Structure

```text
ecommerce-customer-behavior-revenue-analysis/
│
├── README.md
├── sql/
│   ├── 01_create_tables_and_insert_data.sql
│   ├── 02_data_validation.sql
│   └── 03_business_analysis.sql
│
├── power-bi/
│   └── ecommerce_dashboard.pbix
│
└── screenshots/
    └── dashboard-overview.png
```

## Skills Demonstrated

- Relational database design
- SQL querying and data analysis
- Data cleaning and validation
- Customer and revenue analytics
- KPI development using DAX
- Power Query transformations
- Interactive dashboard development
- Business insight generation

## Author

**Bindu Sree Guddeti**

GitHub: [Bindusree2005](https://github.com/Bindusree2005)
