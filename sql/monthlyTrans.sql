-- Table: Transactions

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | country       | varchar |
-- | state         | enum    |
-- | amount        | int     |
-- | trans_date    | date    |
-- +---------------+---------+
-- id is the primary key of this table.
-- The table has information about incoming transactions.
-- The state column is an enum of type ["approved", "declined"].
 

-- Write an SQL query to find for each month and country, the number of transactions and their total amount, the number of approved transactions and their total amount.

-- Return the result table in any order.

-- The query result format is in the following example.

-- Solution -- 

SELECT 
-- Extract the month part of the date 
    LEFT(trans_date, 7) AS month,
    -- groupy by country
    country, 
    -- count total number of transactions as trans_counts
    COUNT(id) AS trans_count,
    -- count how many transactions were approved 
    SUM(state = 'approved') AS approved_count,
    -- Total transaction for month and country
    SUM(amount) AS trans_total_amount,
    -- Total amount of only the approved transactions
    SUM((state = 'approved') * amount) AS approved_total_amount
FROM 
    Transactions
GROUP BY 
    month, country;