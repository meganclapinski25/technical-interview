-- Table: Students

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | student_id    | int     |
-- | student_name  | varchar |
-- +---------------+---------+
-- student_id is the primary key (column with unique values) for this table.
-- Each row of this table contains the ID and the name of one student in the school.
 

-- Table: Subjects

-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | subject_name | varchar |
-- +--------------+---------+
-- subject_name is the primary key (column with unique values) for this table.
-- Each row of this table contains the name of one subject in the school.
 

-- Table: Examinations

-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | student_id   | int     |
-- | subject_name | varchar |
-- +--------------+---------+
-- There is no primary key (column with unique values) for this table. It may contain duplicates.
-- Each student from the Students table takes every course from the Subjects table.
-- Each row of this table indicates that a student with ID student_id attended the exam of subject_name.
 

-- Write a solution to find the number of times each student attended each exam.

-- Return the result table ordered by student_id and subject_name.

-- The result format is in the following example.

-- Solution

-- Get student_id and student_name from Students table
-- Get subject_name from Subject table
-- Count how mnay a student appeared for tht subject in Exam table
SELECT
    S.student_id
    ,S.student_name
    ,SU.subject_name
    ,COUNT(E.student_id) attended_exams
FROM Students S
-- Creates all combinations of students and subjects
-- accounting for every possible student-subject pair 
CROSS JOIN Subjects SU
-- LEFT JOIN brings exam attendance data 
-- Mathces rows in Exam table with student, subject pairs
-- If student didn't take exam, the join still keeps row but E.student_id will be Null
LEFT JOIN Examinations E
    ON S.student_id = E.student_id
    AND SU.subject_name = E.subject_name
-- Group by results of student, subject pair  
GROUP BY S.student_id, S.student_name, SU.subject_name
-- Order result 
ORDER BY S.student_id, S.student_name, SU.subject_name
;