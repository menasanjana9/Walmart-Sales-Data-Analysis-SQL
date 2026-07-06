USE walmart;

-- ============================================
-- WALMART SALES DATA ANALYSIS
-- ============================================

-- =====================================================
-- PRODUCT ANALYSIS
-- =====================================================

-- 1. Number of unique product lines
SELECT COUNT(DISTINCT product_line) AS total_product_lines
FROM sales;

-- 2. Most common payment method
SELECT payment, COUNT(*) AS transactions
FROM sales
GROUP BY payment
ORDER BY transactions DESC;

-- 3. Most selling product line
SELECT product_line, COUNT(*) AS total_sales
FROM sales
GROUP BY product_line
ORDER BY total_sales DESC;

-- 4. Total revenue by product line
SELECT product_line,
ROUND(SUM(total),2) AS revenue
FROM sales
GROUP BY product_line
ORDER BY revenue DESC;

-- 5. Average rating of each product line
SELECT product_line,
ROUND(AVG(rating),2) AS average_rating
FROM sales
GROUP BY product_line
ORDER BY average_rating DESC;

-- 6. Product line generating highest revenue
SELECT product_line,
ROUND(SUM(total),2) AS revenue
FROM sales
GROUP BY product_line
ORDER BY revenue DESC
LIMIT 1;

-- 7. Product line with highest VAT
SELECT product_line,
ROUND(SUM(vat),2) AS total_vat
FROM sales
GROUP BY product_line
ORDER BY total_vat DESC;

-- 8. Product line with highest quantity sold
SELECT product_line,
SUM(quantity) AS quantity_sold
FROM sales
GROUP BY product_line
ORDER BY quantity_sold DESC;

-- 9. Average unit price by product line
SELECT product_line,
ROUND(AVG(unit_price),2) AS average_price
FROM sales
GROUP BY product_line
ORDER BY average_price DESC;

-- 10. Highest rated product line
SELECT product_line,
ROUND(AVG(rating),2) AS rating
FROM sales
GROUP BY product_line
ORDER BY rating DESC
LIMIT 1;

-- =====================================================
-- SALES ANALYSIS
-- =====================================================

-- 11. Total revenue by month
SELECT month_name,
ROUND(SUM(total),2) AS revenue
FROM sales
GROUP BY month_name
ORDER BY revenue DESC;

-- 12. Month with highest COGS
SELECT month_name,
ROUND(SUM(cogs),2) AS total_cogs
FROM sales
GROUP BY month_name
ORDER BY total_cogs DESC;

-- 13. Revenue by city
SELECT city,
ROUND(SUM(total),2) AS revenue
FROM sales
GROUP BY city
ORDER BY revenue DESC;

-- 14. Revenue by branch
SELECT branch,
ROUND(SUM(total),2) AS revenue
FROM sales
GROUP BY branch
ORDER BY revenue DESC;

-- 15. Average sale value
SELECT
ROUND(AVG(total),2) AS average_sale
FROM sales;

-- 16. Revenue by day of week
SELECT day_name,
ROUND(SUM(total),2) AS revenue
FROM sales
GROUP BY day_name
ORDER BY revenue DESC;

-- 17. Sales by time of day
SELECT time_of_day,
COUNT(*) AS transactions
FROM sales
GROUP BY time_of_day
ORDER BY transactions DESC;

-- 18. Revenue by time of day
SELECT time_of_day,
ROUND(SUM(total),2) AS revenue
FROM sales
GROUP BY time_of_day
ORDER BY revenue DESC;

-- 19. Branch selling highest quantity
SELECT branch,
SUM(quantity) AS quantity_sold
FROM sales
GROUP BY branch
ORDER BY quantity_sold DESC;

-- 20. Branch generating highest gross income
SELECT branch,
ROUND(SUM(gross_income),2) AS gross_income
FROM sales
GROUP BY branch
ORDER BY gross_income DESC;

-- =====================================================
-- CUSTOMER ANALYSIS
-- =====================================================

-- 21. Customer type distribution
SELECT customer_type,
COUNT(*) AS customers
FROM sales
GROUP BY customer_type
ORDER BY customers DESC;

-- 22. Customer type generating highest revenue
SELECT customer_type,
ROUND(SUM(total),2) AS revenue
FROM sales
GROUP BY customer_type
ORDER BY revenue DESC;

-- 23. Customer type paying highest VAT
SELECT customer_type,
ROUND(SUM(vat),2) AS total_vat
FROM sales
GROUP BY customer_type
ORDER BY total_vat DESC;

-- 24. Gender distribution
SELECT gender,
COUNT(*) AS total_customers
FROM sales
GROUP BY gender;

-- 25. Gender-wise revenue
SELECT gender,
ROUND(SUM(total),2) AS revenue
FROM sales
GROUP BY gender
ORDER BY revenue DESC;

-- 26. Gender distribution by branch
SELECT branch,
gender,
COUNT(*) AS total_customers
FROM sales
GROUP BY branch, gender
ORDER BY branch;

-- 27. Average rating by customer type
SELECT customer_type,
ROUND(AVG(rating),2) AS average_rating
FROM sales
GROUP BY customer_type
ORDER BY average_rating DESC;

-- 28. Average rating by branch
SELECT branch,
ROUND(AVG(rating),2) AS average_rating
FROM sales
GROUP BY branch
ORDER BY average_rating DESC;

-- 29. Average rating by time of day
SELECT time_of_day,
ROUND(AVG(rating),2) AS average_rating
FROM sales
GROUP BY time_of_day
ORDER BY average_rating DESC;

-- 30. Average rating by day of week
SELECT day_name,
ROUND(AVG(rating),2) AS average_rating
FROM sales
GROUP BY day_name
ORDER BY average_rating DESC;

-- =====================================================
-- BONUS ANALYSIS
-- =====================================================

-- Revenue by payment method
SELECT payment,
ROUND(SUM(total),2) AS revenue
FROM sales
GROUP BY payment
ORDER BY revenue DESC;

-- Average purchase amount by city
SELECT city,
ROUND(AVG(total),2) AS average_purchase
FROM sales
GROUP BY city
ORDER BY average_purchase DESC;

-- Highest rated city
SELECT city,
ROUND(AVG(rating),2) AS average_rating
FROM sales
GROUP BY city
ORDER BY average_rating DESC;

-- Quantity sold by month
SELECT month_name,
SUM(quantity) AS quantity_sold
FROM sales
GROUP BY month_name
ORDER BY quantity_sold DESC;

-- Gross income by product line
SELECT product_line,
ROUND(SUM(gross_income),2) AS gross_income
FROM sales
GROUP BY product_line
ORDER BY gross_income DESC;