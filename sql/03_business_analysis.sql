-- Business questions
-- 1) Total Revenue
SELECT
    ROUND(SUM(oi.quantity * oi.unit_price), 2)
        AS total_revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'Completed';

-- 2) Monthly revenue trend
SELECT
    DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
    ROUND(SUM(oi.quantity * oi.unit_price), 2)
        AS monthly_revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'Completed'
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
ORDER BY sales_month;

-- 3) Best selling product categories
SELECT
    c.category_name,
    SUM(oi.quantity) AS units_sold,
    ROUND(SUM(oi.quantity * oi.unit_price), 2)
        AS revenue
FROM categories c
JOIN products p
    ON c.category_id = p.category_id
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Completed'
GROUP BY c.category_name
ORDER BY revenue DESC;

-- 4) Top 10 customers by revenue
SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.quantity * oi.unit_price), 2)
        AS customer_revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'Completed'
GROUP BY c.customer_id, c.customer_name, c.city
ORDER BY customer_revenue DESC
LIMIT 10;

-- 5) Repeat customer analysis
SELECT
    c.customer_id,
    c.customer_name,
    COUNT(DISTINCT o.order_id) AS completed_orders
FROM customers 
JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_status = 'Completed'
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(DISTINCT o.order_id) >= 2
ORDER BY completed_orders DESC;

-- 6) Rank products with in each category
WITH product_sales AS (
    SELECT
        c.category_name,
        p.product_name,
        SUM(oi.quantity * oi.unit_price) AS revenue
    FROM categories c
    JOIN products p
        ON c.category_id = p.category_id
    JOIN order_items oi
        ON p.product_id = oi.product_id
    JOIN orders o
        ON oi.order_id = o.order_id
    WHERE o.order_status = 'Completed'
    GROUP BY c.category_name, p.product_name
),
ranked_products AS (
    SELECT
        category_name,
        product_name,
        revenue,
        DENSE_RANK() OVER (
            PARTITION BY category_name
            ORDER BY revenue DESC
        ) AS product_rank
    FROM product_sales
)
SELECT *
FROM ranked_products
WHERE product_rank <= 3
ORDER BY category_name, product_rank;

-- Check per multiple payments per order
SELECT
    order_id,
    COUNT(*) AS payment_count,
    SUM(amount) AS total_payment
FROM payments
GROUP BY order_id
HAVING COUNT(*) > 1;

--  check order status
SELECT
    order_status,
    COUNT(*) AS order_count,
    SUM(oi.quantity * oi.unit_price) AS item_revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY order_status
ORDER BY order_count DESC;

-- check payment status
SELECT
    payment_status,
    COUNT(*) AS payment_count,
    SUM(amount) AS payment_amount
FROM payments
GROUP BY payment_status
ORDER BY payment_count DESC;

USE shopease_analytics;

SHOW CREATE TABLE categories;
SHOW CREATE TABLE customers;
SHOW CREATE TABLE products;
SHOW CREATE TABLE orders;
SHOW CREATE TABLE order_items;
SHOW CREATE TABLE payments;

-- Check whether any orders have multiple payment records
SELECT
    order_id,
    COUNT(*) AS payment_count,
    SUM(amount) AS total_payment
FROM payments
GROUP BY order_id
HAVING COUNT(*) > 1;

-- Calculate the initial sales revenue
SELECT
    SUM(quantity * unit_price) AS gross_item_revenue
FROM order_items;

-- validate order and payment status combinations
SELECT
    o.order_status,
    p.payment_status,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.quantity * oi.unit_price) AS item_revenue,
    SUM(p.amount) AS payment_amount
FROM orders o
JOIN payments p
    ON o.order_id = p.order_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY
    o.order_status,
    p.payment_status
ORDER BY
    o.order_status,
    p.payment_status;



