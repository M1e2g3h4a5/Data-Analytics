/*
  Aggregate the data progressively over time.
  Helps to understand whether our business is growing or declining

∑ [Cumulative Measure] By [Date Dimension]
Ex. Running Total Sales By Year
    Moving Average of Sales By Month
*/

-- 1) Calculate the total sales per month and the running total of sales over time
-- cumulative sum : adding each row's value to the sum of all the previous row's values
-- default window frame : BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
SELECT 
  order_date,
  total_sales,
  SUM(total_sales) OVER(ORDER BY order_date) AS running_total
FROM(SELECT
  DATE_FORMAT(order_date, '%Y-%m-01') AS order_date,
  SUM(sales_amount) AS total_sales
FROM fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATE_FORMAT(order_date, '%Y-%m-01'))t;

-- 2) Calculate the total sales per year and the running total of sales over time
SELECT
  order_date,
  total_sales,
  SUM(total_sales) OVER(PARTITION BY order_date ORDER BY order_date) AS running_total_sales
FROM
(SELECT
    DATE_FORMAT(order_date, '%Y') AS order_date,
    SUM(sales_amount) AS total_sales
  FROM fact_sales
  WHERE order_date IS NOT NULL
  GROUP BY DATE_FORMAT(order_date, '%Y')
)t;

-- 3) calculate the total sales per year, average price and total sales over time
SELECT
  order_date,
  total_sales,
  SUM(total_sales) OVER(ORDER BY order_date) AS running_total_sales,
  AVG(avg_price) OVER(ORDER BY order_date) AS moving_avg
FROM
(SELECT
    DATE_FORMAT(order_date, '%Y') AS order_date,
    SUM(sales_amount) AS total_sales,
    AVG(price) AS avg_price
  FROM fact_sales
  WHERE order_date IS NOT NULL
  GROUP BY DATE_FORMAT(order_date, '%Y')
)t;
