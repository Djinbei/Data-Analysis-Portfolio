This documentation highlights the process of data analysis and how it was conducted to produce reliable data-driven insights.

## Specific Objectives
The aim of the project is to answer the following questions:
* What product category conjures the highest sales? -- Additional: The top three highest selling product categories
* Are there any seasonal patterns or trends in terms of sales? If so, what does this mean for the retail company?
* Are there any sales trends or patterns in terms of customer/buyer's age? If so, what does this mean for the retail company?
* What product category has the highest quantity sold? Additional: What are the top three highest quantity sold product categories?
* What is the percentage of males and females? How different are each gender in preference for products?

## Data Collection
The dataset used in this project was downloaded from Kaggle then exported to Google Sheets for data cleaning

## Data Wrangling/Preparation
To make sure that the data is accurate, and therefore reliable, data cleaning was conducted using Google Sheets by:
* Setting proper format for all categories (e.g. date format for "Date", currency format for "Pricer Per unit" and "Total Amount")
* Used a formula to count for missing information (cells that have no values called null cells) Refer to this [image](references/count_of_missing.PNG)
* Made use of the IF and RIGHT function in Google Sheets to concatenate the numbers in "CustomerID" and compare it with the Transaction ID to eliminate any typographical errors. Click [this](references/before_data-cleaning.PNG) for the before data cleaning reference and [this](references/after_data-cleaning.PNG) for the after data cleaning reference.
