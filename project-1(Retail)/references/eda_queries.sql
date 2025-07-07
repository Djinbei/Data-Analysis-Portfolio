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

-- Filter the highest sales (found that 49 transactions had the highest amount of sales, which could mean that out of 1000 transactions, 49 transactions would be the highest)
SELECT * FROM retail_sales
WHERE total_amount = 2000
	
--- Shows the monthly sales trend
SELECT DATE_TRUNC('month', transaction_date) AS month, SUM(total_amount) AS monthly_sales
FROM retail_sales
GROUP BY month
ORDER by month;
(include here the monthly sales visual chart to let employers know that you can also visualzie data using PostgreSQL)
	
--- Shows daily sales trend from the earliest transaction date to the latest transaction date
SELECT DATE_TRUNC('day', transaction_date) AS day, SUM(total_amount) AS daily_sales
FROM retail_sales
GROUP BY day
ORDER by day;

--- Postgre SQL data cleaning, checks to see if there are missing values in a specific column, this can be applied to all columns.
SELECT
	SUM(CASE WHEN total_amount IS NULL THEN 1 ELSE 0 END) AS missing_sales
FROM retail_sales;

--- Counts distinct customers and leaves out repeat customers (to know how many customers the company has had in a year)
SELECT COUNT(DISTINCT customer_id) AS unique_customers FROM retail_sales;

--- Shows the amount of sales per gender and ordering them by highest to lowest (to see if females bought more than males or vice versa, this could mean that depending on the gap, customer segmentation should lean more towards this gender)
SELECT gender, SUM(total_amount) AS sales_per_gender
FROM retail_sales
GROUP BY gender
ORDER BY sales_per_gender DESC;
