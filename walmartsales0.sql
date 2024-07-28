USE walmartsales0;
SELECT * FROM SALES;
-- Feature Engineering: This will help use generate some new columns from existing ones.
-- Add a new column named time_of_day to give insight of sales in the Morning, Afternoon and Evening. 
SELECT `TIME`, (CASE
			WHEN `Time` BETWEEN '00:00:00' AND '12:00:00' THEN 'MORNING'
			WHEN `Time` BETWEEN '12:00:01' AND '16:00:00' THEN 'AFTERNOON'
			ELSE 'EVENING' END) AS time_of_day
FROM SALES;
ALTER TABLE SALES
ADD COLUMN time_of_day VARCHAR(20);
UPDATE SALES
SET time_of_day=(CASE
			WHEN `Time` BETWEEN '00:00:00' AND '12:00:00' THEN 'MORNING'
			WHEN `Time` BETWEEN '12:00:01' AND '16:00:00' THEN 'AFTERNOON'
			ELSE 'EVENING' END);
-- Add a new column named day_name that contains the extracted days of the week on which the given transaction took place (Mon, Tue, Wed, Thur, Fri). 
SELECT `Date`, DAYNAME(`Date`) 
FROM SALES;
ALTER TABLE SALES ADD COLUMN day_name VARCHAR(10);
UPDATE SALES 
SET day_name = DAYNAME(`Date`) ;
-- Add a new column named month_name that contains the extracted months of the year on which the given transaction took place (Jan, Feb, Mar). 
SELECT `Date`, MONTHNAME(`Date`)
FROM SALES;
ALTER TABLE SALES ADD COLUMN month_name VARCHAR(10);
UPDATE SALES 
SET month_name = MONTHNAME(`Date`);

SELECT * FROM SALES;


-- ---------------------Generic Question---------------------:
-- How many unique cities does the data have?
SELECT COUNT(DISTINCT CITY) 
FROM SALES;  	-- 3
-- In which city is each branch?
SELECT CITY, BRANCH
FROM SALES
GROUP BY CITY, BRANCH;		-- 'Yangon', 'A' -- 'Naypyitaw', 'C' -- 'Mandalay', 'B'

-- ---------------------Product--------------------- :
-- How many unique product lines does the data have?
SELECT COUNT(DISTINCT `Product line`) 
FROM SALES;			-- 6
-- What is the most common payment method?
SELECT Payment, COUNT(Payment) AS CMN_PYMT
FROM SALES
GROUP BY Payment
ORDER BY Payment DESC
LIMIT 1;		-- 'Ewallet', '345'
-- What is the most selling product line?
SELECT `Product line`, SUM(Quantity) AS MOST_SELLING
FROM SALES
GROUP BY `Product line`
ORDER BY MOST_SELLING DESC
LIMIT 1;		-- 'Electronic accessories', '971'

-- What is the total revenue by month?
SELECT month_name, ROUND(SUM(Total), 2) AS TOTAL_REVN
FROM SALES
GROUP BY month_name; 		-- 'January' , '116291.87'
					    	-- 'March'   , '109455.51'
							-- 'February',  '97219.37'

-- What month had the largest COGS?
SELECT month_name, ROUND(SUM(cogs), 2) AS LARGEST_COGS
FROM SALES
GROUP BY month_name
ORDER BY LARGEST_COGS DESC
LIMIT 1;		-- 'January', '110754.16'

-- What product line had the largest revenue?
SELECT month_name, ROUND(SUM(Total), 2) AS LARGEST_REVN
FROM SALES
GROUP BY month_name
ORDER BY LARGEST_REVN DESC
LIMIT 1;		-- 'January', '116291.87'

-- What is the city with the largest revenue?
SELECT BRANCH, City, ROUND(SUM(Total), 2) AS LARGEST_REVN
FROM SALES
GROUP BY BRANCH, City
ORDER BY LARGEST_REVN DESC
LIMIT 1;		-- 'C', 'Naypyitaw', '110568.71'

-- What product line had the largest VAT?
SELECT `Product line`, ROUND(AVG(`Tax 5%`), 2) AS LARGEST_VAT
FROM SALES
GROUP BY `Product line`
ORDER BY LARGEST_VAT DESC
LIMIT 1;		-- 'Home and lifestyle', '16.03'

-- Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
SELECT ROUND(AVG(Quantity), 2) AS AVG_SALES
FROM SALES;		-- '5.51'

SELECT `product line`, 
		(CASE WHEN ROUND(AVG(Quantity), 2) > (SELECT ROUND(AVG(Quantity), 2) AS AVG_SALES FROM SALES)
        THEN 'GOOD' ELSE 'BAD' END) AS REMARK
