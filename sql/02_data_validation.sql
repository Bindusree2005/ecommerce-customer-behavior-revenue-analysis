-- QUICK VALIDATION
SELECT 'customers' AS table_name, COUNT(*) AS row_count FROM customers
UNION ALL SELECT 'categories', COUNT(*) FROM categories
UNION ALL SELECT 'products', COUNT(*) FROM products
UNION ALL SELECT 'orders', COUNT(*) FROM orders
UNION ALL SELECT 'order_items', COUNT(*) FROM order_items
UNION ALL SELECT 'payments', COUNT(*) FROM payments;

-- Baseline revenue: completed orders only; do not join payments into this query.
SELECT ROUND(SUM(oi.quantity * oi.unit_price), 2) AS completed_order_revenue
FROM orders o JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Completed';

USE shopease_analytics;

SELECT COUNT(*) AS total_customers
FROM customers;

SELECT COUNT(*) AS total_orders
FROM orders;

SELECT order_status, COUNT(*) AS order_count
FROM orders
GROUP BY order_status;

