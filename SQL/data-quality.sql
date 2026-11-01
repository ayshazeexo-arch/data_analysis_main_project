-- Data_Quality

USE superstore_analysis;

-- STEP 1: CHECK TOTAL RECORDS
-- Verify the number of records in each table.

SELECT COUNT(*) AS total_orders
FROM orders;

SELECT COUNT(*) AS total_people
FROM people;

SELECT COUNT(*) AS total_returns
FROM returns;

-- STEP 2: CHECK MISSING VALUES IN ORDERS

SELECT
    SUM(CASE WHEN row_id IS NULL THEN 1 ELSE 0 END) AS missing_row_id,
    SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS missing_order_id,
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS missing_customer_id,
    SUM(CASE WHEN sales IS NULL THEN 1 ELSE 0 END) AS missing_sales,
    SUM(CASE WHEN profit IS NULL THEN 1 ELSE 0 END) AS missing_profit
FROM orders;

-- STEP 3: CHECK DUPLICATE ROW IDs

SELECT
    row_id,
    COUNT(*) AS duplicate_count
FROM orders
GROUP BY row_id
HAVING COUNT(*) > 1;

-- CHECK DUPLICATE RETURNED ORDER IDs

SELECT
    order_id,
    COUNT(*) AS duplicate_count
FROM returns
GROUP BY order_id
HAVING COUNT(*) > 1;

-- STEP 4: VALIDATE NUMERICAL VALUES

SELECT
    SUM(CASE WHEN sales <= 0 THEN 1 ELSE 0 END) AS invalid_sales,
    SUM(CASE WHEN quantity <= 0 THEN 1 ELSE 0 END) AS invalid_quantity,
    SUM(CASE WHEN discount < 0 OR discount > 1 THEN 1 ELSE 0 END) AS invalid_discount,
    SUM(CASE WHEN profit IS NULL THEN 1 ELSE 0 END) AS missing_profit
FROM orders;

-- STEP 5: CHECK DATE CONSISTENCY

SELECT *
FROM orders
WHERE ship_date < order_date;

-- STEP 6: VALIDATE REGION RELATIONSHIP

SELECT DISTINCT o.region
FROM orders o
LEFT JOIN people p
    ON o.region = p.region
WHERE p.region IS NULL;

-- VALIDATE RETURNED ORDER IDs

SELECT r.order_id
FROM returns r
LEFT JOIN orders o
    ON r.order_id = o.order_id
WHERE o.order_id IS NULL;
