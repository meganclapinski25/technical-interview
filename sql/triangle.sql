-- Table: Triangle

-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | x           | int  |
-- | y           | int  |
-- | z           | int  |
-- +-------------+------+
-- In SQL, (x, y, z) is the primary key column for this table.
-- Each row of this table contains the lengths of three line segments.
 

-- Report for every three line segments whether they can form a triangle.

-- Return the result table in any order.

-- Select all columns from table
SELECT *,
-- Adds a new column called triangle, which says yes if the sides can form and No if not
    CASE
    -- Checking to see if all sides would form a triangle
        WHEN x + y > z AND x + z > y AND y + z > x THEN 'Yes'
        ELSE 'No'
    -- end as the columns triangle
    END AS triangle
FROM Triangle;
