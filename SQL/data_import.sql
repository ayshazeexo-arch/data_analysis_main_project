-- =========================================
-- SUPERSTORE SALES ANALYSIS
-- DATABASE CREATION
-- =========================================

-- Create database for the project

CREATE DATABASE superstore_analysis;

-- Select the database

USE superstore_analysis;

CREATE TABLE orders (
    row_id INT,
    order_id VARCHAR(50),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(50),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255),
    sales DECIMAL(12,2),
    quantity INT,
    discount DECIMAL(5,2),
    profit DECIMAL(12,2)
);

CREATE TABLE people (
    regional_manager VARCHAR(100),
    region VARCHAR(50)
);

CREATE TABLE returns (
    order_id VARCHAR(50),
    returned VARCHAR(10)
);

USE ayshatrail;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/orders.csv'
INTO TABLE orders
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/people.csv'
INTO TABLE people
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/returns.csv'
INTO TABLE returns
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- Check Orders records
SELECT COUNT(*) FROM orders;

-- Check People records
SELECT COUNT(*) FROM people;

-- Check Returns records
SELECT COUNT(*) FROM returns;

-- Preview Orders
SELECT * FROM orders LIMIT 10;

-- Preview People
SELECT * FROM people;

-- Preview Returns
SELECT * FROM returns LIMIT 10;
