-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | teacher_id  | int  |
-- | subject_id  | int  |
-- | dept_id     | int  |
-- +-------------+------+
-- (subject_id, dept_id) is the primary key (combinations of columns with unique values) of this table.
-- Each row in this table indicates that the teacher with teacher_id teaches the subject subject_id in the department dept_id.
 

-- Write a solution to calculate the number of unique subjects each teacher teaches in the university.

-- Return the result table in any order.



-- Solution -- 
-- Select -> return results per teacher
--Count(distinict) -> counting unique subjects each teacher teaches
-- Even if Teacher teaches the same subject in multiple departements we only want
-- to count that subject once
--Group BY -> groups all rows in table by each teacher_id, each teacher gets the count separately
SELECT teacher_id, count(distinct(subject_id)) as cnt 
FROM Teacher
GROUP BY teacher_id