-- Identifying the unique values (or categories) in each dimension
-- Recognizing how data might be grouped or segmented, which is useful for later analysis

-- 1) Explore all countries our customers come from (DISTINCT)
SELECT DISTINCT country
FROM dim_customers;

-- 2) Explore all the product categories "The major divisions"
SELECT DISTINCT category
FROM dim_products;

SELECT DISTINCT category, subcategory
FROM dim_products;

SELECT DISTINCT category, subcategory, product_name 
FROM dim_products;
