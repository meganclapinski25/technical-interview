-- Table: Employee

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | empId       | int     |
-- | name        | varchar |
-- | supervisor  | int     |
-- | salary      | int     |
-- +-------------+---------+
-- empId is the column with unique values for this table.
-- Each row of this table indicates the name and the ID of an employee in addition to their salary and the id of their manager.
 

-- Table: Bonus

-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | empId       | int  |
-- | bonus       | int  |
-- +-------------+------+
-- empId is the column of unique values for this table.
-- empId is a foreign key (reference column) to empId from the Employee table.
-- Each row of this table contains the id of an employee and their respective bonus.
 

-- Write a solution to report the name and bonus amount of each employee with a bonus less than 1000.

-- Return the result table in any order.

--Solution -- 
-- Get name from Employee Table and bonus from Bonus Table -> Get from Employee Table (We have all Employee Table data and bonus from Bonus Table)
SELECT Employee.name,Bonus.bonus FROM Employee 
-- Left Join (all data from Employees table are included) join match empID from Employees and Bonus Table
LEFT JOIN Bonus ON Employee.empID = Bonus.empID
-- Getting Employees who have a bonus less than 1000 or NULL 
WHERE bonus < 1000 OR Bonus IS NULL ;

-- Explanation -- 
-- Goal : Retrieve the names of employess along with their bonus amounts who have a bonus less than 1000 or no bonus

-- First we get two columns name from Employees and bonus from Bonus 
-- We pull data from the Employee table
-- We use Left Join to combine data from Employee table and Bonus table, trying to match by empID
-- The Left Join ensures that we get all data from Employee Table (even if a Bonus is NULL)
-- Then we filter to find our result of employees who have a bonus less than 1000 or no bonus at all 