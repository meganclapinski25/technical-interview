-- sales_id is the primary key (column with unique values) for this table.
-- Each row of this table indicates the name and the ID of a salesperson alongside their salary, commission rate, and hire date.

-- Table: Company

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | com_id      | int     |
-- | name        | varchar |
-- | city        | varchar |
-- +-------------+---------+
-- com_id is the primary key (column with unique values) for this table.
-- Each row of this table indicates the name and the ID of a company and the city in which the company is located.
 

-- Table: Orders

-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | order_id    | int  |
-- | order_date  | date |
-- | com_id      | int  |
-- | sales_id    | int  |
-- | amount      | int  |
-- +-------------+------+
-- order_id is the primary key (column with unique values) for this table.
-- com_id is a foreign key (reference column) to com_id from the Company table.
-- sales_id is a foreign key (reference column) to sales_id from the SalesPerson table.
-- Each row of this table contains information about one order. This includes the ID of the company, the ID of the salesperson,
-- the date of the order, and the amount paid.

--Question -- 
-- Write a solution to find the names of all the salespersons who did not have any orders related to the company with the name "RED".

-- Return the result table in any order.

-- The result format is in the following example.

-- SOLUTION -- 

-- Get name from Sales Person table (use s. to make it clear that we are getting the name from Sale Person (s) ) 
select s.name
from SalesPerson s
-- Filter where s.name is not in the result we want(didn't sell to RED company)
where s.name not in
-- Select salesperson name who have sold something to RED 
    (select s.name
    from SalesPerson s
    -- Joins the SalesPerson table with Orders Table (o = Orders ; s = SalesPerson)
    -- sales_id from SalesPerson = sales_id from Orders -> Left Join 
        left join Orders o on s.sales_id = o.sales_id
    -- Left Join Company (C) with com_id from Order Table = com_id from Company table
        left join Company c on o.com_id = c.com_id
    -- finding where Company name = "red"
    where c.name = 'Red')



-- Explanation -- 
-- (for more context)

-- * First we use LEft Join to return all records from left table (Sales Person) and matching records from right table Orders and Company

-- Main query 
    -- select s.name
    --from SalesPerson s
    -- where s.name not in 

-- Bottom up approach this exludes people that have sold to RED

--Sub Query 
    -- (select s.name
    -- from SalesPerson s
    -- -- Joins the SalesPerson table with Orders Table (o = Orders ; s = SalesPerson)
    -- -- sales_id from SalesPerson = sales_id from Orders -> Left Join 
    --     left join Orders o on s.sales_id = o.sales_id
    -- -- Left Join Company (C) with com_id from Order Table = com_id from Company table
    --     left join Company c on o.com_id = c.com_id
    -- -- finding where Company name = "red"
    -- where c.name = 'Red')

-- We get the sales person name from SalesPerson table
-- we Left Join Order to Sales Person on sales_id to match salesperson with sales
-- we Left Join Company Company on com_id to determine which company each order was made to 
-- Where c.name = red filter results to only include sales to "Red"
-- because of the main query excluding people that have made sales to Red
-- our final result shows the salesperson who have not sold to RED 



