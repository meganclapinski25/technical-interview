-- Table: Activity

-- +----------------+---------+
-- | Column Name    | Type    |
-- +----------------+---------+
-- | machine_id     | int     |
-- | process_id     | int     |
-- | activity_type  | enum    |
-- | timestamp      | float   |
-- +----------------+---------+
-- The table shows the user activities for a factory website.
-- (machine_id, process_id, activity_type) is the primary key (combination of columns with unique values) of this table.
-- machine_id is the ID of a machine.
-- process_id is the ID of a process running on the machine with ID machine_id.
-- activity_type is an ENUM (category) of type ('start', 'end').
-- timestamp is a float representing the current time in seconds.
-- 'start' means the machine starts the process at the given timestamp and 'end' means the machine ends the process at the given timestamp.
-- The 'start' timestamp will always be before the 'end' timestamp for every (machine_id, process_id) pair.
-- It is guaranteed that each (machine_id, process_id) pair has a 'start' and 'end' timestamp.
 

-- There is a factory website that has several machines each running the same number of processes. Write a solution to find the average time each machine takes to complete a process.

-- The time to complete a process is the 'end' timestamp minus the 'start' timestamp. The average time is calculated by the total time to complete every process on the machine divided by the number of processes that were run.

-- The resulting table should have the machine_id along with the average time as processing_time, which should be rounded to 3 decimal places.

-- Return the result table in any order.

-- Solution 

-- Select machine_id. First column in final result, id of the machine we are calc average process time 
-- a2.timestamp - a1.timestamp = calc time taken for specfic process by subtracting start time from end time 
-- avgs process time for all processes on the same machine 
-- rounds the average time to 3 decimal places 
select a1.machine_id, round(avg(a2.timestamp-a1.timestamp), 3) as processing_time 
-- Using SELF JOIN. joining each start row (a1) with mathching end row(a2)
from Activity a1
join Activity a2 
-- using both machine_id and process_id
on a1.machine_id=a2.machine_id and a1.process_id=a2.process_id
-- filtering to match start row to end row. Without this we could match two start rows or two end rows together 
and a1.activity_type='start' and a2.activity_type='end'
-- group by machine_id to calc average process time per machine
group by a1.machine_id
