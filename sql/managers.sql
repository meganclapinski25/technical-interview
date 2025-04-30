-- Table: Employee

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | name        | varchar |
-- | department  | varchar |
-- | managerId   | int     |
-- +-------------+---------+
-- id is the primary key (column with unique values) for this table.
-- Each row of this table indicates the name of an employee, their department, and the id of their manager.
-- If managerId is null, then the employee does not have a manager.
-- No employee will be the manager of themself.
 

-- Write a solution to find managers with at least five direct reports.

-- Return the result table in any order.

-- The result format is in the following example.

-- Solution 

-- Select name of manager, pulling from E1 as an alias (e1 look up manager names using id)
SELECT E1.name
FROM Employee E1
-- Go back to Employee table
-- select managerID to count how many people the manager oversees, use Count for this 
-- Groupby this to COUNt
-- having count keeps managers who have 5 or more direct reports
JOIN (
    SELECT managerId, COUNT(*) AS directReports
    FROM Employee
    GROUP BY managerId
    HAVING COUNT(*) >= 5
) E2 ON E1.id = E2.managerId;
-- Join the subquery E1; E1.id and E2.managerID
-- matching each manager ID with their actual name from Employee Table 