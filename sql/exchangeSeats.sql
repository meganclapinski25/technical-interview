-- Table: Seat

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | student     | varchar |
-- +-------------+---------+
-- id is the primary key (unique value) column for this table.
-- Each row of this table indicates the name and the ID of a student.
-- The ID sequence always starts from 1 and increments continuously.
 

-- Write a solution to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.

-- Return the result table ordered by id in ascending order.

-- The result format is in the following example.

 

-- Example 1:

-- Input: 
-- Seat table:
-- +----+---------+
-- | id | student |
-- +----+---------+
-- | 1  | Abbot   |
-- | 2  | Doris   |
-- | 3  | Emerson |
-- | 4  | Green   |
-- | 5  | Jeames  |
-- +----+---------+
-- Output: 
-- +----+---------+
-- | id | student |
-- +----+---------+
-- | 1  | Doris   |
-- | 2  | Abbot   |
-- | 3  | Green   |
-- | 4  | Emerson |
-- | 5  | Jeames  |
-- +----+---------+
-- Explanation: 
-- Note that if the number of students is odd, there is no need to change the last one's seat.

-- Solution -- 
SELECT 
--- Select seat and student name from Seat table
-- Use CASE statment to determine the new ide
    CASE 
    -- if the id is odd and the next id (id + 1) exists, swap the id with next one
        WHEN id % 2 = 1 AND id + 1 IN (SELECT id FROM Seat) THEN id + 1
        -- if the id is even, swap it with the previous one(id-1)
        WHEN id % 2 = 0 THEN id - 1
        -- if the condition is not met, keep the id unchanged (dsiregard last seat )
        ELSE id
        -- Output adjusted seat ids
    END AS id,
    student
FROM Seat
-- result is ordered by id in ascending order 
ORDER BY id;