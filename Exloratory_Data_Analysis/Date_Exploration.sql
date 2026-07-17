/*
Identify the earliest and latest dates(boundaries).
Understand the scope of data and the timespan 

MIN/MAX[Date Dimension]

Ex. MIN order_date
    MAX create_date
    MIN Birthdate
*/

-- 1) find the date of the fist and last order
-- 2) how many years of sales are available
SELECT
  MIN(order_date) AS first_order_date,
  MAX(order_date) AS last_order_date,
  TIMESTAMPDIFF(YEAR, MIN(order_date), MAX(order_date)) AS order_range_year
FROM fact_sales;

-- 3) find the youngest and the oldest customer
SELECT
	MIN(birthdate) AS oldest_birthdate,
  TIMESTAMPDIFF(YEAR, MIN(birthdate), CURRENT_DATE()) AS oldest_age,
  MAX(birthdate) AS youngest_birthdate,
	TIMESTAMPDIFF(YEAR, MAX(birthdate), CURRENT_DATE()) AS youngest_age
FROM dim_customers;
