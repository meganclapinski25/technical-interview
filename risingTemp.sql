-- Table: Weather

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | recordDate    | date    |
-- | temperature   | int     |
-- +---------------+---------+
-- id is the column with unique values for this table.
-- There are no different rows with the same recordDate.
-- This table contains information about the temperature on a certain day.
 

-- Write a solution to find all dates' id with higher temperatures compared to its previous dates (yesterday).

-- Return the result table in any order.

-- The result format is in the following example.

-- Solution 

-- selects the id of the today row, this is made up after we cross join
SELECT today.id
-- Creating two aliases of the same table
-- Yesterday represents earlier date
FROM Weather yesterday 
-- Today represents later date
-- Cross join pairs every row from yesterday table with every row from the today table
CROSS JOIN Weather today
-- Narrow it down using WHERE
-- DateDiff calcualtes the number of days between two Dates
-- finds weather data where the date is exaclty one day apart 
WHERE DATEDIFF(today.recordDate,yesterday.recordDate) = 1
-- Keeps pairs where the "Today" temp is higher than the yesterday temp 
    AND today.temperature > yesterday.temperature
