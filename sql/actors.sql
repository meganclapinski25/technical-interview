-- Table: ActorDirector

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | actor_id    | int     |
-- | director_id | int     |
-- | timestamp   | int     |
-- +-------------+---------+
-- timestamp is the primary key (column with unique values) for this table.
 

-- Write a solution to find all the pairs (actor_id, director_id) where the actor has cooperated with the director at least three times.

-- -- Return the result table in any order.

-- Solution -- 

-- Select the actor and director from table
select actor_id, director_id
FROM ActorDirector
-- use group by to get a specfic condition and use aggregations
Group By actor_id,director_id
-- having count uses aggregation function to count how many times they have collaborated more than 3 times
Having count(timestamp) >=3