FROM SALES
GROUP BY `product line`;		-- 'Health and beauty', 'GOOD' -- 'Food and beverages', 'BAD'

-- Which branch sold more products than average product sold?
SELECT AVG(Quantity) FROM SALES;		-- '5.5100'

SELECT BRANCH, SUM(Quantity) AS QUNT
FROM SALES 
GROUP BY BRANCH
HAVING SUM(Quantity) > (SELECT AVG(Quantity) FROM SALES);
-- What is the most common product line by gender?
SELECT `Product line`, GENDER, count(GENDER) AS CNT_GENDER
FROM SALES
GROUP BY GENDER, `Product line`
ORDER BY CNT_GENDER DESC
LIMIT 1;		-- 'Fashion accessories', 'Female', '96'

-- What is the average rating of each product line?
SELECT `Product line`, round(AVG(Rating), 2) AS AVG_RATING
FROM SALES
GROUP BY `Product line`
ORDER BY AVG_RATING;

-- ---------------------Sales--------------------- :
-- Number of sales made in each time of the day per weekday
SELECT time_of_day, COUNT(*) AS NB_SALES
FROM SALES
GROUP BY time_of_day
ORDER BY NB_SALES;		-- 'MORNING'  , '191' 
						-- 'AFTERNOON', '377' 
						-- 'EVENING'  , '432'

-- Which of the customer types brings the most revenue?
SELECT `Customer type`, ROUND(SUM(TOTAL), 2) AS REVENU
FROM SALES
GROUP BY `Customer type`
ORDER BY REVENU DESC 
LIMIT 1;		-- 'Member', '164223.44'

-- Which city has the largest tax percent/ VAT (Value Added Tax)?
SELECT CITY, ROUND(AVG(`Tax 5%`), 2) AS AVG_TAX_PERC
FROM SALES
GROUP BY CITY 
ORDER BY AVG_TAX_PERC DESC
LIMIT 1;		-- 'Naypyitaw', '16.05'

-- ---------------------Customer--------------------- :
-- Which customer type pays the most in VAT?
SELECT `Customer type`, ROUND(AVG(`Tax 5%`), 2) AS AVG_TAX_PERC
FROM SALES
GROUP BY `Customer type` 
ORDER BY AVG_TAX_PERC DESC
LIMIT 1;		-- 'Member', '15.61'

-- How many unique customer types does the data have?
SELECT COUNT(DISTINCT `Customer type`) AS CNT_CUSTMR
FROM SALES;			-- 2
 
-- How many unique payment methods does the data have?
SELECT COUNT(DISTINCT Payment) AS CNT_PYMNT
FROM SALES;		-- 3

-- What is the most common customer type?
SELECT `Customer type`, COUNT(*) AS CNT
FROM SALES
GROUP BY `Customer type`
ORDER BY CNT DESC
LIMIT 1;		-- 'Member', '501'

-- Which customer type buys the most?
SELECT `Customer type`, SUM(Quantity) AS QUNT
FROM SALES
GROUP BY `Customer type`
ORDER BY QUNT DESC
LIMIT 1;		-- 'Member', '2785'

-- What is the gender of most of the customers?
SELECT GENDER, COUNT(*) AS CNT
FROM SALES
GROUP BY GENDER
ORDER BY CNT DESC
LIMIT 1;		-- 'Female', '501'

-- What is the gender distribution per branch?
SELECT BRANCH, GENDER, COUNT(*) AS CNT
FROM SALES
GROUP BY BRANCH, GENDER
ORDER BY BRANCH;		-- MAX: 'A', 'Male', '179'

-- Which time of the day do customers give most ratings?
SELECT time_of_day, ROUND(AVG(Rating), 2) AS AVG_RATING
FROM SALES
GROUP BY time_of_day
ORDER BY AVG_RATING DESC
LIMIT 1;		-- 'AFTERNOON', '7.03'

-- Which time of the day do customers give most ratings per branch?
SELECT BRANCH, time_of_day, ROUND(AVG(Rating), 2) AS AVG_RATING
FROM SALES
GROUP BY time_of_day, BRANCH
ORDER BY AVG_RATING DESC
LIMIT 1;		-- 'A', 'AFTERNOON', '7.19'

-- Which day OF the week has the best avg ratings?
SELECT day_name, ROUND(AVG(Rating), 2) AS AVG_RATING
FROM SALES
GROUP BY day_name
ORDER BY AVG_RATING DESC
LIMIT 1;		-- 'Monday', '7.15'

-- Which day of the week has the best average ratings per branch?
SELECT BRANCH, day_name, ROUND(AVG(Rating), 2) AS AVG_RATING
FROM SALES
GROUP BY day_name, BRANCH
ORDER BY AVG_RATING DESC
LIMIT 1;		-- 'B', 'Monday', '7.34'
