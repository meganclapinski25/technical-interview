-- Table: Delivery

-- +-----------------------------+---------+
-- | Column Name                 | Type    |
-- +-----------------------------+---------+
-- | delivery_id                 | int     |
-- | customer_id                 | int     |
-- | order_date                  | date    |
-- | customer_pref_delivery_date | date    |
-- +-----------------------------+---------+
-- delivery_id is the column of unique values of this table.
-- The table holds information about food delivery to customers that make orders at some date and specify a preferred delivery date (on the same order date or after it).
 

-- If the customer's preferred delivery date is the same as the order date, then the order is called immediate; otherwise, it is called scheduled.

-- The first order of a customer is the order with the earliest order date that the customer made. It is guaranteed that a customer has precisely one first order.

-- Write a solution to find the percentage of immediate orders in the first orders of all customers, rounded to 2 decimal places.

-- Solution -- 

-- Select the final percentage, rounding 2 places
SELECT
    ROUND(
        100.0 * SUM(CASE 
        -- if the first order is immeditate, count as 1
                        WHEN order_date = customer_pref_delivery_date THEN 1 
                        ELSE 0 
                    END) / COUNT(*), -- Divide total number of first order to get proportion 
        2 -- round to 2 places
    ) AS immediate_percentage -- name resulting column
FROM (
    -- Get only the first order (earliest order_date) for each customer
    SELECT *
    FROM Delivery d1
    WHERE order_date = (
        -- find tthe earliest order_date for the current customer
        SELECT MIN(order_date)
        FROM Delivery d2
        WHERE d1.customer_id = d2.customer_id -- match same customer
    )
) AS first_orders; -- give subquery a name 