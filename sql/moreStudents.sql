-- Table: Courses

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | student     | varchar |
-- | class       | varchar |
-- +-------------+---------+
-- (student, class) is the primary key (combination of columns with unique values) for this table.
-- Each row of this table indicates the name of a student and the class in which they are enrolled.
 

-- Write a solution to find all the classes that have at least five students.

-- Return the result table in any order.


-- SELECT the classes from the Courses Table
SELECT class FROM Courses
-- Group by class ( all rows unique in class)
GROUP BY class
-- USE Having (used after the grouping) filtering groups that have 5 or more students 
HAVING COUNT(student) >=5;