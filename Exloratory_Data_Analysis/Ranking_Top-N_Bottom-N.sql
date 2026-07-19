-- 1) Which 5 products generate the highest revenue
SELECT
  p.product_name,
  SUM(f.sales_amount) AS total_revenue
FROM fact_sales AS f
LEFT JOIN dim_products AS p
ON f.product_key = p.product_key
GROUP BY p.product_name
ORDER BY total_revenue DESC
LIMIT 5;

-- WINDOW FUNCTIONS
SELECT *
FROM(SELECT
  p.product_name,
  SUM(f.sales_amount) AS total_revenue,
  ROW_NUMBER() OVER(ORDER BY SUM(f.sales_amount) DESC) AS rank_product
FROM fact_sales AS f
LEFT JOIN dim_products AS p ON f.product_key = p.product_key
GROUP BY p.product_name)t
WHERE rank_product <= 5;

-- 2) Which are the 5 worst performing products in terms of sales?
SELECT
  p.product_name,
  SUM(f.sales_amount) AS total_revenue
FROM fact_sales AS f 
LEFT JOIN dim_product AS p ON f.product_key = p.product_key
GROUP BY p.product_name
ORDER BY total_revenue ASC
LIMIT 5;

-- 3) find the top 10 customers who have generated the highest revenue
SELECT
  c.customer_key,
  c.first_name,
  c.last_name,
  SUM(f.sales_amount) AS total_revenue
FROM fact_sales AS f
LEFT JOIN dim_customers AS c ON f.customer_key = c.customer_key
GROUP BY   c.customer_key,
  c.first_name,
  c.last_name
ORDER BY total_revenue DESC
LIMIT 10;

-- 4) The 3 customers with the fewest orders placed 
SELECT
  c.customer_key,
  c.first_name,
  c.last_name,
  COUNT(f.order_number) AS total_orders
FROM fact_sales AS f
LEFT JOIN dim_customers AS c ON f.customer_key = c.customer_key
GROUP BY 
  c.customer_key,
  c.first_name,
  c.last_name
ORDER BY total_orders
LIMIT 3;
