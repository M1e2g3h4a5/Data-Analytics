/*
- Analyze how an idividual part is performing compared to the overall
- allowing us to understand which category has the greatest impact on the business

( [Measure] / Total[Measure] ) * 100 By [Dimension]

Ex. (Sales / Total Sales) * 100 By Category
    (Quantity / Total Quantity) * 100 By Country
*/

-- 1) Which Categories contribute the most to overall sales?
WITH category_sales AS
(SELECT
  category,
  SUM(sales_amount) AS total_sales
FROM fact_Sales AS f
LEFT JOIN dim_products AS p
ON p.product_key = f.product_key
GROUP BY category)

SELECT
  category,
  total_sales,
  SUM(total_sales) OVER() AS overall_sales,
  CONCAT(ROUND((total_sales / SUM(total_sales) OVER()) * 100, 2),'%') AS percentage_of_total
FROM category_sales
ORDER BY total_sales DESC;

