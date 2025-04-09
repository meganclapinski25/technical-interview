-- Table: Person

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | personId    | int     |
-- | lastName    | varchar |
-- | firstName   | varchar |
-- +-------------+---------+
-- personId is the primary key (column with unique values) for this table.
-- This table contains information about the ID of some persons and their first and last names.
 

-- Table: Address

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | addressId   | int     |
-- | personId    | int     |
-- | city        | varchar |
-- | state       | varchar |
-- +-------------+---------+
-- addressId is the primary key (column with unique values) for this table.
-- Each row of this table contains information about the city and state of one person with ID = PersonId.
 

-- Write a solution to report the first name, last name, city, and state of each person in the Person table. If the address of a personId is not present in the Address table, report null instead.

-- Return the result table in any order.

-- Solution -- 

-- Selecting the person's name from the Person Table 
-- Selecting the city and state from the Address Table 
SELECT p.firstName, p.lastName, a.city, a.state 
-- Start with Person Table (labeled as p)
FROM Person p 
-- Left Join ( All rows from Person Table even if no match in Address Table)
-- If Match based on personID pull the city and state from Address
LEFT JOIN Address a  
ON p.personID = a.personId;