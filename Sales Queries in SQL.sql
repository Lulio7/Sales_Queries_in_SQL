SELECT *
FROM sales_data;

UPDATE sales_data
SET `Time` = STR_TO_DATE(`Time`, '%H:%i:%s');

ALTER TABLE sales_data
MODIFY `Time` TIME;

SELECT 
`Time`,
(CASE
	WHEN `Time` BETWEEN "00:00:00" AND "12:00:00" THEN 'Morning'
    WHEN `Time` BETWEEN "12:00:01" AND "16:00:00" THEN 'Afternoon'
    ELSE 'Evening' 
    END) AS time_of_date
FROM sales_data;

ALTER TABLE sales_data 
ADD COLUMN time_of_date VARCHAR(20);

UPDATE sales_data
SET time_of_date = 
(CASE
	WHEN `Time` BETWEEN "00:00:00" AND "12:00:00" THEN 'Morning'
    WHEN `Time` BETWEEN "12:00:01" AND "16:00:00" THEN 'Afternoon'
    ELSE 'Evening' 
    END);

SELECT *
FROM sales_data;

/* Add a new column as the day name */

SELECT
	`Date`,
    dayname(`Date`)
FROM sales_data;

ALTER TABLE sales_data
ADD COLUMN day_name VARCHAR(10);

UPDATE sales_data
SET day_name = dayname(`Date`);

SELECT *
FROM sales_data;

/* Add month name */

SELECT
	`Date`,
    monthname(`Date`)
FROM sales_data;

ALTER TABLE sales_data
ADD COLUMN month_name VARCHAR(10);

UPDATE sales_data
SET month_name = monthname(`Date`);

SELECT *
FROM sales_data;

/* How many unique cities does the data have? and In which city is each branch? */

SELECT
	DISTINCT City,
    branch
FROM sales_data;

/* How many unique product lines does the data have? */

SELECT
	DISTINCT `Product line`
FROM sales_data;

SELECT
	COUNT(DISTINCT `Product line`)
FROM sales_data;

/* What is the most common payment method? */

SELECT
    Payment,
    COUNT(Payment) AS Payment_method
FROM 
    sales_data
GROUP BY 
    Payment
ORDER BY 
    Payment_method DESC;

/* What is the most selling product line? */

SELECT *
FROM sales_data;

SELECT
    `Product line`,
    COUNT(`Product line`) AS `count`
FROM sales_data
GROUP BY `Product line`
ORDER BY `count` DESC;

/* What is the total revenue by month? */

SELECT 
month_name AS `Month`,
SUM(Total) AS 'Total_Revenue'
FROM sales_data
GROUP BY month_name
ORDER BY 'Total_Revenue' DESC;

/* What month had the largest COGS? */

SELECT
month_name AS `Month`,
SUM(cogs) AS `cogs`
FROM sales_data
GROUP BY month_name
ORDER BY cogs DESC;

/* What product line had the largest revenue? */

SELECT
`Product line` AS `Line`,
SUM(Total) AS 'Total_Revenue'
FROM sales_data
GROUP BY `Line`
ORDER BY 'Total_Revenue' DESC;

/* What is the city with the largest revenue? */

SELECT
`City`,
SUM(Total) AS 'Total_Revenue'
FROM sales_data
GROUP BY `City`
ORDER BY 'Total_Revenue' DESC;

/* What product line had the largest VAT? */

SELECT
`Product line` AS `Line`,
AVG(`Tax 5%`) AS 'avg_tax'
FROM sales_data
GROUP BY `Line`
ORDER BY 'avg_tax' DESC;

/* Which branch sold more products than average product sold? */

SELECT
`Branch`,
SUM(`Quantity`) AS 'qty'
FROM sales_data
GROUP BY `Branch`
HAVING SUM(`Quantity`) > (SELECT AVG(`Quantity`) FROM sales_data);

/* What is the most common product line by gender? */

SELECT
`gender`,
`Product line`,
COUNT(`gender`) AS 'total_qty'
FROM sales_data
GROUP BY `gender`, `Product line` 
ORDER BY 'total_qty' DESC;

/* What is the average rating of each product line? */

SELECT
	ROUND(AVG(`Rating`),2) AS 'avg_rating',
    `Product line`
FROM sales_data
GROUP BY `Product line`
ORDER BY 'avg_rating' DESC;

/* Sales
1.Number of sales made in each time of the day per weekday
2.Which of the customer types brings the most revenue?
3.Which city has the largest tax percent/ VAT (Value Added Tax)?
4.Which customer type pays the most in VAT? */

/* Number of sales made in each time of the day per weekday */

SELECT
	`time_of_date`,
    COUNT(`total`) AS 'total'
FROM sales_data
WHERE `day_name` = 'Monday'
GROUP BY `time_of_date`
ORDER BY 'total' DESC;

/* Which of the customer types brings the most revenue? */

SELECT
	`Customer type`,
    SUM(`Total`) AS 'total_rev'
FROM sales_data
GROUP BY `Customer type`
ORDER BY 'total_rev' DESC;

/* Which city has the largest tax percent/ VAT (Value Added Tax)? */

SELECT
	`City`,
	AVG(`Tax 5%`) AS 'avg_vat'
FROM sales_data
GROUP BY `City`
ORDER BY 'avg_vat';

/* Which customer type pays the most in VAT? */

SELECT
	`Customer type`,
	AVG(`Tax 5%`) AS 'avg_vat'
FROM sales_data
GROUP BY `Customer type`
ORDER BY 'avg_vat';

-- Customer Information

/* How many unique payment methods does the data have? */

SELECT distinct `Payment`
FROM sales_data;

/* What is the most common customer type? */

SELECT
`Customer type`,
COUNT(`Customer type`) AS 'COUNT'
FROM sales_data
GROUP BY `Customer type`
ORDER BY 'COUNT';

/* What is the gender of most of the customers? */

SELECT
	`Gender`,
    COUNT(*) AS 'TOTAL'
FROM sales_data
GROUP BY `Gender`
ORDER BY 'TOTAL'
