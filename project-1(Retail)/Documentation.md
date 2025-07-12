This documentation highlights the process of data analysis and how it was conducted to produce reliable data-driven insights.

## Specific Objectives
The aim of the project is to provide actionable suggestions or recommendations to improve the retail company's operations or financial position based on the insights from the gathered data. Therefore, it is important to answer the following questions:
* *Which product category sold the most?*
* *Which of the product categories belong in the top three highest sales?*
* *Is there any sales trends in terms of time? (e.g, daily, monthly, yearly sales trend or pattern)*
* *Is there any sales trend or pattern regarding customer age?*
* *Which product category sold the most units?*
* *Which three product categories sold the most units?*
* *What is the gender distribution? How different are their product preferences?*

## Data Collection
The dataset used in this project was downloaded from Kaggle then exported to Google Sheets for data cleaning.

## Data Wrangling/Preparation
To make sure that the data is accurate, and therefore reliable, data cleaning was conducted using Google Sheets by:
* Setting proper format for all categories (e.g. date format for "Date", currency format for "Pricer Per unit" and "Total Amount")
* Used a formula to count for missing information (cells that have no values called null cells) Refer to this [image](references/count_of_missing.PNG)
* Made use of the IF and RIGHT function in Google Sheets to concatenate the numbers in "CustomerID" and compare it with the Transaction ID to eliminate any typographical errors. Click [this](references/before_data-cleaning.PNG) for the before data cleaning reference and [this](references/after_data-cleaning.PNG) for the after data cleaning reference.

## Data Transfer
The cleaned data from the Google Sheets is transferred to PostgreSQL for Exploratory Data Analysis and a deeper dive into what the data means.
* Created a database in PostgreSQL
* Created a table titled "retail_sales" using CREATE TABLE function of PostgreSQL, making sure that the column titles and their data types are accurate.
* Using the COPY function of PostgreSQL, the prepared data is transferred to SQL.

Conducting data transfer had its fair share of challenges, but the challenges were essential for a more effective learning. The challenges encountered were as follows:
* PostgreSQL does not accept currency signs, specially for a column that has a NUMERIC datatype
* PostgreSQL does not accept a comma for a column title with a NUMERIC datatype

Therefore, I had to correct the format of the data again before copying it into PostgreSQL. Use this [link](references/data_import-reformatted_data(removedcommas)) for reference of the reformatted data.

After correcting the format of the data, it was now viable for copying into PostgreSQL database. Here's the reference [image](references/data_import-technicalcode_documentation(1).PNG) of the successful data transfer using SELECT function of PostgreSQL.

## Exploratory Data Analysis (EDA)
I conducted EDA using the transferred data to get a view of the big picture, to summarize the descriptive information to serve as aid in the data analysis, to look for trends and patterns in the data that can be scrutinized further. In summary, to be able to understand what the data is trying to tell me a little better. 

Utilizing pgAdmin and using PostgreSQL's query tool, I was able to show the general picture of the data.
(Refer to this [link](references/eda_queries.sql) for the actual queries along with the logic behind each query)

The table below lists all the summarized information that was acquired through the queries:
 
|Output                                            | Reference Image |
|--------------------------------------------------|-----------------|
|The first 10 rows of the retail sales table       |[View image](
|The total data count                              |[View image](
|The total amount of sales                         |[View image](references/total_sales.PNG)|
|The average amount of sales                       |[View image](references/average_sales.PNG)|
|The lowest sale transaction                       |[View image](references/lowest_sale.PNG)|
|The highest sale transaction                      |[View image](references/highest_sale.PNG)|
|Sales per product category                        |[View image](references/category_sales.PNG)|
|Filtered highest sale transactions (Count of transactions with the highest sale) |[View image](references/filter_highestsale.PNG)|
|Monthly sales trend                               |[View image](references/monthly_sales_trend.PNG)|
|Daily sales trend                                 |[View image](references/daily_sales.PNG)|
|Unique customers                                  |[View image](references/unique_customers.PNG)|
|Sales per gender                                  |[View image](references/sales_per-gender.PNG)|
|Sales per gender per product category             |[View image](references/gender_sales_per_category.PNG)|
|Count of transactions per gender per product category  |[View image](references/transactions_per-gender_per-category.PNG)|
|Gender count (Male and Female)                    |[View image](references/gender_count.PNG)|
|Sales per age segment (For this and the two preceding bullet points, I used a standard [reference](https://www.statcan.gc.ca/en/concepts/definitions/age2) for the age segmentation.) |[View image](project-1(Retail)/references/total_sales_per-product,category,age).PNG)
|Sales per product category for customer age segments |[View image](references/
|Sales per gender per product category for customer age segments |[View image](references/total sales(product_category, age-group).PNG)|

I noticed a quick data visualization function of PostgreSQL and immediately tried it for the [daily sales trend](references/daily_sales_visual.PNG) and [monthly sales trend](references/monthly_sales_visualization.PNG)

I also executed data cleaning PostgreSQL queries to add into my repertoire. 
