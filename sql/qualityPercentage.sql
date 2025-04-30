-- Table: Queries

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | query_name  | varchar |
-- | result      | varchar |
-- | position    | int     |
-- | rating      | int     |
-- +-------------+---------+
-- This table may have duplicate rows.
-- This table contains information collected from some queries on a database.
-- The position column has a value from 1 to 500.
-- The rating column has a value from 1 to 5. Query with rating less than 3 is a poor query.
 

-- We define query quality as:

-- The average of the ratio between query rating and its position.

-- We also define poor query percentage as:

-- The percentage of all queries with rating less than 3.

-- Write a solution to find each query_name, the quality and poor_query_percentage.

-- Both quality and poor_query_percentage should be rounded to 2 decimal places.

-- Return the result table in any order.

-- Solution -- 

-- Select query_name from queries

select query_name,
-- caluclate quality, take each rows' rating / position ratio
-- then calculate the average across all rows 
-- cast rating to decimal
-- round the result
round(avg(cast(rating as decimal) / position), 2) as quality,
-- Calculate poor query percentage:
-- Count how many rows have a rating < 3 
-- Multiply by 100 to get a percentage 
-- Divide by total number of rows (COUNT(*)) for that query_name
-- Round the result 
round(sum(case when rating < 3 then 1 else 0 end) * 100 / count(*), 2) as poor_query_percentage
from queries
group by query_name;