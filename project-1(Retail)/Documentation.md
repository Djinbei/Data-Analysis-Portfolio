This documentation highlights the process of data analysis and how it was conducted to produce reliable data-driven insights.

## Specific Objectives

The aim of this project is to provide actionable suggestions and recommendations that will help improve the company's product operations and financial position through better understanding of Sales, Customer & Product, and Inventory data. 

With the aim etablished, I seek answers to the following questions:

**Sales**
* *What is the total number of transctions for the whole year?*
* *What is the overall sales revenue and total units sold?*
* *What is the overall sales distribution across all transactions?*
* *Which product category sold the most?*
* *Are there any noticeable monthly sales trends or patterns, and when are the peak sales periods?*
* *How does sales distribution vary across gender and age groups?*
* *What is the average transaction sale?*

**Customer & Product** and Inventory Insights**
* *How does product preference differ by gender?*
* *How does product preference differ by age group?*
* *What is the average price per unit for each product category?*

**Inventory**
* *What is the overall volume of units sold?*
* *How many units were sold for each product category?*
* *What's the monthly units sold overview and are there any trends or patterns that can be found?*
* *What's the onthly units sold overview for each product category and are there any obvious trends or patterns?*

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
* [*Navigation Menu*](references/data_visualization/13.navigationmenu.PNG)
* [*Sales Dashboard*](references/data_visualization/salesoverview.PNG)
* [*Customer & Product Dashboard*](references/data_visualization/12.customerandproductinsight.PNG)
* [*Inventory Dashboard*](references/data_visualization/14.inventorypage.PNG)

Click [this](references/data_visualization/retail_sales.pbix) to access the dashboard file.

## Data Analysis & Interpretation

Using the dashboard, we can now analyze the charts and intepret what information they are trying to convey. These interpretations can then be used to tell the story of the data which would help the data analyst (In this case, me.) and the stakeholders to brainstorm action plans such as the development of marketing strategies, reevaluation of inventory management systems, development of demand forecasts for specific product categories, etc.)

With the aid of the dashboard, I can now provide the answers to each business questions from the *Specific Objectives* section and other relevant insights that can ony be obvious through the visualization:

<p align="center"><b>Sales</b></p>

* There were a total of 1,000 transactions for the whole year. Depending on the number of transactions goal of the retail company, this number can either be good or bad.

* The total sales for the whole year is 456,000 dollars. Let's say the company's goal was to hit 500,000 dollars in sales, 456,000 dollars would then be quite a failure. If this were the case, I would recommend the stakeholders to look into their operations and see the main drivers of high costs and find immediate solutions to reduce it. I would also recommend marketing & sales changes to reach a higher amount of customers. Some changes in the facility layout can also be recommended, some products that might appeal to a large volume of customers might not be easily visible due to their placement in the facility.

On the other hand, if the sales target was 450,000 dollars, this would mean that the company has barely hit its target. Improvements towards marketing, facility layout, and their overall process would still be recommended.

If they surpass their sales target by a large volume, I would recommend that they take note of every operations, marketing, facility strategies they have adopted and make sure that they maintain or improve on those strategies.

* There's an average sales of 456 dollars for each transaction. Just like with the sales, it would depend if the company has set a goal for this metric. The same recommendations as the sales scenario would be made.

* There is an observable ebb and flow for the company's monthly sales on the year of 2023. Peak sales was observed during May and high volume of sales were noticeable across the months of February, October, November, and December. This means that for three out of four quarters of the month, there will be an instance of high volume sales and high volume sales can be expected during Q4. Further analysis of what happened during this months is required for a better story (For example, asking questions such as are there any holidays during these months that drove the high volume of sales.) 

This means that the company could focus the resources used to drive sales during Q4 or the months mentioned to improve other aspects of the company, aspect such as product innovation, operations improvement, employee training, etc. The company should also take note of the marketing strategies and plans utilized during the months with high sales volume that weren't applied to months with low sales volume to increase overall revenue or avoid significant dips in sales for a specific month.

* The lowest volume of sales happened on the month of September, and a low volume of sales can also be seen on the month of March. Q3 seems to be the weakest in terms of sales volume. The company should then expect low sales volume during the third quarter of the year.

It would therefore be a wise decision to allocate signfiicant resources during these months on marketing and sales campaigns to widen the company's reach, reducing or eliminating instances of very low monthly sales volume.

