-- EXPLORATORY DATA ANALYSIS

USE superstore_analysis;

-- QUESTION 1:
-- What are the total sales and total profit?

SELECT
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM orders;

-- QUESTION 2:
-- How many unique orders and customers exist?

SELECT
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers
FROM orders;

-- QUESTION 3:
-- Compare sales and profit by product category.

SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM orders
GROUP BY category
ORDER BY total_sales DESC;

-- QUESTION 4:
-- Compare sales and profit across regions.

SELECT
    region,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM orders
GROUP BY region
ORDER BY total_sales DESC;

