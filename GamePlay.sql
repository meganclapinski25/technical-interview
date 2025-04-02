-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | player_id    | int     |
-- | device_id    | int     |
-- | event_date   | date    |
-- | games_played | int     |
-- +--------------+---------+
-- (player_id, event_date) is the primary key (combination of columns with unique values) of this table.
-- This table shows the activity of players of some games.
-- Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on someday using some device.
 

-- Write a solution to find the first login date for each player.

-- Return the result table in any order.


-- Solution -- 

-- Get the player's id and their minimum event_date (min() function gets the smallest date or earlist in this context) 
-- create that as first_login column
select player_id,min(event_date) as first_login
-- Get this from the Activity Table
from Activity
-- Group by player_id (This makes sure that we get each individual first_login for each player_id instead of overall minimum)
group by player_id

--Explantion (in my words)
-- We select the player_id and use the minimum function in order to get the earlist event_date 
-- we alias that as first_login to make it clear 
-- We are selecting this data from the Activity table where the data is stored
-- we then want to group by player_id in order to get each indivudal first_login for each player instead of the overall first_login