* Female customers brought in higher sales volume compared to male customers. However, there are no massive gaps in terms of Sales by Gender, meaning the retail company appeals to both genders alike.

The goal here now is to maintain the small margin gap for each gender in the following years to maintain sales volume and look for possibilities to leverage the small sales gap found across genders through curated messaging and advertisement focused on female customers. Reorgnaizing the facility's sections for male and female beauty and clothing products could also help foster inclusivity and maintain sales volume.

* Each of the three product categories generated comparable sales volume, with Electronics generating the highest and Beauty products the lowest. However, there's a notable 12,000 dollar gap between Beauty sales and Clothing sales. An emphasis on increased marketing efforts --- influencer collaborations, free sampling of beauty products, limited-time discounts, seasonal or holiday campaigns ---  for beauty products could help close this gap and drive sales growth. 

* Adults (25-64 years old) account for the majority of the company's sales making them our core demographic, with Youth (15 - 24 years old) contributing only a small share. Children (0-15 years old) and Seniors (65+ years old) did not buy any of the retail company's products. This is considered realistic due to children's lack of purchasing power and Seniors minimal interest towards material goods or products.

Nevertheless, targeted marketing efforts and campaigns such as offering affordable clothing lines and exclusive discounts for Seniors can still be implemented to encourage them to buy, which would lead to a small but significant increase in company sales. Furthermore, promotion of seasonal and trendy products can attract Children and encourage their parents (primarily Adult consumers) to buy for them, leading to an indirect increase in Children's contribution to the retail company's sales. However, it is better to allocate more resources into attracting Children and Youth into buying the company's products as they are more likely to become repeat customers, engage in trendy fashion, clothing, and electronics, and have a larger social network.

<p align="center"><b>Customer & Product</b></p>

* In the Product Preference by Age Group, Adults (25-64 years old) are more inclined to buy clothing and electronic products, while Youth (15 - 24 years old) tend to buy beauty products more.

The company should focus some resources on promoting Beauty products to level its sales contribution with the other products. The company has two options: 1. aim to entice the Youth through collaboration with influcencers whom are especially popular with kids and produce clothing lines designed to cater to Youth purchasing power; 2. Improve the visibility and accessibility of beauty products by placing them near the entrance where they can be seen immediately, create bundles pairing Beauty products with either Clothing or Electronics to attract Adult purchase expanding Beauty sales even more to level with the other product categories.

* For the Product Preference by Gender, Females resonate more with Clothing compared to Beauty and Electronics. On the other hand, Males tend to buy Electronics more followed by Clothing and then Beauty. This could be connected to the Adults high preference in Clothing and Electronics given that Adults are the main customer segment, with the Youth only giving a slight edge to Beauty.

Given that Electronics and Clothing balance each other out with Females inclination towards Clothing and Males inclination towards Electroncis, the same strategy given for the Product Preference by Age group can be applied here.

* The average price per unit for the Electronics, Clothing, and Beauty are comparable with Beauty garnering the highest average price per unit, Electronics coming in second, and Clothing the lowest. Relating it with the higher sales contribution for both Electronics and Clothing and and low relative contribution for Beauty, we could be confident that one of the main factors that affect customer purchase is the average price per unit. Therefore, adjustments in this dimension would also adjust customer demand and purchase behavior.

Given what we already know, with Beauty garnering the lowest sales volume across age groups and gender and even overall. The company should try to reduce the average price per unit either through introducing budget-friendly product lines or sizes, promotional pricing or discounts, and as mentioned prior creating product bundles at a lower combined price point, making it more affordable for each customer segment, potentially increasing its demand and overall sales contribution.

<p align="center"><b>Inventory</b></p>

* A total of 2,514 units were sold for the whole year

In a similar context with the sales analysis, whether this metric is favorable or unfavorable depends entirely on the company's logistics. Can they supply 2,514 units for one year, can their logistics and supply chain accommodate this amount of volume? And can they maintain or expand it effectively for the following years?

Scenario 1: If supply can't keep up with this volume amount, the company should allocate more resources and support into expanding or improving their supply chain management and logistics, preferably to the point where they can accommodate 3,000 units of products for the whole year to keep up with the demand and prepare buffer stocks in case of higher demand than expected.

Scenario 2: If supply can keep up with this volume amount, the company could focus less on logistics and supply chain and delve more into improving or streamlining their operations, management, and marketing. 
 
* 2.51 units were sold on average across all transactions for the whole year

