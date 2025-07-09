This documentation highlights the process of data analysis and how it was conducted to produce reliable data-driven insights.

## Specific Objectives
The aim of the project is to provide actionable suggestions or recommendations to improve the retail company's operations or financial position based on the insights from the gathered data. With this, it is important to answer the following questions:
* *Which product category sold the most?
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
