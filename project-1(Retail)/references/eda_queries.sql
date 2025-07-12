--- Show the first 10 rows of the retail_sales table
SELECT * FROM retail_sales LIMIT(10);

--- Display how many data is in retail_sales (counts the number of rows)
SELECT COUNT(*) FROM retail_sales;

--- Outputs the total sales from the start of transaction to end of transaction data
SELECT SUM (total_amount) AS total_sales FROM retail_sales;

--- Outputs the average amount of sales using the 1,000 inputted transactions
SELECT AVG(total_amount) AS average_sales FROM retail_sales;

--- Shows the lowest sale for a transaction
SELECT MIN(total_amount) AS lowest_transaction FROM retail_sales;

--- Shows the highest sale for a transaction
SELECT MAX(total_amount) AS highest_transaction FROM retail_sales;

--- Shows total sales per category arranged in descending order 
SELECT product_category, SUM(total_amount) AS category_sales
FROM retail_sales
GROUP BY product_category
ORDER BY category_sales DESC;

--- Group total transactions in descending order based on total amount of sales
SELECT transaction_id, transaction_date, gender, age, product_category, price_per_unit, quantity, total_amount FROM retail_sales
ORDER BY total_amount DESC LIMIT 10;

-- Filter the highest sales (found that 49 out of the 1,000 transactions had the highest sale amount possible)
SELECT * FROM retail_sales
WHERE total_amount = 2000
	
--- The monthly sales trend
SELECT DATE_TRUNC('month', transaction_date) AS month, SUM(total_amount) AS monthly_sales
FROM retail_sales
GROUP BY month
ORDER by month;
	
--- Shows the daily sales trend from the earliest transaction date to the latest transaction date
SELECT DATE_TRUNC('day', transaction_date) AS day, SUM(total_amount) AS daily_sales
FROM retail_sales
GROUP BY day
ORDER by day;

--- Postgre SQL data cleaning, checks to see if there are missing values in a specific column, this can be applied to all columns.
SELECT
	SUM(CASE WHEN total_amount IS NULL THEN 1 ELSE 0 END) AS missing_sales
FROM retail_sales;

--- Counts distinct or unique customers which can also be used as information to identify any repeat customers
SELECT COUNT(DISTINCT customer_id) AS unique_customers FROM retail_sales;

--- Shows the amount of sales per gender and ordering them by highest to lowest (to see if females bought more than males or vice versa, this could mean that depending on the gap, customer segmentation should lean more towards this gender)
SELECT gender, SUM(total_amount) AS sales_per_gender
FROM retail_sales
GROUP BY gender
ORDER BY sales_per_gender DESC;

--- Outputs the category with most sales to least sales considering gender segmentation
SELECT gender, product_category, SUM(total_amount) AS total_sales
FROM retail_sales
GROUP BY gender, product_category
ORDER BY gender, total_sales DESC;

--- Shows the number of male and female transactions for each product category
SELECT gender, product_category, COUNT(*) AS num_transactions
FROM retail_sales
GROUP BY gender, product_category
ORDER BY gender, num_transactions DESC;

--- Tells the total number of female and male customers
SELECT gender, COUNT(gender) as gender_count
FROM retail_sales
GROUP by gender
ORDER by gender_count DESC;

--- Outputs the total sales per age group providing more insight on age segmentation (which age group tends to buy more of the company's products)
SELECT 
  CASE
    WHEN age BETWEEN 0 AND 14 THEN 'Children (0-14)'
    WHEN age BETWEEN 15 AND 24 THEN 'Youth (15-24)'
    WHEN age BETWEEN 25 AND 64 THEN 'Adults (25-64)'
    WHEN age >= 65 THEN 'Seniors (65+)'
    ELSE 'Unknown'
  END AS age_group,
  SUM(total_amount) AS total_sales
FROM retail_sales
GROUP BY age_group
ORDER BY total_sales DESC;

--- Outputs total sales considering gender, product category, and age group providing more insight on niche segmentation for the retail company.
SELECT 
  gender,
  product_category,
  CASE
    WHEN age BETWEEN 0 AND 14 THEN 'Children (0-14)'
    WHEN age BETWEEN 15 AND 24 THEN 'Youth (15-24)'
    WHEN age BETWEEN 25 AND 64 THEN 'Adults (25-64)'
    WHEN age >= 65 THEN 'Seniors (65+)'
    ELSE 'Unknown'
  END AS age_group,
  SUM(total_amount) AS total_sales
FROM retail_sales
GROUP BY gender, product_category, age_group
ORDER BY age_group, total_sales DESC;

--- Total quantity/units of inventory sold
SELECT
SUM(quantity) AS total_quantity
FROM retail_sales
ORDER BY total_quantity DESC;

--- Quantity/Units of inventory sold for each product category
SELECT product_category,
SUM(quantity) AS total_quantity
FROM retail_sales
GROUP BY product_category
ORDER BY total_quantity DESC;

--- The average price per unit for all transactions
SELECT AVG(price_per_unit) AS average_ppu
FROM retail_sales
ORDER BY average_ppu DESC;

--- The average price per unit for the product categories
SELECT product_category,
AVG(price_per_unit) AS average_ppu
FROM retail_sales
GROUP BY product_category
ORDER BY average_ppu DESC;
