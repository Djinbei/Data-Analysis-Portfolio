This documentation highlights the process of data analysis and how it was conducted to produce reliable data-driven insights.

## Specific Objectives

The aim of this project is to provide actionable suggestions and recommendations that will help improve the company's product operations and financial position through better understanding of sales patterns, customer behavior, and inventory data. 
With the aim etablished, I seek answers to the following questions:

**Sales**
* *What is the overall sales revenue and total units sold?*
* *Which product category sold the most?*
* *Are there any noticeable monthly sales trends or patterns, and when are the peak sales periods?*
* *How does sales distribution vary across gender and age groups?
* *What is the average transaction sale?*

**Customer, Product, and Inventory Insights**
* *How does product preference differ by gender?*
* *How does product preference differ by age group?*
* How many units were sold for each product category, and which product category had the highest amount of total units sold?
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
With an improved knowledge of the data structure, the data visualization phase is commenced with the aim to provide stakeholders with clear and understandable visuals using the data to help them make more effective decisions through actionable plans that could improve the company's logistics, sustainability, and profitability immediately and in the long run. 

In this phase
* I first [imported](references/data_visualization/1.sql-powerbi_dataimport.PNG) the data from PostgreSQL to PowerBI to jumpstart the data visualization process.
* I then [selected](references/data_visualization/2.select_tables.PNG) which table I wanted to import. The dataset only had one table, but still, the process is what's importnat.
Refer to this [link](references/data_visualization/3.dataimport_complete.PNG) for the successful loading of data from PostgreSQL to PowerBI

I also [created](references/data_visualization/4.conditional_column-agegroup.PNG) a conditional column to form an aggregated segment for the age colun called "Age Group". This can also be seen in the EDA phase where I also aggregated the individual ages into age groups based off of a standard reference.

The dataset with the added "Age Group" column is shown [here](references/data_visualization/5.table_modified.PNG).

It is important to note that I have never used PowerBI for data visualization purposes. I mostly used Google Sheets or Excel to give aid visuals for the data we gathered and analyzed for our research projects during university. Therefore, I thought it best to experiment and try PowerBI's functions first. The resulting first drafts after one hour of experimentation can be seen here. [First Draft 1](references/data_visualization/6.draft1-page1.PNG); [First Draft 2](references/data_visualization/7.firstdraft-2.PNG)

Also, whilst on the midst of experimentation. I thought of an idea to divide the visuals into proper segments that can be understood by non-technical stakeholders. I thought of dividing the report into segments such as "Sales", "Customer Behavior", "Inventory", "Additional Insights". This is also reflected on the specfic objectives section where I categorized the key questions to the aforementioned segments. The description for each segment and their corresponding data visuals can be seen in the table below: 

|Segment                                            | Description |
|--------------------------------------------------|-----------------|
|**Sales**                                         | This segment focuses on providing sales insights by uncovering sales trends and patterns and summarizing key sales information such as overall sales, etc. |
|**Customer & Product**                               | Provides insights on customer behavior, such as customer distribution by gender and age group and also preference for the different products by gender and age group. |
|**Inventory**                                      | Provides relevant information on the distribution of inventory overall, by niche (distribution of inventory across product categories, gender, and age groups.)


*July 15, 2025*

I completed the [second draft](references/data_visualization/8.second-draft.png), specifically the data visualization for the "Sales" segment. After completing the draft, I observed some weaknesses and mistakes:
* Absence of slicers, limiting interactivity.
* Incosistent y-axis units (e.g, one chart has a definitive unit in the thousands while the other is set in millions)
* The 'monthly sales' title is incorrect. Based on the x-axis units, the title should be 'daily sales'.
* There's no title for the consolidated visuals.

*July 17, 2025*

I had a query towards a specific chart in the **Customer & Product** segment which was a chart that was supposed to give insights on each gender's product preference. The issue with this chart was that I didn't know which independent variable to use (y-axis), should I base preference off of the sales or the units sold? 

Eventually, I decided on using sales as the basis for preference. I based it off of the tecnical definition of demand which was the ability and willingness of customers to buy a product. Because if demand meant the ability of the customers to buy the product, then preference would mean the act of buying the product with the price in mind. Basically, preference is the willingness of the buyer to still buy despite the price for a certain amount of quantity.

*July 19, 2025*

