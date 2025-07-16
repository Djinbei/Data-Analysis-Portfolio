This documentation highlights the process of data analysis and how it was conducted to produce reliable data-driven insights.

## Specific Objectives

The aim of this project is to provide actionable suggestions and recommendations that will help improve the company's product operations and financial position through better understanding of sales patterns, customer behavior, and inventory data. 
With the aim etablished, I seek answers to the following questions:

**Sales**
* *What is the overall sales amount?*
* *Which product category sold the most?*
* *Are there any noticeable trends or patterns for the monthly sales?*
* *What is the sales distribution by age group?*
* *What is the sales distribution by gender?*
* *Are there peak sales periods?*

**Customer Behavior**
* *What is the gender distribution across all transactions?*
* *How does product preference differ by gender?*
* *What are the top product categories for each gender?*
* *How does product preference differ by age group?*
* *What are the top product categories for each age group?*

**Inventory**
* *How many units were sold overall?*
* Which product category sold the highest number of units?*

**Additional Insights**
* *What is the average price per unit for each product category?*

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

Utilizing a built-in user interface for PostgreSQL called pgAdmin integrated with a standard query tool, I am able to provide the landscape of the data.
**Important Note**: (Refer to this [link](references/eda_queries.sql) for the actual queries along with the logic behind each query)

The table below lists all the summarized information that was acquired through the queries:
 
|Output                                            | Reference Image |
|--------------------------------------------------|-----------------|
|The first 10 rows of the retail sales table       |[View image](references/show_table.PNG)
|The total data count                              |[View image](references/data_count.PNG)
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
|Sales per age segment (For this and the two preceding bullet points, I used a standard [reference](https://www.statcan.gc.ca/en/concepts/definitions/age2) for the age segmentation.) |[View image](total_sales(age-group).PNG)
|Sales per product category for customer age segments |[View image](references/totalsales(product_category,age).PNG)
|Sales per gender per product category for customer age segments |[View image](references/sales_age_group,product_category,gender.PNG)|
|Total quantity sold                                  |[View image](references/total_quantity.PNG)|
|Quantity sold per product category                   |[View image](references/quantity_prodcategory.PNG)|
|Average price per unit for all transactions          |[View image](references/average_price-per-unit.PNG)|
|Average price per unit per product category          |[View image](references/averageppu_product_category.PNG)|

I noticed a quick data visualization function of PostgreSQL and immediately tried it for the [daily sales trend](references/daily_sales_visual.PNG) and [monthly sales trend](references/monthly_sales_visualization.PNG)

I also executed data cleaning PostgreSQL queries to add into my repertoire. 

## Data Visualization
With a better feel for the data structure, data visualization can now be conducted with the aim to provide stakeholders accessible and digestible insights from the data that can be used to make effective decisions and create actionable plans that will improve the retail company's operations, financial position, and sustainability both short-term and long-term.

This time, I imported the data from PostgreSQL to PowerBI to start the data visualization process.

At this point in time, specifically the 14th of July 2025, I have never used PowerBI for data visualization purposes. I mostly used Google Sheets or Excel to give aid visuals for the data we gathered and analyzed for our research projects during university. Therefore, I thought it best to experiment and try PowerBI's functions first. The resulting first draft after one hour of experimentation can be seen here. 

Also, whilst on the midst of experimentation. I thought of an idea to divide the visuals into proper segments that can be understood by non-technical stakeholders. I thought of dividing the report into segments such as "Sales", "Customer Behavior", "Inventory", "Additional Insights". This is also reflected on the specfic objectives section where I categorized the key questions to the aforementioned segments. The description for each segment and their corresponding data visuals can be seen in the table below: 

|Segment                                            | Description |
|--------------------------------------------------|-----------------|
|**Sales**                                         | This segment focuses on providing sales insights, uncovering sales trends and patterns, and summarizing key sales information such as overall sales, etc.) |
|**Customer Behavior**                               | Provides insights on customer behavior, such as customer distribution by gender and age group and also preference for the different products by gender and age group. |
|**Inventory**                                      | Provides relevant information on the distribution of inventory overall, by niche (distribution of inventory across product categories, gender, and age groups.)
|**Additional Insights**                            | Insights that can be integrated into the other segments or can be placed on a separate page titled "Additional Insights". Can be used as additional visual reference for information not as crucial as the others present in the previous three segments.|

*July 15, 2025*
I completed the second draft, specifically the data visualization for the "Sales" segment. After completing the draft, I observed some weaknesses and mistakes:
* Absence of slicers, limiting interactivity.
* Incosistent y-axis units (e.g, one chart has a definitive unit in the thousands while the other is set in millions)
* The 'monthly sales' title is incorrect. Based on the x-axis units, the title should be 'daily sales'.
* There's no title for the consolidated visuals.
