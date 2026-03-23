  CREATE DATABASE zepto_sql_project;
  
  use zepto_sql_project;
  
-- TABLE CREATION

CREATE TABLE zepto(
sku_id SERIAL PRIMARY KEY,
category VARCHAR (100),
name VARCHAR(100) NOT NULL,
mrp NUMERIC(8,2),
discountpercent NUMERIC(5,2),
availablequantity INT,
discountedsellingprice NUMERIC (8,2),
weightIngms INT,
outofstock BOOLEAN,
quantity INT
);

 -- data exploration
 
 -- count of rows
 SELECT COUNT(*) 
 FROM zepto;
 
 -- sample data 
 SELECT * FROM zepto;
 
 -- null values
 SELECT * FROM zepto
 WHERE name IS NULL;
 
 -- different product categories
 SELECT DISTINCT category
 FROM zepto;
 
 -- product in stock vs out of stock
 SELECT outofstock ,count(sku_id)
 FROM zepto
 GROUP BY outofstock;
 
 -- product name present multiple times
 SELECT name, COUNT(sku_id) as 'number of stock'
 FROM zepto
 GROUP BY name
 HAVING COUNT(sku_id)>1
 ORDER BY count(sku_id) DESC;
 
 -- data cleaning
 
 -- product with price is =0
 SELECT *FROM zepto
 WHERE mrp = 0 or discountedsellingprice =0;
 
 DELETE FROM zepto
 WHERE mrp =0;
 
 -- convert paise to rupees
 UPDATE zepto
 SET mrp = mrp/100.0,
 discountedsellingprice = discountedsellingprice/100.0;
 
-- Q1.find the top 10 value products based on the discount percentage.
SELECT DISTINCT name, mrp, discountPercent
FROM zepto
ORDER BY  discoutPercent DESC
LIMIT 10;

-- Q2.what are the products with high MRP but out of stock.
SELECT DISTINCT name, mrp
FROM zepto
WHERE outofstock = true AND mrp < 300
ORDER BY mrp DESC;

-- Q3.calculate estimated revenue for each category.
SELECT category,
SUM(discountedsellingprice * availablequantity) as total_revenue
FROM zepto
GROUP BY category
ORDER BY total_revenue;

-- Q4.find all products where MRP is greater than 500 and discount is less than 100.
SELECT DISTINCT name, mrp,discountpercent
FROM zepto
WHERE mrp > 500 and discountpercent < 100
ORDER BY mrp DESC, discountpercent DESC;

-- Q5.identify the top 5 categories offering the highest average discount percentage.
SELECT category,
ROUND(AVG(discountpercent),2)as avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

-- Q6.find the price per gram for products above 100g and sort by best value.
SELECT DISTINCT name, weightingms ,discountedsellingprice,
ROUND(discountsellingprice/weightingms,2) as price_per_gram
WHERE weightingms >=100
ORDER BY price_per_gram;

-- Q7.group the products into categories like low, medium, bulk.
SELECT DISTINCT name,weightingms,
CASE WHEN weightingms <1000 THEN 'low'
     WHEN weightingms < 5000 THEN 'medium'
     ELSE 'bulk'
     END AS weight_category
FROM zepto;

-- Q8.what is the total inventory weight per category.
SELECT category,
SUM(weightingms * availablequantity) as total_weight
FROM zepto
GROUP BY category
ORDER BY total_weight;