I made respectable amount of progress but still struggled with what information was relevant to put in the dashboard segments. I also added a matrix table to give a detailed insight on customer distribution based off of nice information such as gender and age group, again using the product category as the column side and total sales as value. I thought this would give be useful for giving a more in-depth view of the retail company's customer niche. However, I scrapped this on later dates since I thought it had too much information, information that the stakeholders might not even bother to check.

 I also inserted a LinkedIn and Github logo where I marked down the links to my personal LinkedIn and Github profile. The gender and age distribution were also included in the customer & product dashboard. I also transformed some of the charts by fixing their design, craeting a more aesthetic feel to each dashboard. I also included an average transaction sales card to give information on the average inflow of revenue to the company.

 *July 21, 2025*
 
 I scrapped the original division of four segments which was Sales, Customer Behavior, Inventory, and Additional Insights because I have observed too much dead space for the Customer Behavior, Inventory, and Additional Insights which would make the dashboard irrelevant to use. Therefore, I opted to combine customer behavior, and additional insights together forming the segment called "Customer & Product".

 I also had the idea of creating a navigation page to integrate navigation onto the dashboard.

 I then [added](references/data_visualization/powerqueryeditorconditional.PNG) custom columns such as [Sales Range](references/addedsales_rangecolumn.PNG), and [Sales Order](addsales_ordercolumn.PNG) to create a histogram that will be used to give sales distribution information. However, I scrapped the sales range and sales order columns because I thought using them was too complex a solution to the histogram creation problem, so I looked for a much more simpler way to create sales distribution using AI prompts. I then discovered a much more simpler way to solve the problem using the New Group function in PowerBI which lets me make bins for a specific attribute. Using this information, I right clicked on the total_amount attribute and looked for the "New Group" function to which it showed a setting interface. I tweaked the settings and set the appropriate amount for the bins to create the appropriate number of bins, hit apply and it instantly created a new group called total_amount(bins) to which I renamed as "Sales Range".
 
 I then used the newly created "Sales Range" and the transaction count to create the histogram with the Sales Range in the x-axis and transaction count in the y-axis to appropriately and aesthetically convey the sales distribution. 

*July 23, 2025*

I added slicers to make the dashboard more interactive. I added gender, product category, and age slicers. I then prompted ChatGPT to make a logo for the retail company to better mirror a realistic company dashboard, I then used the theme of the logo as reference for the design of the visuals and slicers.

I finalized the histogram which gives sales distribution insight. A first glance of the visual could immmediately convey to stakeholders their most frequent sales value. 

I also changed the overall layout of the "Sales" segment.


*July 24, 2025*

I finished the first iteration of the **Customer & Product** dashboard design. I also changed the font style for the visuals to 'Consolas' to improve readability and worked on the aesthetic design of each dashboards by correcting axis title colors, removing axis titles for some visuals that I assumed unnecessary based on placing myself in the shoes of the stakeholders. As a beginner, I eyeballed the design which meant that if it looked understandable to me while keeping the stakeholders' perception in mind, then the design would pass.

The final visuals included in the **Product & Customer** dashboard are as follows:
* Product preference by Gender
* Product preference by Age Group
* Average Price Per Unit for the Product Categories
* Gender, Age Group, and Product Category slicers


 *July 25, 2025*

 I completed the navigation menu through iterating it over and over until I was satisifed with the design.
 First, I prompted ChatGPT to make a logo for each of the segment included in the menu (**Sales**, **Customer & Product**, and **Inventory**) 
 Second, I inserted the logos into the navigation menu and used the action function to integrate navigational ability onto the menu. I linked each segment to their appropriate logo through the action function. 


 *July 26, 2025*

 I finalized the **Inventory** dashboard using the following visuals and elements:
 * Date and Product Category slicers
 * Monthly Units Sold
 * Monthly Units Sold by Product Category
 * Total Units Sold by Product Category



*July 27, 2025*

Made some small tweaks on the design of each segment to finalize the **Retail Company's Operations Analytics Dashboard.**

Use this references for each dashboard design:
[*Navigation Menu*](references/data_visualization/13.navigationmenu.PNG)
[*Sales Dashboard*](references/data_visualization/salesoverview.PNG)
[*Customer & Product Dashboard*](references/data_visualization/12.customerandproductinsight.PNG)
[*Inventory Dashboard*](references/data_visualization/14.inventorypage.PNG)

Click [this](references/data_visualization/retail_sales.pbix) to access the dashboard file.



 
