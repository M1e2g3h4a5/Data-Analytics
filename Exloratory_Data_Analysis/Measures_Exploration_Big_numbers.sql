/*
Calculate the key metric of the business (Big Numbers)
Highest Level of Aggregation | Lowest Level of Details

∑[Measure]

Ex. SUM(sales)
    AVG(price)
    SUM(Quantity)
*/

-- 1) Find the total Sales
SELECT SUM(sales_amount) AS total_sales
FROM fact_sales;

-- 2) Find how many items are sold
SELECT SUM(quantity) AS total_quantity
FROM fact_sales;

-- 3) find the average selling price
SELECT AVG(price) AS avg_price
FROM fact_sales;

-- 4) find the total number of orders
SELECT COUNT(order_number)
AS total_orders
FROM fact_sales;

-- Try to count the orders before and after using distinct to avoid adding the duplicate
SELECT COUNT(DISTINCT order_number)
AS total_orders
FROM fact_sales;

-- 5) find the total number of products
SELECT COUNT(product_name)
AS total_products
FROM dim_products;

-- Try to count the product before and after using distinct function to avoid adding the duplicate
SELECT COUNT(DISTINCT product_name)
AS total_products
FROM dim_products;

-- 6) find the total number of customers
SELECT COUNT(customer_key)
AS total_customers
FROM dim_customers;

-- 7) find the total number of customers that has placed an order
SELECT COUNT(DISTINCT customer_key)
AS total_customers
FROM fact_sales;

-- 8) Generate report that shows all key metrics of the business
SELECT 'Total sales' AS measure_name, SUM(sales_amount) AS measure_value FROM fact_sales
UNION ALL
SELECT 'Total Quantity', SUM(quantity) FROM fact_sales
UNION ALL
SELECT 'Average Price', AVG(price) FROM fact_sales
UNION ALL
SELECT 'Total Nr. Orders', COUNT(DISTINCT order_number) FROM fact_sales
UNION ALL
SELECT 'Total Nr. Products', COUNT(product_name) FROM dim_products
UNION ALL
SELECT 'Total Nr. Customers', COUNT(customer_key) FROM dim_customers;

/*
-----------------------------------------
| measure_name        |   measure_value |
-----------------------------------------
| Average Price       |  486.0378       |
| Total Nr. Customers |  18484.0000     |
| Total Nr. Orders    |  27659.0000     |
| Total Nr. Products  |  295.0000       |
| Total Quantity      |  60423.0000     |
| Total sales         |  29356250.0000  |
-----------------------------------------
*/
