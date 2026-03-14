-- Q1: Total sales revenue by product category for each month
SELECT 
  dp.category,
  MONTH(dd.date) AS month,
  SUM(fs.revenue) AS total_revenue
FROM fact_sales fs
JOIN dim_date dd ON fs.date_id = dd.date_id
JOIN dim_product dp ON fs.product_id = dp.product_id
GROUP BY dp.category, MONTH(dd.date)
ORDER BY month;

-- Q2: Top 2 performing stores by total revenue
SELECT ds.store_name, SUM(fs.revenue) AS total_revenue
FROM fact_sales fs
JOIN dim_store ds ON fs.store_id = ds.store_id
GROUP BY ds.store_id
ORDER BY total_revenue DESC
LIMIT 2;
