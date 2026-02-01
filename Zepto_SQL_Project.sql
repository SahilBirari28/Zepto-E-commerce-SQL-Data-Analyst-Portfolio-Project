DROP TABLE IF EXISTS zepto;

Create Table zepto (
sku_id SERIAL PRIMARY KEY,
category VARCHAR (120),
name VARCHAR (150) NOT NULL ,
mrp NUMERIC (8,2),
discountPercent NUMERIC (5,2),
availableQuantity INTEGER ,
discountedSellingPrice NUMERIC (8,2),
weightInGms INTEGER,
outOfStock BOOLEAN ,
quantity INTEGER
);



--Data Exploration--- 

--Count of rows
SELECT COUNT(*) FROM zepto ;

-- sample data 
SELECT * FROM zepto 
	LIMIT 10;

--Null values
SELECT * FROM zepto 
WHERE name is Null
or 
category is Null
or
mrp is Null
or
discountpercent is Null
or
discountedsellingprice  is Null
or
weightingms is Null
or
availablequantity is Null
or
outofstock is Null
or
quantity is Null;


--different product category
SELECT DISTINCT category
From zepto 
order by category ;


---product is in stock vs out of stock
SELECT outofstock ,COUNT (sku_id)
from zepto 
group by outofstock;

-- product names pressent multiple times
SELECT name , COUNT (sku_id) as "Number of SKUs"
from zepto
group by name 
HAVING count (sku_id)> 1
ORDER by count (sku_id ) DESC;

--Data Cleaning 

-- product with price  = 0
SELECT * FROM zepto 
WHERE mrp = 0 OR discountedSellingPrice = 0;

DELETE from zepto 
WHERE mrp = 0 ;

--convert paise into rupees
UPDATE zepto
SET mrp = mrp /100.0,
discountedSellingPrice = discountedSellingPrice /100.0;

SELECT mrp , discountedSellingPrice from zepto;




--Data Analysis --

-- Q1. Find the top 10 best-value products based on the discount percentage.
SELECT DISTINCT name, mrp, discountPercent
FROM zepto
ORDER BY discountPercent DESC
LIMIT 10;


--Q2.What are the Products with High MRP but Out of Stock
SELECT DISTINCT name,mrp
FROM zepto
WHERE outOfStock = TRUE and mrp > 300
ORDER BY mrp DESC;


--Q3.Calculate Estimated Revenue for each category
SELECT category,
SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM zepto
GROUP BY category
ORDER BY total_revenue;

-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
SELECT DISTINCT name, mrp, discountPercent
FROM zepto
WHERE mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC, discountPercent DESC;

-- Q5. Identify the top 5 categories offering the highest average discount percentage.
SELECT category,
ROUND(AVG(discountPercent),2) AS avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

-- Q6. Find the price per gram for products above 100g and sort by best value.
SELECT DISTINCT name, weightInGms, discountedSellingPrice,
ROUND(discountedSellingPrice/weightInGms,2) AS price_per_gram
FROM zepto
WHERE weightInGms >= 100
ORDER BY price_per_gram;

--Q7.Group the products into categories like Low, Medium, Bulk.
SELECT DISTINCT name, weightInGms,
CASE WHEN weightInGms < 1000 THEN 'Low'
	WHEN weightInGms < 5000 THEN 'Medium'
	ELSE 'Bulk'
	END AS weight_category
FROM zepto;

--Q8.What is the Total Inventory Weight Per Category 
SELECT category,
SUM(weightInGms * availableQuantity) AS total_weight
FROM zepto
GROUP BY category
ORDER BY total_weight;