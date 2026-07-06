USE walmart;

ALTER TABLE sales
ADD COLUMN time_of_day VARCHAR(20);

ALTER TABLE sales
ADD COLUMN day_name VARCHAR(20);

ALTER TABLE sales
ADD COLUMN month_name VARCHAR(20);

UPDATE sales
SET
time_of_day =
CASE
WHEN time BETWEEN '00:00:00' AND '11:59:59' THEN 'Morning'
WHEN time BETWEEN '12:00:00' AND '17:59:59' THEN 'Afternoon'
ELSE 'Evening'
END,

day_name = DAYNAME(date),

month_name = MONTHNAME(date);