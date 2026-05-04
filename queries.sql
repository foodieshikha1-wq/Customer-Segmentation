UPDATE customer_shopping_data
SET total_spend = quantity * price;
SELECT SUM(total_spend) AS total_revenue
FROM customer_shopping_data;
SELECT category, SUM(total_spend) AS revenue
FROM customer_shopping_data
GROUP BY category
ORDER BY revenue DESC;
SELECT gender, SUM(total_spend) AS revenue
FROM customer_shopping_data
GROUP BY gender;
SELECT customer_id, SUM(total_spend) AS total_spend
FROM customer_shopping_data
GROUP BY customer_id
ORDER BY total_spend DESC;
SELECT TOP 10 customer_id, SUM(total_spend) AS total_spend
FROM customer_shopping_data
GROUP BY customer_id
ORDER BY total_spend DESC;
SELECT customer_id,
       SUM(total_spend) AS total_spend,
       CASE 
           WHEN SUM(total_spend) > 5000 THEN 'High'
           WHEN SUM(total_spend) > 2000 THEN 'Medium'
           ELSE 'Low'
       END AS segment
FROM customer_shopping_data
GROUP BY customer_id;
SELECT shopping_mall, SUM(total_spend) AS revenue
FROM customer_shopping_data
GROUP BY shopping_mall
ORDER BY revenue DESC;
SELECT MONTH(invoice_date) AS month,
       SUM(total_spend) AS revenue
FROM customer_shopping_data
GROUP BY MONTH(invoice_date)
ORDER BY month;
SELECT customer_id,
       AVG(total_spend) AS avg_spend
FROM customer_shopping_data
GROUP BY customer_id;
SELECT category,
       SUM(total_spend) * 100.0 / 
       (SELECT SUM(total_spend) FROM customer_shopping_data) AS percentage
FROM customer_shopping_data
GROUP BY category;
