-- Add more customers

INSERT INTO Customers (customer_id, name, email, signup_date, city)
SELECT
    id,
    'Customer_' || id,
    'customer' || id || '@gmail.com',
    DATE '2022-01-01' + (random() * 1000)::INT,
    CASE 
        WHEN random() < 0.3 THEN 'Delhi'
        WHEN random() < 0.6 THEN 'Mumbai'
        ELSE 'Bangalore'
    END
FROM generate_series(51, 200) AS id;

-- Generate Orders

INSERT INTO Orders (order_id, customer_id, order_date, status)
SELECT
    id,
    (random() * 90 + 10)::INT,
    DATE '2023-01-01' + (random() * 730)::INT,
    'Delivered'
FROM generate_series(2000, 2300) AS id;

-- Matching OrderItems

INSERT INTO OrderItems (order_item_id, order_id, product_id, quantity, price)
SELECT
    id,
    id,
    (random() * 3 + 101)::INT,
    (random() * 3 + 1)::INT,
    (random() * 50000 + 1000)::NUMERIC(10,2)
FROM generate_series(2000, 2300) AS id;