-- Table: Activity

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | user_id       | int     |
-- | session_id    | int     |
-- | activity_date | date    |
-- | activity_type | enum    |
-- +---------------+---------+
-- This table may have duplicate rows.
-- The activity_type column is an ENUM (category) of type ('open_session', 'end_session', 'scroll_down', 'send_message').
-- The table shows the user activities for a social media website. 
-- Note that each session belongs to exactly one user.
 

-- Write a solution to find the daily active user count for a period of 30 days ending 2019-07-27 inclusively. A user was active on someday if they made at least one activity on that day.

-- Return the result table in any order.

-- Solution -- 

-- select activity date  and count unique users for that date
SELECT activity_date AS day, -- rename activity_date date to 'day'
COUNT(DISTINCT user_id) AS active_users  -- count number of unique users active on that date
FROM Activity
WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27' -- filter rows to include only activitity within period
GROUP BY activity_date;