The company should maintain 3 - 4 units stocked for each product category every day to keep up with the daily demand and avoid stockouts. The company should also make sure to check in with their inventory management system, check to see if there are excess inventory that can still be brought out into the retail store.

* Units sold from January to April are leveled with each other, with peak units sold observed during the month of May, followed by a massive dip on June continuing until July. A three-month rise and fall can then be observed from August to October, with September garnering the lowest amount of units sold. Units
sold were then stable for the month of Novemeber up until December.

The company stakeholders can make use of this information to make their inventory management system more effective. For example, they should keep 250 units in stock from the month of January to April to avoid overstocking of their retail facility which could indirectly impact the facility's aesthetic making it more conducive to customer shopping. It is also imperative to prepare a large amount of stocks on the month of May, August, and October as these are the months observed to have the highest volume of units sold. On the other hand, a relatively lower amount of units is acceptable for the months of June, July, and September. But the company should still make necessary efforts to increase the units sold such as mentioned before, lowering the average price per unit by a slight margin, creating product bundles for a relatively low combined price point, and targeted product discounts for specific customer segments for these months to increase overall sales and profitabiltiy.

* Relatively similar trends and patterns can be observed for all product categories in terms of monthly units sold. However, there are notable differences observed in a specific span of months, particularly during the months of March up unto May, where Clothing products experienced its highest units sold volume. Electronic units had its lowest amount of units sold during the month of March, rising slowly across May and ultimately leveling with the other products on the month of June. Units sold monthly for Beauty products can be regarded as stable, with no significant peak or dips. However, it fails to keep up with the normal baseline of Electronics and Clothing, despite their incosistent trends and patterns.

This information is a narrowed down version of the overall monthly units sold trend, therefore this also gives us a much more detailed action plan or strategy such as making usre that clothing stocks are really high for the month of March to May as they sell really well during these months. The company could also utilize the popularity of clothing products during these months to drive units sold growth for Beauty and Clothing through creating a pair or trio bundles (One electronic has a corresponding clothing or beauty product pair or a combination of the three) for these months, or campaigns such as offering a specific beauty or clothing discount for one purchase of an electronic product.

**Results, Conclusion, and Recommendations**

The retail company made 456,000 dollars in overall revenue, with an average of 456 dollars per transaction. Peak sales was observed on the month of May while the lowest was observed on September. Consistent high sales volume was evident in Q4 (October, November, December) making it the company's strongest sales period while Q3 (July, August, September) is considered to be the weakest. Female customers contributed slightly more sales than Males. On the other hand, Adults make up the majority of the company's customer segment and Youth makes up the minority, no recorded purchases for Children and Seniors. Adults have higher preference for Clothing, while Youth leans more towards Beauty products. Females have a higher preference for Clothing compared to Males who has a higher preference for Electroncics. Beauty has the highest average price per unit followed by Electronics, then Clothing. 2,514 units were sold for the whole year, with an average of 2.51 units sold per transaction. Monthly units sold garnered equal levels for Q1 (January, March, April), with a trend of highs and lows observed during Q3 and Q4 (August, September, October) with the peak month determined to be May and lowest units sold volume to be September. * Clothing products generated the most amount of units sold during March up until May, with Electronic products having its lowest unit sold during March slowly rising and recovering during June, no observed patterns or trends for Beauty products with the exception of a relatively low units sold baseline.

Recommendation:
* Keep 250 - 300 units of prouducts ready for each month to avoid understocks and prepare buffer stocks for unexpected high demand periods. Or 3-4 units stocked each day.
* Product Bundles (Buy 1 electronic and get a discount for a clothing or beauty product; lower combined price point), Promotional Pricing, Product Discounts (?)
* Introduce budget-friendly Beauty product variations, free sampling for Beauty products, Influencer promotion of beauty products, limited-time discounts, seasonal or holiday campaigns, curated messaging
* Expand efforts towards promoting beauty, clothing, and electronic products (with a higher emphasis on Beauty) to Youths
* Improve retail store layout (product placements to improve accessiblity and visibility), create male and female divisions for gender inclusivity and maintain sales
* Introduce affordable clothing, beauty, or electronic products specifically aimed for Seniors and introduce trendy and flashy beauty products or clothes, electronic products promoted by influencers to indirectly gain Children sales contribution through their parents (Adults)
* Allocate resources based on strong months and weak months (reduce resources and adopt strategies used during strong months and increase resources or integrate strong month strategies for weak months)
* Use resources to improve other aspects of the company during months with high sales volume
  

