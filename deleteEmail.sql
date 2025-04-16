-- Table: Person

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | email       | varchar |
-- +-------------+---------+
-- id is the primary key (column with unique values) for this table.
-- Each row of this table contains an email. The emails will not contain uppercase letters.
 

-- Write a solution to delete all duplicate emails, keeping only one unique email with the smallest id.

-- For SQL users, please note that you are supposed to write a DELETE statement and not a SELECT one.

-- For Pandas users, please note that you are supposed to modify Person in place.

-- After running your script, the answer shown is the Person table. The driver will first compile and run your piece of code and then show the Person table. The final order of the Person table does not matter.

-- Solution -- 

-- First we delete rows represent by p (rows with duplicate emails) 
-- From table Person with the alias p
DELETE p FROM Person p
-- Preforms a self join, creating a second alias p2 for another instance of the Person table. 
-- compare each row in p with anotehr row in p2
JOIN Person p2
-- p.email = p2.email The rows are jpined when they have the same email 
-- ensures that the row with the larger id is (which is the duplicate) is targeted 
-- keeping the row with the smallest Id for the unique email 
ON p.Email = p2.Email and p.Id > p2.Id;