-- Table: Project

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | project_id  | int     |
-- | employee_id | int     |
-- +-------------+---------+
-- (project_id, employee_id) is the primary key of this table.
-- employee_id is a foreign key to Employee table.
-- Each row of this table indicates that the employee with employee_id is working on the project with project_id.
 

-- Table: Employee

-- +------------------+---------+
-- | Column Name      | Type    |
-- +------------------+---------+
-- | employee_id      | int     |
-- | name             | varchar |
-- | experience_years | int     |
-- +------------------+---------+
-- employee_id is the primary key of this table. It's guaranteed that experience_years is not NULL.
-- Each row of this table contains information about one employee.
 

-- Write an SQL query that reports the average experience years of all the employees for each project, rounded to 2 digits.

-- Return the result table in any order.

-- Solution --  
-- Select project Id and calculate average experience 
-- Get the average of experience_years for employees
-- Round the result 2 places 
SELECT p.project_id, ROUND(AVG(e.experience_years),2) AS average_years
-- Start from Project table and Left Join to Employee Table
FROM Project p 
LEFT JOIN Employee e
--match employee id from product table to the employee id from the employee table
ON p.employee_id = e.employee_id
-- group results by project_id to get one row per project 
GROUP BY p.project_id