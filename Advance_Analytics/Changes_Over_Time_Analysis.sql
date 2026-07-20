/*
Changes that occurs in trends, data, or business over time

∑[Measure] By [Date Dimension]

Ex. Total Sales By Year
    Average Cost By Month
*/

-- 1) Analyze sales performance over time

/*
  Changes Over Year: 
      A high level overview insights that helps with strategic decision making
*/

SELECT 
  YEAR(order_date) AS order_year,
  SUM(sales_amount) AS total_sales,
  COUNT(DISTINCT customer_key) AS total_customers,
  SUM(quantity) AS total_quantity
FROM fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date) 
ORDER BY YEAR(order_date);

-- Analysis over date
SELECT
  DATE_FORMAT(order_date, '%Y-%m-01') AS order_date,
  SUM(sales_amount) AS total_sales,
  COUNT(DISTINCT customer_key) AS total_customers,
  SUM(quantity) AS total_quantity
FROM fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATE_FORMAT(order_date, '%Y-%m-01') 
ORDER BY DATE_FORMAT(order_date, '%Y-%m-01');

/*
  Changes Over Months: 
      Detailed insight to discover seasonality in your data
*/

SELECT 
  MONTH(order_date) AS order_year,
  SUM(sales_amount) AS total_sales,
  COUNT(DISTINCT customer_key) AS total_customers,
  SUM(quantity) AS total_quantity
FROM fact_sales
WHERE order_date IS NOT NULL
GROUP BY MONTH(order_date) 
ORDER BY MONTH(order_date);
