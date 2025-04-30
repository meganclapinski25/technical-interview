-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | name        | varchar |
-- | salary      | int     |
-- | managerId   | int     |
-- +-------------+---------+
-- id is the primary key (column with unique values) for this table.
-- Each row of this table indicates the ID of an employee, their name, salary, and the ID of their manager.
 

-- Write a solution to find the employees who earn more than their managers.

-- Return the result table in any order.

-- Input: 
-- Employee table:
-- +----+-------+--------+-----------+
-- | id | name  | salary | managerId |
-- +----+-------+--------+-----------+
-- | 1  | Joe   | 70000  | 3         |
-- | 2  | Henry | 80000  | 4         |
-- | 3  | Sam   | 60000  | Null      |
-- | 4  | Max   | 90000  | Null      |
-- +----+-------+--------+-----------+
-- Output: 
-- +----------+
-- | Employee |
-- +----------+
-- | Joe      |
-- +----------+
-- Explanation: Joe is the only employee who earns more than his manager.

--Soultion--

-- Column name for output is Employee, we have to rename to match output
SELECT name AS Employee
-- Get it from employee TABLE
FROM employee e1
-- Have to compare internal values within table, use INNER JOIN
-- Join the ID column to the manger ID column to set the the right employees and managers
-- Sam would be corresponding with Joe -> Henry would correespond with Max
INNER JOIN employee e2 ON e1.id = e2.managerID
-- Now compare values of salary from employees to managers
-- Joe makes 70000 which is more than Sam at 60000
WHERE e1.salary < e2.salary