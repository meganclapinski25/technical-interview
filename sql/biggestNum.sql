-- Table: MyNumbers

-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | num         | int  |
-- +-------------+------+
-- This table may contain duplicates (In other words, there is no primary key for this table in SQL).
-- Each row of this table contains an integer.
 

-- A single number is a number that appeared only once in the MyNumbers table.

-- Find the largest single number. If there is no single number, report null.

-- Solution -- 

-- Outer Query = max(num ) gets largest number from results by subquery
-- as num gives a name to resulting column
SELECT MAX(num) AS num
-- opens subquery
-- selects each unqiue number from table
FROM (
    SELECT num
    FROM MyNumbers
    -- groupby number so you can apply aggregation functions
    GROUP BY num
    -- filters grouped numbers and only keeps the numbers where the count is 1 = only appears once
    HAVING COUNT(num) = 1
    -- ends the subquery by giving derived table as its only name so it can be referrred to 
) AS unique_numbers;

