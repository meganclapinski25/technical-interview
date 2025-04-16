-- Table: Users

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | name          | varchar |
-- +---------------+---------+
-- id is the column with unique values for this table.
-- name is the name of the user.
 

-- Table: Rides

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | user_id       | int     |
-- | distance      | int     |
-- +---------------+---------+
-- id is the column with unique values for this table.
-- user_id is the id of the user who traveled the distance "distance".
 

-- Write a solution to report the distance traveled by each user.

-- Return the result table ordered by travelled_distance in descending order, if two or more users traveled the same distance, order them by their name in ascending order.

-- Solution -- 

-- Select the name of each user and totaled travelled distance
-- use IFNULL to handle users with no rides 
SELECT u.name, IFNULL(SUM(distance),0) AS travelled_distance
-- From the Users table aliased as 'u'
-- Perform a LEFT JOIN to include all users even if they haven't taken any rides
FROM Users AS u LEFT JOIN Rides AS r
ON u.id = r.user_id
-- Group by user id to sum the distances per user 
GROUP BY u.id
-- Order first by distance in descending order, then by name in ascending
ORDER BY travelled_distance DESC, name