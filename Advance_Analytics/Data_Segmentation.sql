/*
- Group the data based on a specific range
- Helps understand the correlation between two measures

[Measure] By [Measure]

Ex. Total products By Sales range
    Total Customers By Age
*/

-- 1) Segment products into cost ranges and count how many products fall into each segment
WITH product_segments AS 
(SELECT
  product_key,
  product_name,
  cost,
  CASE WHEN cost < 100 THEN 'Below 100'
      WHEN cost BETWEEN 100 AND 500 THEN '100-500'
      WHEN cost BETWEEN 500 AND 1000 THEN '500-1000'
      ELSE 'Above 1000'
  END cost_range
FROM dim_products)

SELECT
  cost_range,
  COUNT(product_key) AS total_product
FROM product_segments
GROUP BY cost_range
ORDER BY total_products DESC;

-- 2) Group customers into three segments based on their spending behaviour 
-- VIP : customers with at least 12 months of history and spending more than 5000
-- Regular : Customers with at least 12 month of history but spending 5000 or less
-- New : Customers with a lifespan less than 12 months
-- find the total number of customers by each group
WITH customer_spending AS (
SELECT
	c.customer_key,
    SUM(f.sales_amount) AS total_spending,
    MIN(order_date) AS first_order,
    MAX(order_date) AS last_order,
    PERIOD_DIFF(EXTRACT(YEAR_MONTH FROM MAX(order_date)), EXTRACT(YEAR_MONTH FROM MIN(order_date))) AS lifespan
FROM fact_sales AS f
LEFT JOIN dim_customers AS c
ON f.customer_key = c.customer_key
GROUP BY c.customer_key)

SELECT
	customer_segment, 
    COUNT(customer_key) AS total_customer
FROM(
SELECT
	customer_key,
    total_spending,
    lifespan,
    CASE WHEN lifespan >= 12 AND total_spending > 5000 THEN 'VIP'
		    WHEN lifespan >= 12 AND  total_spending <= 5000 THEN 'Regular'
        ELSE 'New'
	  END customer_segment
FROM customer_spending)T
GROUP BY customer_segment
ORDER BY total_customer DESC;
