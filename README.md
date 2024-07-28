# Walmart Recruiting - Store Sales Forecasting
### Introduction
The "Walmart Recruiting - Store Sales Forecasting" project aims to analyze sales data to uncover trends, understand customer behavior, and optimize business operations. This analysis helps Walmart in strategic decision-making for inventory management, staffing, marketing, and customer engagement. The analysis is divided into three main sections: Product Analysis, Sales Analysis, and Customer Analysis.
## About Data

The dataset was obtained from the [Kaggle Walmart Sales Forecasting Competition](https://www.kaggle.com/c/walmart-recruiting-store-sales-forecasting). This dataset contains sales transactions from a three different branches of Walmart, respectively located in Mandalay, Yangon and Naypyitaw. The data contains 17 columns and 1000 rows:

| Column                  | Description                             | Data Type      |
| :---------------------- | :-------------------------------------- | :------------- |
| invoice_id              | Invoice of the sales made               | VARCHAR(30)    |
| branch                  | Branch at which sales were made         | VARCHAR(5)     |
| city                    | The location of the branch              | VARCHAR(30)    |
| customer_type           | The type of the customer                | VARCHAR(30)    |
| gender                  | Gender of the customer making purchase  | VARCHAR(10)    |
| product_line            | Product line of the product solf        | VARCHAR(100)   |
| unit_price              | The price of each product               | DECIMAL(10, 2) |
| quantity                | The amount of the product sold          | INT            |
| VAT                     | The amount of tax on the purchase       | FLOAT(6, 4)    |
| total                   | The total cost of the purchase          | DECIMAL(10, 2) |
| date                    | The date on which the purchase was made | DATE           |
| time                    | The time at which the purchase was made | TIMESTAMP      |
| payment_method          | The total amount paid                   | DECIMAL(10, 2) |
| cogs                    | Cost Of Goods sold                      | DECIMAL(10, 2) |
| gross_margin_percentage | Gross margin percentage                 | FLOAT(11, 9)   |
| gross_income            | Gross Income                            | DECIMAL(10, 2) |
| rating                  | Rating                                  | FLOAT(2, 1)    |


## 1. Product Analysis
### Product Line Performance
##### Top-Selling Product Line: 
'Electronic accessories' lead in sales, indicating strong customer preference.
##### Unique Product Lines: 
The dataset features six distinct product lines, showcasing a diverse product range.
##### Revenue by Product Line: 
The revenue generated from each product line varies, with some lines performing significantly better than others.
#### Key Insight:
The popularity of 'Electronic accessories' suggests the need for focused inventory management and promotional efforts to capitalize on customer interest in this category.

## 2. Sales Analysis
### Sales Trends and Patterns
##### Time of Day: 
The majority of sales occur in the evening, followed by the afternoon, and the least in the morning.
##### Monthly Revenue: 
January recorded the highest total revenue, followed by March and February.
##### COGS Analysis: 
January also saw the highest Cost of Goods Sold (COGS), indicating a correlation with higher sales volumes.
##### Branch Performance: 
The Naypyitaw branch ('C') reported the highest revenue among all branches.
#### Key Insight:
Understanding peak sales times and high-performing months allows for better staffing and inventory decisions. The standout performance of the Naypyitaw branch indicates a strong local market presence.

## 3. Customer Analysis
### Customer Demographics and Preferences
##### Customer Type: 
'Members' contribute significantly to revenue and tend to buy more products compared to 'Normal' customers.
##### Gender Distribution: 
Female customers represent the majority, indicating potential for gender-specific marketing.
##### Payment Methods: 
'Ewallet' is the most preferred payment method, highlighting the shift towards digital transactions.
##### Customer Satisfaction Ratings: 
The highest customer satisfaction ratings are seen in the afternoon and on Mondays, indicating favorable shopping experiences during these times.
#### Key Insight:
The dominance of female customers and members suggests opportunities for personalized marketing strategies. The preference for digital payment methods underlines the importance of seamless digital transaction systems.

### Conclusion
This comprehensive analysis provides Walmart with actionable insights into product popularity, sales trends, and customer behavior. By leveraging these insights, Walmart can optimize inventory, enhance customer satisfaction, and boost sales through targeted marketing and improved operational efficiency. This project showcases the application of data analytics in retail to drive business success.


## Key Results and Insights
### Sales Trends and Patterns:
Result:
Sales were highest during the evening with 432 transactions, followed by the afternoon with 377 transactions, and the morning with 191 transactions.
Insight:
Evening times are the busiest, indicating a potential focus area for staffing and inventory management to meet higher demand.
### Product Line Performance:
Result:
'Electronic accessories' was the most sold product line, with 971 units sold.
Insight:
This product line is particularly popular among customers, suggesting a need for adequate stock levels and targeted promotions in this category.
### Customer Preferences and Behavior:
Result:
'Members' generated a total revenue of $164,223.44 and had an average VAT of 15.61%.
Insight:
Members tend to make more frequent or higher-value purchases, making them a key customer segment for loyalty programs and personalized marketing.
### Store and Location Insights:
Result:
The branch in Naypyitaw (Branch 'C') had the highest revenue of $110,568.71.
Insight:
Naypyitaw's store has strong local demand, suggesting effective local marketing or a loyal customer base. It might benefit from further investment or expansion.
### Payment Methods:
Result:
'Ewallet' was the most common payment method, with 345 transactions.
Insight:
A significant portion of transactions are digital, highlighting the importance of maintaining robust digital payment systems and potentially expanding e-commerce strategies.
### Customer Demographics:
Result:
The majority of customers were female, with 501 transactions.
Insight:
Female customers form the largest demographic, suggesting potential for gender-targeted marketing and product offerings.
Rating and Feedback Analysis:

Result:
The highest average rating of 7.03 was given in the afternoon, with Monday having the best average rating of 7.15 overall.
Insight:
Higher ratings in the afternoon and on Mondays may indicate better customer satisfaction during these times, which could be explored for consistent quality assurance or special promotions.
### Conclusion:
These insights provide a detailed understanding of customer behavior, product popularity, and operational performance across different Walmart branches. By leveraging this data, Walmart can optimize stock levels, tailor marketing efforts, and improve customer satisfaction. This project demonstrates the capability to analyze retail data and extract actionable business intelligence, making it a valuable addition to your portfolio.
