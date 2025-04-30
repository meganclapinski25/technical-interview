-- Table: Users

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | user_id     | int     |
-- | user_name   | varchar |
-- +-------------+---------+
-- user_id is the primary key (column with unique values) for this table.
-- Each row of this table contains the name and the id of a user.
 

-- Table: Register

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | contest_id  | int     |
-- | user_id     | int     |
-- +-------------+---------+
-- (contest_id, user_id) is the primary key (combination of columns with unique values) for this table.
-- Each row of this table contains the id of a user and the contest they registered into.
 

-- Write a solution to find the percentage of the users registered in each contest rounded to two decimals.

-- Return the result table ordered by percentage in descending order. In case of a tie, order it by contest_id in ascending order.

-- Solution -- 

-- Select the contest ID and caluclated registration percentage
select contest_id, 
-- Count how many unique users
-- divide by the total number of users( from Users Table)
-- multiply by 100 to get percentage
-- round the result 
round(count(distinct user_id) * 100 /(select count(user_id) from Users) ,2) as percentage
from  Register
-- group by contest_id so we calculate the percentge for each individual
group by contest_id
-- order by percentage descending to show most popular contest first
order by percentage desc,contest_id