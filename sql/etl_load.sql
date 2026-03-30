-- Load Dimensions

INSERT INTO DimCustomer (customer_id, name, city, start_date, end_date, is_current)
SELECT customer_id, name, city, CURRENT_DATE, NULL, TRUE
FROM Customers;

INSERT INTO DimProduct
SELECT product_id, name, category FROM Products;

INSERT INTO DimDate
SELECT DISTINCT
    order_date,
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date),
    EXTRACT(DAY FROM order_date)
FROM Orders;

-- Load Fact

INSERT INTO FactSales
SELECT
    oi.order_item_id,
    o.customer_id,
    oi.product_id,
    o.order_date,
    oi.quantity,
    oi.quantity * oi.price
FROM Orders o
JOIN OrderItems oi ON o.order_id = oi.order_id;