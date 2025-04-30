-- Table: Prices

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | product_id    | int     |
-- | start_date    | date    |
-- | end_date      | date    |
-- | price         | int     |
-- +---------------+---------+
-- (product_id, start_date, end_date) is the primary key (combination of columns with unique values) for this table.
-- Each row of this table indicates the price of the product_id in the period from start_date to end_date.
-- For each product_id there will be no two overlapping periods. That means there will be no two intersecting periods for the same product_id.
 

-- Table: UnitsSold

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | product_id    | int     |
-- | purchase_date | date    |
-- | units         | int     |
-- +---------------+---------+
-- This table may contain duplicate rows.
-- Each row of this table indicates the date, units, and product_id of each product sold. 
 

-- Write a solution to find the average selling price for each product. average_price should be rounded to 2 decimal places. If a product does not have any sold units, its average selling price is assumed to be 0.

-- Return the result table in any order.

-- Solution -- 
-- Select the product Id and the calculated average price for each product
SELECT p.product_id, 
-- Calculate total Rev ( units x price) divded by the total sold
-- Round the result 
-- If no units were sold it will be Null or 0 
IFNULL(ROUND(SUM(units*price)/SUM(units),2),0) AS average_price
-- From the Prices Table 
FROM Prices p LEFT JOIN UnitsSold u
-- Left join with UnitsSold table as U, includes all prodcuts even if no sale
-- Match by product Id, and only join if the sale date falls wiithin the prices date range
ON p.product_id = u.product_id AND
u.purchase_date BETWEEN start_date AND end_date
-- group by productId 
group by product_id