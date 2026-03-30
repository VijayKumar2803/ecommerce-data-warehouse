-- Monthly Revenue
WITH MonthlyRevenue AS (
    SELECT d.year, d.month, SUM(f.total_amount) AS revenue
    FROM FactSales f
    JOIN DimDate d ON f.date_id = d.date_id
    GROUP BY d.year, d.month
)
SELECT * FROM MonthlyRevenue ORDER BY year, month;

-- Top Customers
SELECT c.customer_id, c.name, SUM(f.total_amount) AS total_spent,
RANK() OVER (ORDER BY SUM(f.total_amount) DESC)
FROM FactSales f
JOIN DimCustomer c ON f.customer_id = c.customer_id
GROUP BY c.customer_id, c.name;

-- CLTV
SELECT customer_id, SUM(total_amount) AS lifetime_value
FROM FactSales
GROUP BY customer_id;

-- YoY Growth
WITH YearlyRevenue AS (
    SELECT d.year, SUM(f.total_amount) AS revenue
    FROM FactSales f
    JOIN DimDate d ON f.date_id = d.date_id
    GROUP BY d.year
)
SELECT year, revenue,
LAG(revenue) OVER (ORDER BY year) AS prev_year,
(revenue - LAG(revenue) OVER (ORDER BY year)) * 100.0 /
LAG(revenue) OVER (ORDER BY year) AS yoy_growth
FROM YearlyRevenue;