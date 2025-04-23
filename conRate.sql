-- Table: Signups

-- +----------------+----------+
-- | Column Name    | Type     |
-- +----------------+----------+
-- | user_id        | int      |
-- | time_stamp     | datetime |
-- +----------------+----------+
-- user_id is the column of unique values for this table.
-- Each row contains information about the signup time for the user with ID user_id.
 

-- Table: Confirmations

-- +----------------+----------+
-- | Column Name    | Type     |
-- +----------------+----------+
-- | user_id        | int      |
-- | time_stamp     | datetime |
-- | action         | ENUM     |
-- +----------------+----------+
-- (user_id, time_stamp) is the primary key (combination of columns with unique values) for this table.
-- user_id is a foreign key (reference column) to the Signups table.
-- action is an ENUM (category) of the type ('confirmed', 'timeout')
-- Each row of this table indicates that the user with ID user_id requested a confirmation message at time_stamp and that confirmation message was either confirmed ('confirmed') or expired without confirming ('timeout').
 

-- The confirmation rate of a user is the number of 'confirmed' messages divided by the total number of requested confirmation messages. The confirmation rate of a user that did not request any confirmation messages is 0. Round the confirmation rate to two decimal places.

-- Write a solution to find the confirmation rate of each user.

-- Return the result table in any order.

-- Solution 

-- Select the user_id from Signups table (A is alias)
SELECT A.user_id, 
-- Calculates  the confirmation rate per user
-- If action is confirmed it gives a 1, if action is timeout or NULL it gives a 0
       ROUND(IFNULL(AVG(action = 'confirmed'), 0), 2) AS confirmation_rate
-- Each user has a specfic signup row, with A as the alias
FROM Signups AS A
-- Join the confirmations table to get each user's confirmation
-- Ensures LEFT JOIN will still include users who have never requested
LEFT JOIN Confirmations AS B ON A.user_id = B.user_id
-- Groupy by user_id s othat the ABG is calculated per user
GROUP BY A.user_id;