-- Table: Cinema

-- +----------------+----------+
-- | Column Name    | Type     |
-- +----------------+----------+
-- | id             | int      |
-- | movie          | varchar  |
-- | description    | varchar  |
-- | rating         | float    |
-- +----------------+----------+
-- id is the primary key (column with unique values) for this table.
-- Each row contains information about the name of a movie, its genre, and its rating.
-- rating is a 2 decimal places float in the range [0, 10]
 

-- Write a solution to report the movies with an odd-numbered ID and a description that is not "boring".

-- Return the result table ordered by rating in descending order.


-- Solution -- 

-- Select everything from table, as result wanted
SELECT * FROM Cinema
-- Use Where statment specify the odd numbered id
WHERE id % 2 = 1 
-- And also the description not being boring 
AND description != ' boring'
-- Order the table by ratings in descending order
ORDER BY rating DESC;
